module Pages.About exposing (page)

import Gen.Params.About exposing (Params)
import Helpers.Url exposing (generateUrlString)
import Html
import Layouts.Base
import Page exposing (Page)
import Request exposing (Request)
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page
page _ req =
    Page.static
        { view = view req
        }


view : Request -> View msg
view req =
    { title = "Abount"
    , body =
        Layouts.Base.layout
            [ Html.p [] [ Html.text "About" ]
            , Html.p [] [ Html.text (generateUrlString req.url) ]
            ]
    }
