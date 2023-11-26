module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, button, div, text, img)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html exposing (img)



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
        -- (displayClass2
        --     [ "display:flex"
        --     , "flex-direction:column"
        --     , "justify-content:center"
        --     , "align-items:center"
        --     ]
        -- )
        -- []
        -- [ button [ onClick Decrement, class "font:30", class "font:heavy", class "color:#ffffff", class "background-color:#000000" ] [ text "-" ]
        -- , div [ class "font:50", class "font:heavy", class "italic" ] [ text (String.fromInt model) ]
        -- , button [ onClick Increment, class "font:30", class "font:heavy" ] [ text "+" ]
        -- ]
        ( rootStyle ) [ 
            img (src "/images/profile.jpg" :: imgStyle) [],
            div [class "mt:10", class "p:15"] [
                div picTitleStyle [ text "texture crew sweater" ],
                div picDescriptionStyle [ text "Designed for on the move" ],
                div costStyle [ text "$120.0 USD" ]
            ]
        ]


-- displayClass : List (Html.Attribute msg)
-- displayClass =
--     [ class "display:flex", class "flex-direction:column", class "justify-content:center", class "align-items:center" ]

buildStyles : List String -> List (Html.Attribute msg)
buildStyles list =
    List.map class list

rootStyle : List (Html.Attribute msg)
rootStyle = buildStyles [
            "bg:gray-22"
            , "p:10"
            , "r:10"
            , "max-w:350"
            ]

imgStyle : List (Html.Attribute msg)
imgStyle = buildStyles [
    "object:cover"
    , "w:full"
    , "square"
    , "r:5"
    ]

picTitleStyle : List (Html.Attribute msg)
picTitleStyle = buildStyles [
    "font:24"
    , "font:bold"
    , "capitalize"
    ]

picDescriptionStyle : List (Html.Attribute msg)
picDescriptionStyle = buildStyles [
    "font:14"
    , "font:gray-66"
    , "mt:5"
    ]

costStyle : List (Html.Attribute msg)
costStyle = buildStyles [
    "mt:12"
    , "font:semibold"
    ]
