module Model exposing (..)
import Composite exposing (..)

type alias Entry a = 
  { a 
  | name : String
  , description : Maybe String }

type alias Stat a = Composite (Entry {}) a
stat name desc val =
  { name = name
  , description = desc
  , base = val
  , modifiers = []
  }
setBase stat newBase =
  { stat | base = newBase }

-- Model. Have to do this with map for now, as a custom model would require a different message type for each diff field
-- However, CHANGE this if you end up being containing how to get/set within in a message. Lenses?
-- Look at ".field thing" syntax in http://elm-lang.org/docs/records
type alias Model = 
  { name : String
  , cursed : Stat Bool
  , ac : Stat Int
  }


model = 
  { name = "Dan"
  , cursed = stat "Cursed" (Just "Whether your character is cursed") False
  , ac = stat "AC" (Just "How hard your character is to hit") 10
  }