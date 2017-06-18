module Main exposing (..)

import Html exposing (Html, div, text)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { content : String }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { content = "Hello" }, Cmd.none )



-- UPDATE


type Msg
    = UpString String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpString newString ->
            ( { model | content = newString }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model.content
        ]
