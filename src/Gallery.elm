module Main exposing (..)

import Html exposing (Html, div, text, img, i)
import Html.Attributes exposing (style, class, src, width)


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
    --div [ style [ ( "border", "1px solid black" ) ], class "bg-gray" ]
    --    [ text model.content
    --    ]
    div [ class "sm-col col-12 fit slideshow" ]
        [ div [ class "sm-col col-1 flex flex-center slideshow-height" ]
            [ i [ class "fa fa-chevron-left fa-4x center" ]
                []
            ]
        , div
            [ class "sm-col col-10 flex flex-center slideshow-height" ]
            [ img
                [ class "img-slide"
                , src "./static/images/artworks/dessins-1.png"
                ]
                []
            ]
        , div
            [ class "sm-col col-1 flex flex-center slideshow-height" ]
            [ i [ class "fa fa-chevron-right fa-4x flex-auto center" ] []
            ]
        ]
