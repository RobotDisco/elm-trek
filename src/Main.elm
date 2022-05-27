module Main exposing (travel)


type alias Location =
    { qx : Int, qy : Int, sx : Int, sy : Int }


travel : Float -> Float -> Location -> Location
travel course warp_factor { qx, qy, sx, sy } =
    let
        -- Map course direction to an radian
        angle =
            -(pi * (course - 1.0) / 4.0)

        -- 1.000 warp factor moves you 1 quadrant exactly
        -- (i.e. 8 sectors' worth of distance)
        quadrant_magnitude = floor warp_factor |> toFloat
        -- 0.125 warp factor moves you one sector position
        sector_magnitude = (warp_factor - quadrant_magnitude) * 8

        -- Get one-dimensional direction unit vectors via the angle
        v_x = cos angle
        v_y = sin angle

        -- How many quadrants should we move (i.e. translate)?
        t_qx =
            quadrant_magnitude * v_x |> round
        t_qy =
            quadrant_magnitude * v_y |> round

        -- How many sectors should we move (i.e. translate)?
        t_sx =
            sector_magnitude * v_x |> round
        t_sy =
            sector_magnitude * v_y |> round
    in
    {
      qx = qx + t_qx
    , qy = qy + t_qy
    , sx = sx + t_sx
    , sy = sy + t_sy
    }
