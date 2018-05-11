module Model exposing (..)
import Stat exposing (..)

type alias Expandable a = 
  { a 
  | expanded : Bool }

type alias ViewStat a = Expandable (Stat a)
viewStat name desc val = 
  { name = name
  , description = desc
  , base = val
  , modifiers = []
  , expanded = False
  }

type alias Model = 
  { name : String
  , cursed : Stat Bool
  , strength : ViewStat Int
  , ac : ViewStat Int
  }

model : Model
model = 
  { name = "Dan"
  , cursed = stat "Cursed" (Just "Whether your character is cursed") False
  , ac = 
    { name = "AC"
    , description = Just "Armor Class. How hard your character is to hit"
    , base = 10
    , modifiers = 
      [ Modifier "Full Plate" "AC" ((+) 3) "+3"
      , Modifier "Dodge Feat" "AC" ((+) 1) "+1"
      , Modifier "Shieldy boi" "AC" ((+) 2) "+2"
      ]
    , expanded = False }
  , strength = viewStat "Strength" (Just "How jacked your character is") 18
  }