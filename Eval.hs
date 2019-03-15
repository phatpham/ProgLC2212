module Eval where
import Grammar


-- Look up a value in an environment and unpack it
getValueBinding :: String -> Environment -> (Expr,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = (e,(y,e):env)
                                | otherwise = getValueBinding x env

-- Update environment
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
eval (TmInt n,env) = (TmInt n,env)
eval (TmTrue,env) = (TmTrue,env)
eval (TmFalse,env) = (TmFalse,env)
eval ((TmAssign t x e),env) = (e, update env x e)
eval ((TmVar x),env) = (e',env') 
                    where (e',env') = getValueBinding x env

eval ((TmLessThan (TmInt n1) (TmInt n2)),env) =
    if (n1 < n2)
    then (TmTrue,env)
    else (TmFalse,env)
	
eval ((TmEqualTo (TmInt n1) (TmInt n2)),env) = 
    if (n1 == n2)
    then (TmTrue,env)
    else (TmFalse,env)
	
eval (TmAdd (TmInt n1) (TmInt n2),env) = (TmInt (n1+n2),env)
eval (TmAdd e1 e2,env) = (eval ((TmAdd fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                    sndEval = fst (eval (e2,env))

eval (TmMulti (TmInt n1) (TmInt n2), env) = (TmInt (n1*n2),env)
eval (TmMulti e1 e2, env) = (eval ((TmMulti fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                         sndEval = fst (eval (e2,env))

eval (TmSubtract (TmInt n1) (TmInt n2), env) = (TmInt (n1-n2),env)
eval (TmSubtract e1 e2, env) = (eval ((TmSubtract fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                               sndEval = fst (eval (e2,env))
{-
eval (TmDivide (TmInt n1) (TmInt n2), env) = (TmInt (n1 / n2),env)
eval (TmDivide e1 e2, env) = (eval ((TmDivide fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                           sndEval = fst (eval (e2,env))

-}

eval (TmIf e1 e2 e3 ,env) = if (fst (eval (e1,env)) == TmTrue) 
                            then (eval (e2,env)) 
                            else (eval (e3,env)) 

eval ((TmBreak e1 e2),env) = (eval (e2,env')) where (e,env') = eval (e1,env) 


{-evalLoop :: State -> Expr 
evalLoop (e,env) = if (isValue e) then e else evalLoop (e', env')
                                         where (e',env') = eval (e,env)

evalLoop2 :: State -> State
evalLoop2 (e,env) = if  (isValue (fst (firstEval))) then (firstEval) else evalLoop2 (firstEval)
         where firstEval = eval (e,env)-}

		 
run :: Expr -> Expr
run e = fst $ (eval (e,[]))


run2 :: Expr -> State
run2 e = eval (e,[])

printEval :: Expr -> String
printEval (TmInt n) = show n
printEval (TmTrue) = "True"
printEval (TmFalse) = "False"
printEval _ = "Evaluation unsuccessful"
