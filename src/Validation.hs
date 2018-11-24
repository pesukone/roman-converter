module Validation where

validate :: Maybe [Integer] -> Maybe [Integer]
validate = nonEmpty

nonEmpty list = if null list
                    then Nothing
                    else list


