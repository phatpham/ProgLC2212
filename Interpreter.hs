import Tokens
import Grammar
import Eval
import Type
import System.Environment
import Control.Exception
import System.IO
import System.Directory
import Data.Char(toUpper)

main :: IO ()
main = do (fileName : _ ) <- getArgs
          check [fileName] 
          perfectEval fileName

check :: [String] -> IO()
check [] = error "Missing files"
check [f1] = do ar1 <- doesFileExist f1
                interpret f1 
check _ = error "Incorrect argument, Expected: 1\n Usage: Interpreter.hs"

interpret :: FilePath -> IO ()
interpret f1  = catch (perfectEval f1) (noParse f1 )
                  

{-
perfectEval :: FilePath -> FilePath -> IO ()
perfectEval fileName programName = do r <- readFile fileName
                                      let eachLine = lines (r)
                                      let ls = map (split ' ') eachLine
                                      let stream = parseCalc (alexScanTokens (show ls))
                                      r2 <- readFile programName
                                      let parsedProg = parseCalc (alexScanTokens r2)
                                      let typeCheck = (result (typeof (parsedProg,[])))
                                      if (typeCheck == "No type error was found")
                                      --Evaluate if right type
                                      then writeFile "output.txt" (show (fst (eval (parsedProg,[("stream",stream)]))))
                                      --Print error if not valid type
                                      else putStrLn (typeCheck)

main' = do (filename : _) <- getArgs
           sourceText <- readFile filename
           let eachLine = lines (sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))
           let typeCheck = (result (typeof (parsedProg,[])))
           if (typeCheck == "No type error was found")
          --Evaluate if right type
           then putStrLn (printEval (run parsedProg))
          --Print error if not valid type
           else putStrLn (typeCheck)
           --main'
           --putStrLn (show x)
           --printResult ls
-}






noParse :: String -> ErrorCall -> IO ()
noParse f1 e = do let err =  show e
                  putStrLn("----------------")
                  hPutStrLn stderr err
                  putStrLn("----------------")
                   


