module Validation where

import Data.List

validate :: Maybe [Integer] -> Maybe [Integer]
validate list = list >>= nonEmpty >>= noFourInRow

nonEmpty list = if null list
                    then Nothing
                    else Just list

noFourInRow list = if maximum (map length (group list)) > 3
                        then Nothing 
                        else Just list
