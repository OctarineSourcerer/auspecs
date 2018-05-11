module Stat exposing (..)

-- Multiple modifiers strung together
-- source, destination, actual modification
type alias Modifier a =
  { source : String -- String, as we're assuming these are label names that should probably be unique
  , target : String
  , change : a -> a
  , modString : String } -- Describing the modification, eg +3 or such

type alias Stat a =
  { name : String
  , description : Maybe String
  , base : a
  , modifiers : List (Modifier a)}

{-| Constructor to create a stat with a base and no modifiers -}
stat : String -> Maybe String -> a -> Stat a
stat name desc val =
  { name = name
  , description = desc
  , base = val
  , modifiers = []
  }
{-| Set the base of a given stat -}
setBase stat newBase =
  { stat | base = newBase }

{-| Calculate the overall result of a stat.
  Starts at `base`, then applies each modifier in sequence
-}
total c =
  let 
    changes =
      List.map .change c.modifiers
  in
    List.foldl (\f x -> f x) c.base changes