module Type where
import Grammar
import Control.Monad.Error
--Data structures as defined in ToyGrammar:
--data ToyType = TyInt | TyBool | TyFun ToyType ToyType
--type Environment = [ (String,Expr) ]
--data Expr = TmInt Int | TmTrue | TmFalse | TmCompare Expr Expr 
--           | TmAdd Expr Expr | TmVar String 
--           | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
--           | TmLambda String ToyType Expr | TmApp Expr Expr
--           | Cl ( String ToyType Expr Environment)


type TypeEnv = [(String,Type)]

lookup1 :: String -> TypeEnv -> Maybe Type
lookup1 x [] = Nothing
lookup1 x env | x == (fst (head env)) =  Just (snd (head env))
              | otherwise = lookup1 x (tail env)

addBinding :: String -> Type -> TypeEnv -> TypeEnv
addBinding x typ [] = [(x,typ)]
addBinding x typ ((y,e):env) | x == y = (y,e):env
                             | otherwise = (y,e):(addBinding x typ env)

{-
unparse1 :: Type -> String
unparse1 (TyInt) = "type Int"
unparse1 (TyBool) = "type Bool"
unparse1 _ = "Unknown"
-}

data TypeError = TypeMismatch Type Type | NotFound  deriving Eq

instance Error TypeError where
    noMsg = NotFound
     

instance Show TypeError where
    show (TypeMismatch a b) = "Type Mismatch: " ++ show a ++ " is not " ++ show b
    show (NotFound) = "Variable not found in type environment"

typeof :: (Expr,TypeEnv) -> Either TypeError Type
typeof (expr,env) = case expr of 
    TmInt x -> return TyInt
    TmTrue -> return TyBool
    TmStream x -> return TyStream
    TmFalse -> return TyBool
    TmVar x -> do
        let type1 = lookup1 x env
        if (type1 == Just TyInt)
        then return TyInt
        else 
            if (type1 == Just TyBool)
            then return TyBool
            else
                if (type1 == Just TyStream)
                then return TyStream
                else throwError $ NotFound

    TmLessThan e1 e2 -> do
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,env)
        if te1 /= TyInt 
        then throwError $ TypeMismatch te1 TyInt
        else 
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else return TyBool

    TmEqualTo e1 e2 -> do
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,env)
        if te1 /= TyInt 
        then throwError $ TypeMismatch te1 TyInt
        else 
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else return TyBool

    TmAdd e1 e2 -> do
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,env)
        if (te1) /= TyInt 
        then throwError $ TypeMismatch te1 TyInt
        else 
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else return TyInt

    TmMulti e1 e2 -> do
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,env)
        if (te1) /= TyInt 
        then throwError $ TypeMismatch te1 TyInt
        else 
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else return TyInt

    TmSubtract e1 e2 -> do
            te1 <- typeof (e1,env)
            te2 <- typeof (e2,env)
            if (te1) /= TyInt
            then throwError $ TypeMismatch te1 TyInt
            else
                if te2 /= TyInt
                then throwError $ TypeMismatch te2 TyInt
                else return TyInt

    TmDivide e1 e2 -> do
                te1 <- typeof (e1,env)
                te2 <- typeof (e2,env)
                if (te1) /= TyInt
                then throwError $ TypeMismatch te1 TyInt
                else
                    if te2 /= TyInt
                    then throwError $ TypeMismatch te2 TyInt
                    else return TyInt

    TmIf e1 e2 e3 -> do
        te1 <- typeof (e1,env)
        if te1 /= TyBool
        then throwError $ TypeMismatch te1 TyBool
        else return TyBool

    TmBreak (TmAssign t x e) e2 -> do 
        te2 <- typeof(e2, addBinding x t env) 
        return te2 

    TmBreak e1 e2 -> do 
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,getEnv (e1,env))
        return te2
    
    TmAssign t x e -> do
        te <-typeof(e,env)
        if te /= t 
        then throwError $ TypeMismatch te t
        else return t


    TmWhile e1 e2 -> do
           te1 <- typeof (e1,env)
           te2 <- typeof (e2,env)
           if te1 /= TyBool
           then throwError $ TypeMismatch te1 TyBool
           else return te2

    TmGet x n -> do
         let te1 = lookup1 x env
         if te1 /= Just TyStream
         then throwError $ NotFound
         else return TyStream

    TmRemoveElem x n -> do
         let te1 = lookup1 x env
         if te1 /= Just TyStream
         then throwError $ NotFound
         else return TyStream

    TmGetSize x -> do
        let te1 = lookup1 x env
        if te1 /= Just TyStream
        then throwError $ NotFound
        else return TyInt

    TmAddElem x e -> do
        let te1 = lookup1 x env
        te2 <- typeof(e,env)
        if te1 /= Just TyStream
        then throwError $ NotFound
        else
            if te2 /= TyStream
            then throwError $ TypeMismatch te2 TyStream
            else return te2

    TmInsertElem x n1 n2 -> do
        let te1 = lookup1 x env
        te2 <- typeof(n1,env)
        te3 <- typeof(n2,env)
        if te1 /= Just TyStream
        then throwError $ NotFound
        else
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else
                if te3 /= TyInt
                then throwError $ TypeMismatch te3 TyInt
                else return te3

    TmDeleteElem x n -> do
        let te1 = lookup1 x env
        if te1 /= Just TyStream
        then throwError $ NotFound
        else return TyStream

    TmZip x x2 -> do
        let te1 = lookup1 x env
        let te2 = lookup1 x2 env
        if te1 /= Just TyStream
        then throwError $ NotFound
        else
            if te2 /= Just TyStream
            then throwError $ NotFound
            else return TyStream

    TmGetElem x n1 n2 -> do
        let te1 = lookup1 x env
        te2 <- typeof(n1,env)
        te3 <- typeof(n2,env)
        if te1 /= Just TyStream
        then throwError $ NotFound
        else
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else
                if te3 /= TyInt
                then throwError $ TypeMismatch te3 TyInt
                else return te3


    TmComment x -> return TyString

-- Idk how this work, but it does (save the environment when it sees TmBreak)
getEnv :: (Expr,TypeEnv) -> TypeEnv
getEnv ((TmAssign t x e),env) = (addBinding x t env)
getEnv ((TmBreak (TmAssign t x e) e2),env) = getEnv (e2,(addBinding x t env))
getEnv ((TmBreak e1 e2),env) = getEnv (e2,getEnv(e1,env))
getEnv (_,env) = env


result :: Either TypeError Type -> String
result (Left e) = show e
result (Right e) = "No type error was found"

