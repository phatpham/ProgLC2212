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
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs
           perfectEval fileName

noParse ::  ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStrLn stderr err
               return ()



