module FindComplexity where
import Data.List

calculateComplexity :: String -> IO Integer
calculateComplexity fileName = do
   content <- readFile fileName
   return $ toInteger $ length $ lines content 
