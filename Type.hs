import ToyGrammar
import Control.Monad.Error
--Data structures as defined in ToyGrammar:
--data ToyType = TyInt | TyBool | TyFun ToyType ToyType
--type Environment = [ (String,Expr) ]
--data Expr = TmInt Int | TmTrue | TmFalse | TmCompare Expr Expr 
--           | TmAdd Expr Expr | TmVar String 
--           | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
--           | TmLambda String ToyType Expr | TmApp Expr Expr
--           | Cl ( String ToyType Expr Environment)


type TypeEnv = [(String,ToyType)]

lookup1 :: String -> TypeEnv -> ToyType
lookup1 x [] = error "Type not found"
lookup1 x env | x == (fst (head env)) =  snd (head env)
              | otherwise = lookup1 x (tail env)
			 
addBinding :: String -> ToyType -> TypeEnv -> TypeEnv
addBingdin x typ [] = []
addBinding x typ ((y,e):env) | (x,typ) == (y,e) = env 
                              | otherwise = (y,e):(addBinding x typ env)

unparse1 :: ToyType -> String
unparse1 (TyInt) = "type Int"
unparse1 (TyBool) = "type Bool"
unparse1 (TyFun ty1 ty2) = "Function"
unparse1 _ = "Unknown"

data TypeError = TypeMismatch ToyType ToyType deriving (Show,Eq)

typeof :: Expr -> Either TypeError ToyType
typeof expr = case expr of 
    TmInt x -> return TyInt
    TmTrue -> return TyBool
    TmFalse -> return TyBool
    TmCompare e1 e2 -> do
        te1 <- typeof e1
        te2 <- typeof e2
        if te1 /= TyInt 
        then throwError $ TypeMismatch te1 TyInt
        else 
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else return TyBool			
		
    TmAdd e1 e2 -> do
        te1 <- typeof e1
        te2 <- typeof e2
        if te1 /= TyInt 
        then throwError $ TypeMismatch te1 TyInt
        else 
            if te2 /= TyInt
            then throwError $ TypeMismatch te2 TyInt
            else return TyInt		
		
    TmIf e1 e2 e3 -> do
        te1 <- typeof e1
        te2 <- typeof e2
        te3 <- typeof e3
        if te1 /= TyBool
        then throwError $ TypeMismatch te1 TyInt
        else
            if te2 /= te3
            then throwError $ TypeMismatch te2 TyInt
            else return te3
 	
    TmLet x typ e1 e2 -> do 
        te1 <- typeof e1
        te2 <- typeof e2
        if typ /= te1 
        then return (error "Type not found")
        else return te2
    
    TmLambda x typ e1 -> do 
        te1 <- typeof e1
        return te1

