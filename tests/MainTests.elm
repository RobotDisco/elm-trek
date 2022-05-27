module MainTests exposing (..)

import Expect
import Main
import Test exposing (describe, test)


suite =
    describe "Navigation tests"
        [ test "that in-sector example from the youtube video"
            (\_ ->
                let
                    oldLoc =
                        { qx = 0, qy = 0, sx = 5, sy = 3 }

                    newLoc =
                        { qx = 0, qy = 0, sx = 6, sy = 4 }
                in
                Main.travel 8 0.125 oldLoc |> Expect.equal newLoc
            )
        , test "can we warp exactly one quadrant away?"
            (\_ ->
                let
                    oldLoc =
                        { qx = 0, qy = 0, sx = 5, sy = 3 }

                    newLoc =
                        { qx = 1, qy = 1, sx = 5, sy = 3 }
                in
                Main.travel 8 1 oldLoc |> Expect.equal newLoc
            )
        , test "can we warp one quadrant AND one sector over?"
            (\_ ->
                let
                    oldLoc =
                        { qx = 0, qy = 0, sx = 5, sy = 3 }

                    newLoc =
                        { qx = 1, qy = 1, sx = 6, sy = 4 }
                in
                Main.travel 8 1.125 oldLoc |> Expect.equal newLoc
            )
        ]
