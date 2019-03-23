module Main where
import Tokens
import Grammar
import Eval
import Type
import System.Environment
import Control.Exception
import System.IO
import System.Directory

main :: IO ()
main = do args <- getArgs
          check args

check :: [String] -> IO()
check[] = error "Missing argument: Source file\n Usage: Interpreter.hs"
check [p] = do b <- doesFileExist p
               interpret p b
check _ = error "Incorrect argument, Expected: 1\n Usage: Interpreter.hs"

interpret :: String -> Bool -> IO ()
interpret p b | b = catch main' noParse
              | otherwise = error ("Source file doesn't exist: " ++ p)
{-
main' = do (filename : _) <- getArgs
           sourceText <- readFile filename
           putStrLn ("Toy Interactive Mode - enter an expression : ")
           --sourceText <- readLine args
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))
           let typeCheck = (result (typeof (parsedProg,[])))
           if (typeCheck == "No type error was found")
           --Evaluate if right type
           then putStrLn (printEval (run parsedProg))
           --Print error if not valid type
           else putStrLn (typeCheck)

-}
           
main' = do (filename : _) <- getArgs
           sourceText <- readFile filename
           let eachLine = lines (sourceText)
           let ls = (map (split ' ') eachLine)
           let mapInt = map readInt ls
           --Prints results after each function for testing
           putStrLn (show ls)
           putStrLn (show mapInt)
           putStrLn (show eachLine)
           -- I am using show() to convert mapInt to String so alex can scan it and convert it
           let parsedProg = parseCalc (alexScanTokens (show mapInt))
           putStrLn ("Parsed as " ++ (show parsedProg))
           --putStrLn (printEval (run parsedProg)


noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               putStrLn("----------------")
               hPutStrLn stderr err
               putStrLn("----------------")
               main

-- Converts the string input to Int values
readInt :: [String] -> [Int]
readInt [] = []
readInt (x:xs) = (read x::Int):(readInt xs)
