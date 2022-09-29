module Helpers.UrlTest exposing (suite)

import Expect
import Helpers.Url exposing (urlToString)
import Test exposing (Test, describe, test)
import Url exposing (Protocol(..), Url)


suite : Test
suite =
    describe "urlToString"
        [ test "protocol and host" <|
            \() ->
                let
                    result =
                        urlToString
                            (Url Http "foobar" Nothing "" Nothing Nothing)
                in
                Expect.equal result "http://foobar"
        , test "has port" <|
            \() ->
                let
                    result =
                        urlToString
                            (Url Https "elm" (Just 3333) "" Nothing Nothing)
                in
                Expect.equal result "https://elm:3333"
        , test "has path" <|
            \() ->
                let
                    result =
                        urlToString
                            (Url Https "foobar" Nothing "/about" Nothing Nothing)
                in
                Expect.equal result "https://foobar/about"
        ]
