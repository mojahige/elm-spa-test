module Pages.Home_ exposing (page, view)

import Html
import Layouts.Base
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
        Layouts.Base.layout req
            [ Html.p [] [ Html.text "Hello, world!" ]
            ]
    }
