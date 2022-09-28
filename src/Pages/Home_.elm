module Pages.Home_ exposing (page, view)

import Helpers.Url exposing (generateUrlString)
import Html
import Html.Attributes exposing (class)
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
        [ Html.main_ [ class "p-8" ]
            [ Html.h1 [ class "italic font-bold text-3xl" ] [ Html.text "elm-spa test" ]
            , Html.p [] [ Html.text "Hello, world!" ]
            , Html.p [] [ Html.text (generateUrlString req.url) ]
            ]
        ]
    }
