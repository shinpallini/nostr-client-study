module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div
        (displayClass2
            [ "display:flex"
            , "flex-direction:column"
            , "justify-content:center"
            , "align-items:center"
            ]
        )
        [ button [ onClick Decrement, class "font:30", class "font:heavy", class "color:#ffffff", class "background-color:#000000" ] [ text "-" ]
        , div [ class "font:50", class "font:heavy", class "italic" ] [ text (String.fromInt model) ]
        , button [ onClick Increment, class "font:30", class "font:heavy" ] [ text "+" ]
        ]


displayClass : List (Html.Attribute msg)
displayClass =
    [ class "display:flex", class "flex-direction:column", class "justify-content:center", class "align-items:center" ]


displayClass2 : List String -> List (Html.Attribute msg)
displayClass2 list =
    List.map class list
