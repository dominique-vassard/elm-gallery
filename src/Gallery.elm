module Main exposing (..)

import Html exposing (Html, div, text, img, i)
import Html.Attributes exposing (style, class, src, width)
import Html.Events exposing (onClick)
import Helpers.ZipList as ZipList
    exposing
        ( ZipList
        , init
        , forward
        , current
        , hasPrevious
        )


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
    { content : String
    , images : ZipList String
    }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { content = "Hello"
      , images =
            ZipList.init
                "./static/images/artworks/dessins-1.png"
                [ "./static/images/artworks/peintures-7.jpg"
                , "./static/images/artworks/peintures-8.jpg"
                , "./static/images/artworks/peintures-9.jpg"
                , "./static/images/artworks/peintures-hor.jpg"
                , "./static/images/artworks/peintures-10.jpg"
                , "./static/images/artworks/peintures-11.jpg"
                , "./static/images/artworks/peintures-12.jpg"
                ]
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NextImage
    | PreviousImage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PreviousImage ->
            ( { model | images = ZipList.back model.images }, Cmd.none )

        NextImage ->
            ( { model | images = ZipList.forward model.images }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "sm-col col-12 fit gallery" ]
        [ viewControl model PreviousImage
        , div
            [ class "sm-col col-10 flex flex-center gallery-height" ]
            [ img
                [ class "img-slide"
                , src (ZipList.current model.images)
                ]
                []
            ]
        , viewControl model NextImage
        ]


viewControl : Model -> Msg -> Html Msg
viewControl model msg =
    let
        disabled_control =
            case msg of
                PreviousImage ->
                    if ZipList.hasPrevious model.images then
                        ""
                    else
                        "disabled"

                NextImage ->
                    if ZipList.hasNext model.images then
                        ""
                    else
                        "disabled"

        direction =
            case msg of
                PreviousImage ->
                    "left"

                NextImage ->
                    "right"
    in
        div
            [ class "sm-col col-1 flex flex-center gallery-height"
            ]
            [ i
                [ class
                    ("fa fa-chevron-"
                        ++ direction
                        ++ " fa-4x flex-auto center "
                        ++ "gallery-control "
                        ++ disabled_control
                    )
                , onClick msg
                ]
                []
            ]
