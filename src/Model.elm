module Model exposing (..)
import Dict exposing (..)

-- Supported field types
type FieldType 
  = String_ String
  | Int_ Int
  | Bool_ Bool

type alias Field = 
  { name : String
  , description : Maybe String 
  , value : FieldType 
  }

-- Model. Have to do this with map for now, as a custom model would require a different message type for each diff field
-- However, CHANGE this if you end up being containing how to get/set within in a message. Lenses?
type alias Model = 
  { fields : Dict String Field
  }


model = 
  let
    fieldEntry name desc val =
      (name, Field name desc val)
  in
    { fields = Dict.fromList 
        [ fieldEntry "Name" Nothing (String_ "Dan") 
        , fieldEntry "Cursed" (Just "Whether your character is cursed") (Bool_ True)
        , fieldEntry "AC" (Just "How hard it is to hit your character") (Int_ 10)]}