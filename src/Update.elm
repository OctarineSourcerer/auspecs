module Update exposing (..)
import Model exposing (Model)
import Stat exposing (setBase)

type SheetString = Name
type SheetBool = Cursed
type SheetInt = AC | Strength
type Field = SheetInt | SheetBool | SheetString

type Msg
  = SetString SheetString String
  | SetBool SheetBool Bool
  | SetInt  SheetInt Int
  | Show Field Bool
  | Invalid

update : Msg -> Model -> Model
update msg model = 
  case msg of
    SetString field value ->
      case field of
        Name -> { model | name = value }

    SetBool field value ->
      case field of
        Cursed -> { model | cursed = setBase model.cursed value }

    SetInt field value ->
      case field of
        AC -> 
          { model | ac = setBase model.ac value }
        Strength ->
          { model | strength = setBase model.strength value }

    Show field show ->
      model -- TODO: Change the relevant "expanded" field to 'show'

    Invalid ->
      model