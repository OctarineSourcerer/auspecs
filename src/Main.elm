import Html exposing (..)
import Model exposing (..)

main = 
  Html.beginnerProgram { model = model, view = view, update = update }
  


-- Update
type Msg = Modify


update : Msg -> Model -> Model
update msg model = 
  case msg of
    Modify -> model


-- View

textList things =
  List.map (\el -> div [] [text el]) things

view : Model -> Html Msg
view model =
  div [] <|
    textList 
      [ model.name 
      , (toString model.cursed)
      , (toString model.ac)]