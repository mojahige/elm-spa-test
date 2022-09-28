module Pages.Home_ exposing (page, view)

import Helpers.Url exposing (generateUrlString)
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
            , Html.p [] [ Html.text (generateUrlString req.url) ]
            ]
        ]
    }
