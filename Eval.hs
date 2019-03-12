module Eval where
import Grammar

{-
data Value = VInt Int | VBool Bool deriving Show
-- Function to unpack a closure to extract the underlying lambda term and environment
unpack :: Expr -> (Expr,Environment)
unpack (Cl x t e env1) = ((TmLambda x t e) , env1)
unpack e = (e,[])
-}

-- Look up a value in an environment and unpack it
getValueBinding :: String -> Environment -> (Expr,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = (e,(y,e):env)
                              | otherwise = getValueBinding x env

update :: Environment -> String -> Expr -> Environment
update env x e = (x,e) : env

-- Checks for terminated expressions
isValue :: Expr -> Bool
isValue (TmInt _) = True
isValue TmTrue = True
isValue TmFalse = True
isValue _ = False

--Data structures as defined in ToyGrammar:
--data ToyType = TyInt | TyBool | TyFun ToyType ToyType
--type Environment = [ (String,Expr) ]
--data Expr = TmInt Int | TmTrue | TmFalse | TmCompare Expr Expr 
--           | TmAdd Expr Expr | TmVar String 
--           | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr

type State = (Expr, Environment) 

eval :: State -> State 
eval ((TmAssign x e),env) = (e, update env x e)
eval ((TmVar x),env) = (e',env') 
                    where (e',env') = getValueBinding x env
					
eval ((TmLessThan (TmInt n1) (TmInt n2)),env) = 
    if n1 < n2 
    then (TmTrue,env)
    else (TmFalse,env)
	
eval ((TmEqualTo (TmInt n1) (TmInt n2)),env) = 
    if (n1 == n2)
    then (TmTrue,env)
    else (TmFalse,env)
	
eval ((TmAdd (TmInt n1) (TmInt n2)),env) = ((TmInt (n1+n2)),env)
eval (TmIf e1 e2 e3 ,env) = if ((evalLoop (e1,env)) == TmTrue) then (evalLoop (e2,env), env) else (evalLoop (e3, env), env) 


evalLoop :: (Expr, Environment) -> Expr 
evalLoop (e,env) = if (isValue e) then e else evalLoop (e', env')
                                         where (e',env') = eval (e,env)


{-
eval :: Environment -> Expr -> Maybe Value
eval env expr = case expr of 
    TmInt n -> return (VInt n)
    TmTrue -> return (VBool True)
    TmFalse -> return (VBool False)
	
    TmCompare (TmInt n1) (TmInt n2)  -> 
        if n1 < n2 
        then return (VBool True)
        else return (VBool False)
    TmAdd (TmInt n1) (TmInt n2) -> return (VInt (n1 + n2))
    {-TmIf e1 e2 e3 ->
        if (e1 == TmTrue)
        then Just e2
        else Just e3 -} -}

