module FindComplexity where

calculateComplexity :: String -> Integer
calculateComplexity fileName = liftIO $ do
   content <- readFile $ fileName
   let lines = lines  content
   lineCount <- length $ lines
   return lineCount
