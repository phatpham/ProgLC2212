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
addBinding x typ ((y,e):env) | (x,typ) == (y,e) = env 
                             | otherwise = (y,e):(addBinding x typ env)

{-
unparse1 :: Type -> String
unparse1 (TyInt) = "type Int"
unparse1 (TyBool) = "type Bool"
unparse1 _ = "Unknown"
-}

data TypeError = TypeMismatch Type Type | NotFound  deriving Eq

instance Show TypeError where
    show (TypeMismatch a b) = "Type Mismatch: " ++ show a ++ " is not " ++ show b
    show (NotFound) = "Variable not found in type environment"

typeof :: (Expr,TypeEnv) -> Either TypeError Type
typeof (expr,env) = case expr of 
    TmInt x -> return TyInt
    TmTrue -> return TyBool
    TmFalse -> return TyBool
    TmVar x -> do
        let type1 = lookup1 x env
        if (type1 == Just TyInt)
        then return TyInt
        else 
            if (type1 == Just TyBool)
            then return TyBool
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
        te2 <- typeof (e2,env)
        te3 <- typeof (e3,env)
        if te1 /= TyBool
        then throwError $ TypeMismatch te1 TyBool
        else
            if te2 /= te3
            then throwError $ TypeMismatch te2 TyBool
            else return te3

    TmBreak (TmAssign t x e) e2 -> do 
        te2 <- typeof(e2, addBinding x t env) 
        return te2 

    TmBreak e1 e2 -> do 
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,getEnv (e1,env))
        return te2
    
    TmAssign t x e -> do
        return t

-- I am still not sure how this thing works :D
    TmStream e -> do
        te1 <- typeof (e, env)
        return te1

-- Idk how this work, but it does (save the environment when it sees TmBreak)
getEnv :: (Expr,TypeEnv) -> TypeEnv
getEnv ((TmAssign t x e),env) = (addBinding x t env)
getEnv ((TmBreak (TmAssign t x e) e2),env) = getEnv (e2,(addBinding x t env))
getEnv ((TmBreak e1 e2),env) = getEnv (e2,getEnv(e1,env))
getEnv (_,env) = env


result :: Either TypeError Type -> String 
result (Left e) = show e
result (Right e) = "No type error was found"

