module Main where

import Converter

main :: IO ()
main = do
    putStrLn "Enter a Roman number:"
    asd <- getLine
    putStrLn $ case sequence $ toIntArray asd of
                Nothing -> "Invalid number"
                Just x -> show $ toNum x
