module Model exposing (..)

-- Model
type alias Model = 
  { name : String
  , cursed : Bool 
  , ac : Int }


model = 
  { name = "Dan"
  , cursed = False
  , ac = 10 }