module Main where

import Converter

main :: IO ()
main = do
    putStrLn "Enter a Roman number:"
    number <- getLine
    let numberArray = sequence $ toIntArray number
    putStrLn $ case numberArray of
                Nothing -> "The number is invalid"
                Just x -> show $ toNum x
