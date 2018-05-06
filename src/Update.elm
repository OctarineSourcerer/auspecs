module Update exposing (..)
import Model exposing (Model, setBase)

type Msg 
  = Name String
  | Cursed Bool
  | AC Int
  | Invalid

update : Msg -> Model -> Model
update msg model = 
  case msg of
    Name name ->
      { model | name = name }

    Cursed cursed ->
      { model | cursed = setBase model.cursed cursed }

    AC ac ->
      { model | ac = setBase model.ac ac }

    Invalid ->
      model