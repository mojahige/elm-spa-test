module Helpers.UrlTest exposing (suite)

import Expect
import Helpers.Url exposing (generateUrlString)
import Test exposing (Test, describe, test)
import Url exposing (Protocol(..), Url)


suite : Test
suite =
    describe "requestToUrl"
        [ test "protocol and host" <|
            \() ->
                let
                    result =
                        generateUrlString
                            (Url Http "foobar" Nothing "" Nothing Nothing)
                in
                Expect.equal result "http://foobar"
        , test "protocol and host and port" <|
            \() ->
                let
                    result =
                        generateUrlString
                            (Url Https "elm" (Just 3333) "" Nothing Nothing)
                in
                Expect.equal result "https://elm:3333"
        ]
