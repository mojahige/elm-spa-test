module Helpers.Url exposing (generateUrlString)

import Url exposing (Protocol(..), Url)


generateUrlString : Url -> String
generateUrlString value =
    let
        port_ =
            portToString value.port_
    in
    String.join ""
        [ generateScheme value.protocol
        , "://"
        , value.host
        , if port_ /= "" then
            ":" ++ port_

          else
            ""
        ]


generateScheme : Protocol -> String
generateScheme protocol =
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
