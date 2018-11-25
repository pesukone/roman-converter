module Main where

import Converter (toIntArray, toNum)
import Validation (validate)
import Data.Char

main :: IO ()
main = do
    putStrLn "Enter a Roman number:"
    number <- getLine
    let numberArray = validate $ sequence $ toIntArray (map toUpper number)
    putStrLn $ case numberArray of
                Nothing -> "The number is invalid"
                Just x -> show $ toNum x
