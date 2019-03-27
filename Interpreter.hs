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
          interpret fileName

check :: [String] -> IO()
check [] = error "Missing files"
check [f1] = do ar1 <- doesFileExist f1
                interpret f1
check _ = error "Incorrect argument, Expected: 1\n Usage: Interpreter.hs"

interpret :: FilePath -> IO ()
interpret f1  = catch (perfectEval f1) (noParse f1 )

noParse :: String -> ErrorCall -> IO ()
noParse f1 e = do let err =  show e
                  putStrLn("----------------")
                  hPutStrLn stderr err
                  putStrLn("----------------")



