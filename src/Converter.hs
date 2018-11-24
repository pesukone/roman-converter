module Converter where

charToInt 'I' = Just 1
charToInt 'V' = Just 5
charToInt 'X' = Just 10
charToInt 'L' = Just 50
charToInt 'C' = Just 100
charToInt 'D' = Just 500
charToInt 'M' = Just 1000
charToInt _ = Nothing

toIntArray = map charToInt

toNum :: [Integer] -> Integer
toNum [] = 0
toNum [x] = x
toNum (x:xs:xss) = if x >= xs
                       then x + toNum (xs:xss)
                       else xs - x + toNum xss
