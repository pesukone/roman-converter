module Validation where

import Data.List

validate :: Maybe [Integer] -> Maybe [Integer]
validate list = list 
                    >>= check (not . null)
                    >>= check noFourInRow
                    >>= check noTooGreatDifferences

check :: ([Integer] -> Bool) -> [Integer] -> Maybe [Integer]
check f list = if f list
                    then Just list
                    else Nothing

noFourInRow list = maximum (map length (group list)) <= 3

noTooGreatDifferences [] = True
noTooGreatDifferences [x] = True
noTooGreatDifferences (x:xs) = (head xs <= 10 * x) && noTooGreatDifferences xs
