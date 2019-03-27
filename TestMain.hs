module TestMain where
import System.Environment
import System.Directory

main :: IO ()
main = do args <- getContents
          putStrLn (show args)

