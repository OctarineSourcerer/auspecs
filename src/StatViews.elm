module StatViews exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (ViewStat)
import Stat exposing (total)
import Update exposing (..)

-- Possibly use the Style Elements library
-- http://package.elm-lang.org/packages/mdgriffith/style-elements/latest
breakdown : ViewStat a -> Field -> List (Html.Attribute msg) -> Html Msg
breakdown stat field viewStyle =
  let 
    -- Box describing a single modifier
    modBox big small =
      div [style [ ("margin", "5px")
                 , ("padding-right", "5px")
                 , ("display", "inline-block")
                 , ("border-right", "1px solid #000")]] 
        [ div [style [("font-size", "1.2em")]] 
            [ text big ] 
        , text small
        ] -- Big text with amounts, smaller text giving the stuffs

    fromMod modifier =
      modBox modifier.modString modifier.source

  in
    div [style [("font-size", "1em")], onClick (Show field (not stat.expanded))] <|
      if stat.expanded then
        (modBox (toString stat.base) "Base")::(List.map fromMod stat.modifiers)
      else
        [ text (stat.name ++ ": ")
        , text (total stat |> toString)]