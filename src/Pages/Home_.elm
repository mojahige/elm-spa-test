module Pages.Home_ exposing (page, view)

import Html
import Page exposing (Page)
import Request exposing (Request)
import Shared
import Url exposing (Protocol(..))
import View exposing (View)


page : Shared.Model -> Request -> Page
page _ req =
    Page.static
        { view = view req
        }


view : Request -> View msg
view req =
    { title = "Homepage"
    , body =
        [ Html.div []
            [ Html.h1 [] [ Html.text "elm-spa test" ]
            , Html.p [] [ Html.text "Hello, world!" ]
            , Html.p [] [ Html.text (requestToUrl req) ]
            ]
        ]
    }


requestToUrl : Request -> String
requestToUrl req =
    let
        port_ =
            portToString req.url.port_
    in
    String.join ""
        [ protocolToString req.url.protocol
        , "://"
        , req.url.host
        , if port_ /= "" then
            ":" ++ port_

          else
            ""
        ]


protocolToString : Protocol -> String
protocolToString protocol =
    case protocol of
        Http ->
            "http"

        Https ->
            "https"


portToString : Maybe Int -> String
portToString maybeInt =
    case maybeInt of
        Just value ->
            String.fromInt value

        Nothing ->
            ""
