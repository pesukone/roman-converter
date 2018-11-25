module Main where

import Converter
import Validation

main :: IO ()
main = do
    putStrLn "Enter a Roman number:"
    number <- getLine
    let numberArray = validate . sequence $ toIntArray number
    putStrLn $ case numberArray of
                Nothing -> "The number is invalid"
                Just x -> show $ toNum x
