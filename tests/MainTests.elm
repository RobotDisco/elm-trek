module MainTests exposing (..)

import Expect exposing (Expectation)
import Main
import Test exposing (..)


suite =
    test "that in-sector example from the youtube video"
        (\_ ->
            let
                oldLoc =
                    ( 5, 3 )
            in
            Main.travel 8 0.125 oldLoc |> Expect.equal ( 6, 4 )
        )
