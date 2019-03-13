module Eval where
import Grammar


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
	
eval (TmAdd e1 e2,env) = evalLoop (e1,env)  evalLoop (e2,env)
eval (TmIf e1 e2 e3 ,env) = if ((evalLoop (e1,env)) == TmTrue) 
                            then (evalLoop (e2,env), env) 
                            else (evalLoop (e3, env), env) 

eval ((TmBreak e1 e2),env) = (evalLoop (e2,env'),env') where (e,env') = eval (e1,env) 


evalLoop :: State -> Expr 
evalLoop (e,env) = if (isValue e) then e else evalLoop (e', env')
                                         where (e',env') = eval (e,env)

evalLoop2 :: State -> State
evalLoop2 (e,env) = if  (isValue (fst (firstEval))) then (firstEval) else evalLoop2 (firstEval)
         where firstEval = eval (e,env)

