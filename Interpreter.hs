module Main where

import Tokens
import Grammar
import Type
import Eval

check :: [String] -> IO ()
check [] = error "Missing argument: Source file\n Usage: myinterpreter <filename>.cql"
check [p] = do b <- doesFileExist p
                   interpret p b
check _ = error "Too many arguments, Expected: 1\n Usage: myinterpreter <filename>.cql"

interpret :: String -> Bool -> IO ()
interpret p b | b = do text <- readFile p
                       errorHandle (parseCalc (alexScanTokens text))
               | otherwise = error ("Source file does not exist: " ++ p)

errorHandle :: E Prog -> IO ()
errorHandle (Ok t) = do result <- eval t
                        putStrLn result
errorHandle (Failed s) = error s

main = do args <- getArgs
          check args