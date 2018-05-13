import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Html.Events exposing (..)
import String exposing(..)
import Update exposing (..)
import Stat exposing (..)
import StatViews exposing (..)

main = 
  Html.beginnerProgram { model = model, view = view, update = update }

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

    statField stat field inputAttrs =
      let
        attrs =
          [ value (stat |> total |> toString)
          , disabled (not <| List.isEmpty stat.modifiers)] -- If no modifiers, we can modify fine
          ++ inputAttrs
      in
        div [entryStyle]
          [ breakdown stat field [] ]
    -- Could probably put various types of input arrs in here for when sheet gets bigger
  in
    div [style [("width", "40%")]] 
      [ div [entryStyle] 
        [ text "Name"
        , input [ type_ "text", onInput <| SetString Name, value model.name ] []]
      , div [entryStyle] 
        [ text "Cursed"
        , input [ type_ "checkbox", onCheck <| SetBool Cursed ] []]
      , statField model.ac (Int_ AC)
        [ type_ "number", onInput (tryConvert String.toInt (SetInt AC))]
        -- Demo field for now - this and expanding this will be put into statField
      ]

{-| Style to give the message for "field not present" -}
entryStyle : Attribute msg
entryStyle =
  style
    [ ("width", "100%")
    , ("padding", "10px 0")
    , ("font-size", "18px")
    , ("text-align", "center")
    , ("border", "2px solid #232323")
    , ("border-radius", "4px")
    , ("margin", "5px")
    ]