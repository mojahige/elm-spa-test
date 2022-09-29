module Layouts.Base exposing (layout)

import Html exposing (Html)
import Html.Attributes as Attr


layout : List (Html msg) -> List (Html msg)
layout children =
    let
        viewLink : String -> String -> Html msg
        viewLink label url =
            Html.a [ Attr.class "text-blue-500", Attr.href url ] [ Html.text label ]
    in
    [ Html.div []
        [ Html.header [ Attr.class "px-4 py-2 border-b-2 border-slate-400" ]
            [ Html.h1 [ Attr.class "italic font-bold text-3xl" ] [ Html.text "elm-spa test" ]
            , Html.ul [ Attr.class "flex justify-start flex-wrap gap-2 pt-1 mt-2 border-t-2 border-slate-300" ]
                [ Html.li [] [ viewLink "Home" "/" ]
                , Html.li [] [ viewLink "About" "/about" ]
                ]
            ]
        , Html.main_ [ Attr.class "p-6" ] children
        ]
    ]
