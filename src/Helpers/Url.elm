module Helpers.Url exposing (urlToString)

import Url exposing (Protocol(..), Url)


urlToString : Url -> String
urlToString value =
    Url.toString value
