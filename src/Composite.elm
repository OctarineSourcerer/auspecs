module Composite exposing (..)

-- Multiple modifiers strung together
-- source, destination, actual modification
type alias Modifier a =
  { source : String -- String, as we're assuming these are label names that should probably be unique
  , target : String
  , change : a -> a
  , modString : String } -- Describing the modification, eg +3 or such

type alias Composite a b =
  { a |
    base : b
  , modifiers : List (Modifier b)}

{-| Calculate the overall result of a composite.
  Starts at `base`, then applies each modifier in sequence
-}
result c =
  let 
    changes =
      List.map .change c.modifiers
  in
    List.foldl (\f x -> f x) c.base changes

