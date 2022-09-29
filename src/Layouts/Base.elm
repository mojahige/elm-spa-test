module Layouts.Base exposing (layout)

import Helpers.Url exposing (urlToString)
import Html exposing (Html)
import Html.Attributes as Attr
import Request exposing (Request)


layout : Request -> List (Html msg) -> List (Html msg)
layout req children =
    let
        viewLink : String -> String -> Html msg
        viewLink label url =
            Html.a [ Attr.class "text-blue-500", Attr.href url ] [ Html.text label ]
    in
    [ Html.div []
        [ Html.header [ Attr.class "px-4 py-2 border-b-2 border-slate-400" ]
            [ Html.h1 [ Attr.class "italic font-bold text-3xl" ] [ Html.text "elm-spa test" ]
            , Html.div [ Attr.class "mt-2 divide-y divide-slate-400/25" ]
                [ Html.p [] [ Html.text (urlToString req.url) ]
                , Html.ul [ Attr.class "flex justify-start flex-wrap gap-2 pt-1 mt-2 " ]
                    [ Html.li [] [ viewLink "Home" "/" ]
                    , Html.li [] [ viewLink "About" "/about" ]
                    ]
                ]
            ]
        , Html.main_ [ Attr.class "px-4 py-6" ] children
        ]
    ]
