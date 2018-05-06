import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Html.Events exposing (..)
import String exposing(..)

main = 
  Html.beginnerProgram { model = model, view = view, update = update }


-- Update
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

-- View

{-| A naive view that will display every field in the model. Field views are placed in a div.
  However, it will not give you control over the layout - mostly to be used for dev purposes.
-}

view : Model -> Html Msg
view model =
  let
    -- Attempt to convert a type to a message type, will give Invalid with the message
    tryConvert convert msg a =
      case (convert a) of
        Ok b ->
          msg b
        
        Err _ -> 
          Invalid
  in
    div [] 
      [ div [] 
          [ text model.name
          , input [ type_ "text", onInput Name ] []]
      , div []
          [ text model.cursed.name
          , input [ type_ "checkbox", onCheck Cursed ] []]
      , div []
          [ text model.ac.name  -- If
          , input [ type_ "number", onInput (tryConvert String.toInt AC)] []]]

{-| Style to give the message for "field not present" -}
nopeStyle : Attribute msg
nopeStyle =
  style
    [ ("width", "100%")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "center")
    , ("background-color", "#ff3333")
    , ("color", "#e60000")
    ]