module StatViews exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (ViewStat)
import Stat exposing (total)

-- Possibly use the Style Elements library
-- http://package.elm-lang.org/packages/mdgriffith/style-elements/latest
breakdown : List (Html.Attribute msg) -> ViewStat a -> Html msg
breakdown viewStyle stat =
  let 
    -- Box describing a single modifier
    modBox big small =
      div [style [ ("margin", "5px")
                 , ("padding-right", "5px")
                 , ("display", "inline-block")
                 , ("border-right", "1px solid #000")]] 
        [ div [style [("font-size", "1.5em")]] 
            [ text big ] 
        , text small
        ] -- Big text with amounts, smaller text giving the stuffs

    fromMod modifier =
      modBox modifier.modString modifier.source

  in
    div [] <|
      if stat.expanded then
        (modBox (toString stat.base) "Base")::(List.map fromMod stat.modifiers)
      else
        [total stat |> toString |> text]