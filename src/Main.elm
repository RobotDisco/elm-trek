module Main exposing (travel)


type alias Location =
    ( Int, Int )


travel : Float -> Float -> Location -> Location
travel course warp_factor ( old_x, old_y ) =
    let
        -- Map course direction to an angle
        angle =
            -(pi * (course - 1.0) / 4.0)

        -- Get 1d direction vectors via that angle
        direction_x =
            warp_factor * cos angle

        direction_y =
            warp_factor * sin angle

        -- 0.125 warp factor moves you one sector
        magnitude_x =
            direction_x / 0.125

        magnitude_y =
            direction_y / 0.125
    in
    ( -- Approximate calculations to our integer-based positioning system
      old_x + round magnitude_x
    , old_y + round magnitude_y
    )
