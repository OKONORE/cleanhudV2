include("autorun/sh_config.lua")

    ply = LocalPlayer()

    local function RespX(x) return x/1920*ScrW() end
    local function RespY(y) return y/1080*ScrH() end

    surface.CreateFont( "CleanHUD_large_font", {
        font = CLEARHUD.Font1,
        size = 40,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        additive = false,
        outline = true,
        } )
  
    surface.CreateFont( "CleanHUD_Font_Small", { 
        font = CLEARHUD.Font2,
        size = 20,
        weight = 400,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        additive = false,
        outline = false,
        } )

        surface.CreateFont( "CleanHUD_small_font_underlined", {
            font = CLEARHUD.Font2,
            size = 20,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = true,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            additive = false,
            outline = false,
            } )

            surface.CreateFont( "CleanHUD_small_font_bold", {
                font = CLEARHUD.Font2,
                size = 20,
                weight = 700,
                blursize = 0,
                scanlines = 0,
                antialias = true,
                underline = false,
                italic = false,
                strikeout = false,
                symbol = false,
                rotary = false,
                additive = false,
                outline = false,
                } )