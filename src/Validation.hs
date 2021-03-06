module Validation where

import Data.List

-- Yes, I know all this could be done with a single regex

validate :: Maybe [Integer] -> Maybe [Integer]
validate list = list 
                    >>= check (not . null)
                    >>= check noFourInRow
                    >>= check noTooGreatDifferences
                    >>= check dlvNotRepeated
                    >>= check onlyOnePreceedingSymbol
                    >>= check previousTwoNotSmaller
                    >>= check sameSymbolNotOnBothSides

check :: ([Integer] -> Bool) -> [Integer] -> Maybe [Integer]
check f list = if f list
                    then Just list
                    else Nothing

noFourInRow :: [Integer] -> Bool
noFourInRow list = maximum (map length (group list)) <= 3

dlvNotRepeated :: [Integer] -> Bool
dlvNotRepeated list = null [ x | x <- concat filtered, x `elem` [5,50,500] ]
    where filtered = [ xs | xs <- group list, length xs > 1 ]

noTooGreatDifferences :: [Integer] -> Bool
noTooGreatDifferences [] = True
noTooGreatDifferences [x] = True
noTooGreatDifferences (x:xs) = (head xs <= 10 * x) && noTooGreatDifferences xs

onlyOnePreceedingSymbol :: [Integer] -> Bool
onlyOnePreceedingSymbol list = onlyOnePreceedingSymbol' (group list)

onlyOnePreceedingSymbol' [] = True
onlyOnePreceedingSymbol' [x] = True
onlyOnePreceedingSymbol' (x:xs) = (length x == 1 || head (head xs) < head x) && onlyOnePreceedingSymbol' xs

previousTwoNotSmaller :: [Integer] -> Bool
previousTwoNotSmaller [] = True
previousTwoNotSmaller [x] = True
previousTwoNotSmaller [x,xs] = True
previousTwoNotSmaller (x:xs:xss) = (x >= xs || x >= head xss || xs > head xss) && previousTwoNotSmaller (xs:xss)

sameSymbolNotOnBothSides :: [Integer] -> Bool
sameSymbolNotOnBothSides list = sameSymbolNotOnBothSides' $ group list

sameSymbolNotOnBothSides' [] = True
sameSymbolNotOnBothSides' [x] = True
sameSymbolNotOnBothSides' [x,xs] = True
sameSymbolNotOnBothSides' (x:xs:xss) = not (head x == head (head xss)) && sameSymbolNotOnBothSides' (xs:xss)
