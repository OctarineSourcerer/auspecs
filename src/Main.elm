import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Dict exposing (..)
import Html.Events exposing (..)
import String exposing(..)

main : Program Never { fields : Dict String Field } Msg
main = 
  Html.beginnerProgram { model = model, view = view, update = update }


-- Update
type Msg 
  = ChangeField Field

update : Msg -> Model -> Model
update msg model = 
  case msg of
    ChangeField f ->
      { model | fields = Dict.insert f.name f model.fields }

-- View

{-| Create HTML elements to view and edit the named Field in the `model`.
  They should give a name, and a control.
  Should the named Field not exist, you get a giant banner saying "No `fieldName` in model"
-}

fieldView model name =
  let
    modelField = get name model.fields

    inp kind val event newRec =
      input [ type_ kind, event newRec, value val ] []

    fromInput field f =
      (\x -> ChangeField { field | value = f x })

    inputField field = 
      case field.value of
        String_ s -> 
          inp "text" s onInput (fromInput field String_)

        Int_ i    -> 
          inp "number" (toString i) onInput (fromInput field (String.toInt >> Result.withDefault i >> Int_)) 
       
        Bool_ b   -> 
          inp "checkbox" (toString b) onCheck (fromInput field Bool_)
          
  in
    case modelField of
      -- If it's not in the model, indicate this LOUDLY. Done cos models have to use maps for now, so field access not safe
      Nothing ->
        div [ nopeStyle ] [ text ("No " ++ name ++ " field in model") ]

      Just f  ->
        div [] 
          [ text name
          , inputField f ]


{-| A naive view that will display every field in the model. Field views are placed in a div.
  However, it will not give you control over the layout - mostly to be used for dev purposes.
-}
naiveView : Model -> Html Msg
naiveView model =
  div [] <| List.map (fieldView model) (Dict.keys model.fields)

view : Model -> Html Msg
view model =
  naiveView model

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