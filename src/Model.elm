module Model exposing (..)
import Stat exposing (..)

type alias Expandable a = 
  { a 
  | expanded : Bool }

type alias ViewStat a = Expandable (Stat a)

-- Model. Have to do this with map for now, as a custom model would require a different message type for each diff field
-- However, CHANGE this if you end up being containing how to get/set within in a message. Lenses?
-- Look at ".field thing" syntax in http://elm-lang.org/docs/records
type alias Model = 
  { name : String
  , cursed : Stat Bool
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
  }