timer.Simple( 2, function() -- allow time for other files to load before runing this file

    include("autorun/sh_config.lua")
    include("autorun/client/cl_init.lua")
    include("autorun/sh_lang.lua")

----------------------------------------------------------------------------------------------------
--| Principal Function |----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local function ConfigMenu()

    local ConfigMenuFrame = vgui.Create( "DFrame" )
    ConfigMenuFrame:CenterHorizontal( 0.3 )
    ConfigMenuFrame:CenterVertical( 0.2 )
    ConfigMenuFrame:SetTitle( CLEARHUD.Configmenu.."by OKONORE" )
    ConfigMenuFrame:SetSize( 500, 500 )
    ConfigMenuFrame:SetDraggable( true )
    ConfigMenuFrame:ShowCloseButton( true )
    ConfigMenuFrame:MakePopup()
    ConfigMenuFrame:SetScreenLock( true )
    ConfigMenuFrame.Paint = function( s , w , h )
      draw.RoundedBox(5, 0, 0, w, h, Color(27,27,27))
    end 
    ConfigMenuFrame.OnClose = function() DeleteSettingTempFiles() end

        local ButtonSaveSettings = vgui.Create( "DButton", ConfigMenuFrame )
        ButtonSaveSettings:SetPos( 5, 65 )
        ButtonSaveSettings:SetSize( 490, 30 )
        ButtonSaveSettings:SetText( CLEARHUD.Savebutton )
        ButtonSaveSettings:SetFont( "CleanHUD_Font_Small" )
        ButtonSaveSettings:SetTextColor( TextCouleur )
        ButtonSaveSettings.Paint = function( s , w , h )
          draw.RoundedBox(5, 0, 0, w, h, ( Color(0, 255, 21) ))
        end
        ButtonSaveSettings.DoClick = function() SaveNewSettings() 
        end

        local CBoxChooseOption = vgui.Create( "DComboBox", ConfigMenuFrame )
        CBoxChooseOption:SetPos( 5, 30 )
        CBoxChooseOption:SetSize( 490, 30 )
        CBoxChooseOption:SetValue( "General" )
        CBoxChooseOption:SetSortItems( false )
        CBoxChooseOption:AddChoice( "General" )
        CBoxChooseOption:AddChoice( "Basic HUD" )
        CBoxChooseOption:AddChoice( "ContextMenu" )
        CBoxChooseOption:AddChoice( "Death HUD" )
        CBoxChooseOption:AddChoice( "Door HUD" )
        CBoxChooseOption:AddChoice( "Ammo HUD" )
        function CBoxChooseOption:OnSelect( index )
        
    -----------------------------------------------------------------
    -------------------|Index 1 = General |--------------------------
    -----------------------------------------------------------------

    if index == 1 then      

    local PanelGeneral = vgui.Create( "DScrollPanel", ConfigMenuFrame )
    PanelGeneral:SetPos( 5, 100 ) 
    PanelGeneral:SetSize( 490, 395 ) 
    PanelGeneral:SetBackgroundColor( Color(27,27,27) )
    PanelGeneral:SetPaintBackground( true )

        -----> Language Selection

    
        local BoxChooseLang = PanelGeneral:Add( "DComboBox", PanelGeneral )
        BoxChooseLang:SetPos( 0, 10 )
        BoxChooseLang:SetSize( 100, 20 )
        BoxChooseLang:SetValue( CLEARHUD.Language )
        BoxChooseLang:SetSortItems( true )
        BoxChooseLang:AddChoice( "english" )
        BoxChooseLang:AddChoice( "french" )
        function BoxChooseLang:OnSelect( index )
            if index == 1 then CreateTempFile("general", "language", "english") end
            if index == 2 then CreateTempFile("general", "language", "french") end
        end

        local LabelLangChoose = vgui.Create("DLabel", PanelGeneral)
        LabelLangChoose:SetPos( 110, 10 )
        LabelLangChoose:SetSize( 100, 20 )
        LabelLangChoose:SetText( CLEARHUD.GeneralLblLang )
        LabelLangChoose:SetFont( "CleanHUD_Font_Small" )
        LabelLangChoose:SetColor( Color(255,255,255) )

        -------> Font 1 selection

        local TextEntryFont1 = vgui.Create( "DTextEntry", PanelGeneral )
        TextEntryFont1:SetPos( 0, 35 )
        TextEntryFont1:SetSize( 100, 20 )
        TextEntryFont1:SetEditable( true )
        TextEntryFont1:SetPlaceholderText( CLEARHUD.Font1 )
        TextEntryFont1.OnChange = function( self )
            CreateTempFile("general", "font1", self:GetValue())
        end

        local LabelFont1Choose = vgui.Create( "DLabel", PanelGeneral )
        LabelFont1Choose:SetPos( 110, 35 )
        LabelFont1Choose:SetSize( 100, 20 )
        LabelFont1Choose:SetText( CLEARHUD.GeneralLblFont1 )
        LabelFont1Choose:SetFont( "CleanHUD_Font_Small" )
        LabelFont1Choose:SetColor( Color(255,255,255) )

        -------> Font 2 Selection

        local TextEntryFont2 = vgui.Create( "DTextEntry", PanelGeneral )
        TextEntryFont2:SetPos( 0, 60 )
        TextEntryFont2:SetSize( 100, 20)
        TextEntryFont2:SetEditable( true )
        TextEntryFont2:SetPlaceholderText( CLEARHUD.Font2 )
        TextEntryFont2.OnChange = function( self )
            CreateTempFile( "general", "font2", self:GetValue() )
        end

        local LabelFont2Choose = vgui.Create("DLabel", PanelGeneral)
        LabelFont2Choose:SetPos( 110, 60 )
        LabelFont2Choose:SetSize( 100, 20 )
        LabelFont2Choose:SetText( CLEARHUD.GeneralLblFont2 )
        LabelFont2Choose:SetFont( "CleanHUD_Font_Small" )
        LabelFont2Choose:SetColor( Color(255,255,255) )

    end

    -----------------------------------------------------------------
    -------------------|Index 2 = Basic HUD |------------------------
    -----------------------------------------------------------------

    if index == 2 then -- if "Basic HUD" is choosen then...
    
    local PanelBasicHUD = vgui.Create( "DScrollPanel", ConfigMenuFrame )
    PanelBasicHUD:SetPos( 5, 100 ) 
    PanelBasicHUD:SetSize( 490, 395 ) 
    PanelBasicHUD:SetBackgroundColor( Color(27,27,27) )
    PanelBasicHUD:SetPaintBackground( true )
    function PanelBasicHUD:Paint()
        surface.SetDrawColor(58,58,58)
        surface.DrawRect( 245, 5, 5, 380 ) -- vertical separator
        surface.DrawRect( 5, 25, 220, 5 ) -- horizontal separator 1
        surface.DrawRect( 5, 75, 220, 5 ) -- horizontal separator 2
        surface.DrawRect( 5, 125, 220, 5 ) -- horizontal separator 3
        surface.DrawRect( 5, 175, 220, 5 ) -- horizontal separator 4
        surface.DrawRect( 5, 225, 220, 5 ) -- horizontal separator 5
        surface.DrawRect( 5, 275, 220, 5 ) -- horizontal separator 5
    end

    ---------------------------> BasicHUD settings
    ----------------
            local LabelActiveBasicHUD = vgui.Create("DLabel", PanelBasicHUD )
            LabelActiveBasicHUD:SetPos( 35, 0 )
            LabelActiveBasicHUD:SetSize( 200, 20 )
            LabelActiveBasicHUD:SetText( CLEARHUD.BasicHUDLblActivate )
            LabelActiveBasicHUD:SetFont( "CleanHUD_Font_Small" )
            LabelActiveBasicHUD:SetColor( Color(255,255,255) )

            local ChkBoxBasicHUDStatue = vgui.Create( "DCheckBox", PanelBasicHUD )
            ChkBoxBasicHUDStatue:SetPos( 5, 0 ) 
            ChkBoxBasicHUDStatue:SetSize( 20, 20 )
            ChkBoxBasicHUDStatue:SetValue( CLEARHUD.BasicHUDEnable )
                ChkBoxBasicHUDStatue.OnChange = function( self )
                if self:GetChecked() == true then CreateTempFile( "basichud", "active", "true" )
                else CreateTempFile( "basichud", "active", "false" ) end
            end


                        ChkBoxBasicHUDStatue.OnChange = function( self )
            if self:GetChecked() == true then CreateTempFile( "basichud", "active", "true" )
            else CreateTempFile( "basichud", "active", "false" ) end
        end
----------------
        local LblHUDPos = vgui.Create("DLabel", PanelBasicHUD )
        LblHUDPos:SetPos( 10, 30 )
        LblHUDPos:SetSize( 200, 20 )
        LblHUDPos:SetText( CLEARHUD.BasicHUDLblHUDPos )
        LblHUDPos:SetFont( "CleanHUD_Font_Small" )
        LblHUDPos:SetColor( Color(255,255,255) )

        local BoxChoosePos = vgui.Create( "DComboBox", PanelBasicHUD )
        BoxChoosePos:SetPos( 10, 50 )
        BoxChoosePos:SetSize( 200, 20 )
        BoxChoosePos:SetValue( CLEARHUD.BasicHUDPos )
        BoxChoosePos:SetSortItems( false )
        BoxChoosePos:AddChoice( CLEARHUD.DownLeft )
        BoxChoosePos:AddChoice( CLEARHUD.DownRight )
        BoxChoosePos:AddChoice( CLEARHUD.UpLeft )
        BoxChoosePos:AddChoice( CLEARHUD.UpRight )
        function BoxChoosePos:OnSelect( index )
            if index == 1 then CreateTempFile( "basichud", "position", "DownLeft" ) end
            if index == 2 then CreateTempFile( "basichud", "position", "DownRight" ) end
            if index == 3 then CreateTempFile( "basichud", "position", "UpLeft" ) end
            if index == 4 then CreateTempFile( "basichud", "position", "UpRight" ) end
        end
    --------------
        local LblBarOf = vgui.Create("DLabel", PanelBasicHUD )
        LblBarOf:SetPos( 300, 0 )
        LblBarOf:SetSize( 200, 20 )
        LblBarOf:SetText( CLEARHUD.BasicHUDLblBarOf )
        LblBarOf:SetFont( "CleanHUD_Font_Small" )
        LblBarOf:SetColor( Color(255,255,255) )
----------------
        local TESpaceBetwnBars = vgui.Create( "DTextEntry", PanelBasicHUD )
        TESpaceBetwnBars:SetPos( 10, 100 )
        TESpaceBetwnBars:SetSize( 200, 20 )
        TESpaceBetwnBars:SetNumeric( true )
        TESpaceBetwnBars:SetEditable( true )
        TESpaceBetwnBars:SetPlaceholderText( CLEARHUD.BasicHUDSpaceBetwnBars )
        TESpaceBetwnBars.OnChange = function( self )
            CreateTempFile("basichud", "spacebetwnbars", self:GetValue())
        end

        local LblSpaceBetwnBars = vgui.Create( "DLabel", PanelBasicHUD )
        LblSpaceBetwnBars:SetPos( 10, 80 )
        LblSpaceBetwnBars:SetSize( 200, 20 )
        LblSpaceBetwnBars:SetText( CLEARHUD.SpaceBetwnBars )
        LblSpaceBetwnBars:SetFont( "CleanHUD_Font_Small" )
        LblSpaceBetwnBars:SetColor( Color(255,255,255) )
----------------
        local TEBarsLength = vgui.Create( "DTextEntry", PanelBasicHUD )
        TEBarsLength:SetPos( 10, 150 )
        TEBarsLength:SetSize( 200, 20 )
        TEBarsLength:SetNumeric( true )
        TEBarsLength:SetEditable( true )
        TEBarsLength:SetPlaceholderText( CLEARHUD.BasicHUDbarsLength )
        TEBarsLength.OnChange = function( self )
            CreateTempFile("basichud", "barslength", self:GetValue())
        end

        local LblBarsLength = vgui.Create( "DLabel", PanelBasicHUD )
        LblBarsLength:SetPos( 10, 130 )
        LblBarsLength:SetSize( 200, 20 )
        LblBarsLength:SetText( CLEARHUD.BarsLength )
        LblBarsLength:SetFont( "CleanHUD_Font_Small" )
        LblBarsLength:SetColor( Color(255,255,255) )
----------------
        local TEBarsThickness = vgui.Create( "DTextEntry", PanelBasicHUD )
        TEBarsThickness:SetPos( 10, 200 )
        TEBarsThickness:SetSize( 200, 20 )
        TEBarsThickness:SetNumeric( true )
        TEBarsThickness:SetEditable( true )
        TEBarsThickness:SetPlaceholderText( CLEARHUD.BasicHUDBarsThickness )
        TEBarsThickness.OnChange = function( self )
            CreateTempFile("basichud", "barsthickness", self:GetValue())
        end

        local LblBarsThickness = vgui.Create( "DLabel", PanelBasicHUD )
        LblBarsThickness:SetPos( 10, 180 )
        LblBarsThickness:SetSize( 200, 20 )
        LblBarsThickness:SetText( CLEARHUD.BarsThickness )
        LblBarsThickness:SetFont( "CleanHUD_Font_Small" )
        LblBarsThickness:SetColor( Color(255,255,255) )
----------------
local TEMoneyCurrency = vgui.Create( "DTextEntry", PanelBasicHUD )
TEMoneyCurrency:SetPos( 10, 250 )
TEMoneyCurrency:SetSize( 200, 20 )
TEMoneyCurrency:SetNumeric( true )
TEMoneyCurrency:SetEditable( true )
TEMoneyCurrency:SetPlaceholderText( CLEARHUD.BasicHUDMoneyCurrency )
TEMoneyCurrency.OnChange = function( self )
    CreateTempFile("basichud", "moneycurrency", self:GetValue())
end

local LblMoneyCurrency = vgui.Create( "DLabel", PanelBasicHUD )
LblMoneyCurrency:SetPos( 10, 230 )
LblMoneyCurrency:SetSize( 200, 20 )
LblMoneyCurrency:SetText( CLEARHUD.MoneyCurrency )
LblMoneyCurrency:SetFont( "CleanHUD_Font_Small" )
LblMoneyCurrency:SetColor( Color(255,255,255) )
----------------
    
local CBoxBarsOptions = vgui.Create( "DComboBox", PanelBasicHUD )
CBoxBarsOptions:SetPos( 275, 30 )
CBoxBarsOptions:SetSize( 200, 20 )
CBoxBarsOptions:SetValue( CLEARHUD.BasicHUDHealth )
CBoxBarsOptions:SetSortItems( false )
CBoxBarsOptions:AddChoice( CLEARHUD.BasicHUDHealth )
CBoxBarsOptions:AddChoice( CLEARHUD.BasicHUDArmor )
CBoxBarsOptions:AddChoice( CLEARHUD.BasicHUDHunger )
CBoxBarsOptions:AddChoice( CLEARHUD.BasicHUDMoney )
CBoxBarsOptions:AddChoice( CLEARHUD.BasicHUDVelocity )
function CBoxBarsOptions:OnSelect( index )

    if index == 1 then ---------------------------> Health Bar
        
        local SPanelHealthBar = vgui.Create( "DScrollPanel", PanelBasicHUD )
        SPanelHealthBar:SetPos( 275, 60 ) 
        SPanelHealthBar:SetSize( 200, 250 ) 
        SPanelHealthBar:SetBackgroundColor( Color(27,27,27) )
        SPanelHealthBar:SetPaintBackground( true )

        local ChkBoxHealthBarStatus = vgui.Create( "DCheckBox", SPanelHealthBar )
        ChkBoxHealthBarStatus:SetPos( 0, 0 ) 
        ChkBoxHealthBarStatus:SetSize( 20, 20 )
        ChkBoxHealthBarStatus:SetValue( CLEARHUD.HealthBarStatus )
        ChkBoxHealthBarStatus.OnChange = function( self )
            if self:GetChecked() == true then CreateTempFile( "basichud", "healthbarstatus", "true" )
            else CreateTempFile( "basichud", "healthbarstatus", "false" ) end
        end
        
        local LblHealth = vgui.Create("DLabel", SPanelHealthBar )
        LblHealth:SetPos( 30, 0 )
        LblHealth:SetSize( 200, 20 )
        LblHealth:SetText( CLEARHUD.Active )
        LblHealth:SetFont( "CleanHUD_Font_Small" )
        LblHealth:SetColor( Color(255,255,255) )
    
        local ColorMixHealthBar = vgui.Create("DColorMixer", SPanelHealthBar )
        ColorMixHealthBar:SetPos( 0, 30 )
        ColorMixHealthBar:SetSize( 200, 180 )		
        ColorMixHealthBar:SetPalette( true )  								
        ColorMixHealthBar:SetWangs( false ) 	
        ColorMixHealthBar:SetPalette( false )
        ColorMixHealthBar:SetAlphaBar( false )
        ColorMixHealthBar:SetColor( string.ToColor( CLEARHUD.HealthBarColor )) 	
        ColorMixHealthBar.ValueChanged = function( self )
            TempHealthBarColor = self:GetColor()
            TempHealthBarColor = Color( TempHealthBarColor.r, TempHealthBarColor.g, TempHealthBarColor.b ) 
        end

        local BtnColorHealtBar = vgui.Create( "DButton", SPanelHealthBar )
        BtnColorHealtBar:SetPos( 0, 220)
        BtnColorHealtBar:SetSize( 200, 30 )
        BtnColorHealtBar:SetText( CLEARHUD.Confirm )
        BtnColorHealtBar:SetFont( "CleanHUD_Font_Small" )
        BtnColorHealtBar:SetTextColor( Color(255,255,255) )
        BtnColorHealtBar.Paint = function( s , w , h )
            draw.RoundedBox( 5, 0, 0, w, h, TempHealthBarColor or string.ToColor( CLEARHUD.HealthBarColor )) 
        end
        BtnColorHealtBar.DoClick = function() 
            CreateTempFile( "basichud", "healthbarcolor", tostring( TempHealthBarColor ) ) 
        end

    end

    if index == 2 then ---------------------------> Armor Bar
        
        local SPanelArmorBar = vgui.Create( "DScrollPanel", PanelBasicHUD )
        SPanelArmorBar:SetPos( 275, 60 ) 
        SPanelArmorBar:SetSize( 200, 250 ) 
        SPanelArmorBar:SetBackgroundColor( Color(27,27,27) )
        SPanelArmorBar:SetPaintBackground( true )
    
        local ChkBoxArmorBarStatus = vgui.Create( "DCheckBox", SPanelArmorBar )
        ChkBoxArmorBarStatus:SetPos( 0, 0 ) 
        ChkBoxArmorBarStatus:SetSize( 20, 20 )
        ChkBoxArmorBarStatus:SetValue( CLEARHUD.ArmorBarStatus )
        ChkBoxArmorBarStatus.OnChange = function( self )
            if self:GetChecked() == true then CreateTempFile( "basichud", "armorbarstatus", "true" )
            else CreateTempFile( "basichud", "armorbarstatus", "false" ) end
        end
        
        local LblArmor = vgui.Create("DLabel", SPanelArmorBar )
        LblArmor:SetPos( 30, 0 )
        LblArmor:SetSize( 200, 20 )
        LblArmor:SetText( CLEARHUD.Active )
        LblArmor:SetFont( "CleanHUD_Font_Small" )
        LblArmor:SetColor( Color(255,255,255) )
    
        local ColorMixArmorBar = vgui.Create("DColorMixer", SPanelArmorBar )
        ColorMixArmorBar:SetPos( 0, 30 )
        ColorMixArmorBar:SetSize( 200, 180 )		
        ColorMixArmorBar:SetPalette( true )  								
        ColorMixArmorBar:SetWangs( false ) 	
        ColorMixArmorBar:SetPalette( false )
        ColorMixArmorBar:SetAlphaBar( false )
        ColorMixArmorBar:SetColor( string.ToColor( CLEARHUD.ArmorBarColor )) 	
        ColorMixArmorBar.ValueChanged = function( self )
            TempArmorBarColor = self:GetColor()
            TempArmorBarColor = Color( TempArmorBarColor.r, TempArmorBarColor.g, TempArmorBarColor.b ) 
        end

        local BtnColorArmorBar = vgui.Create( "DButton", SPanelArmorBar )
        BtnColorArmorBar:SetPos( 0,220 )
        BtnColorArmorBar:SetSize( 200, 30 )
        BtnColorArmorBar:SetText( CLEARHUD.Confirm )
        BtnColorArmorBar:SetFont( "CleanHUD_Font_Small" )
        BtnColorArmorBar:SetTextColor( Color(255,255,255) )
        BtnColorArmorBar.Paint = function( s , w , h )
            draw.RoundedBox( 5, 0, 0, w, h, TempArmorBarColor or string.ToColor( CLEARHUD.ArmorBarColor )) 
        end
        BtnColorArmorBar.DoClick = function() 
            CreateTempFile( "basichud", "armorbarcolor", tostring( TempArmorBarColor ) ) 
        end

    end

    if index == 3 then ---------------------------> Hunger Bar
        
        local SPanelHungerBar = vgui.Create( "DScrollPanel", PanelBasicHUD )
        SPanelHungerBar:SetPos( 275, 60 ) 
        SPanelHungerBar:SetSize( 200, 250 ) 
        SPanelHungerBar:SetBackgroundColor( Color(27,27,27) )
        SPanelHungerBar:SetPaintBackground( true )

        local ChkBoxHungerBarStatus = vgui.Create( "DCheckBox", SPanelHungerBar )
        ChkBoxHungerBarStatus:SetPos( 0, 0 ) 
        ChkBoxHungerBarStatus:SetSize( 20, 20 )
        ChkBoxHungerBarStatus:SetValue( CLEARHUD.HungerBarStatus )
        ChkBoxHungerBarStatus.OnChange = function( self )
            if self:GetChecked() == true then CreateTempFile( "basichud", "hungerbarstatus", "true" )
            else CreateTempFile( "basichud", "hungerbarstatus", "false" ) end
        end
        
        local LblHunger = vgui.Create("DLabel", SPanelHungerBar )
        LblHunger:SetPos( 30, 0 )
        LblHunger:SetSize( 200, 20 )
        LblHunger:SetText( CLEARHUD.Active )
        LblHunger:SetFont( "CleanHUD_Font_Small" )
        LblHunger:SetColor( Color(255,255,255) )
    
        local ColorMixHungerBar = vgui.Create("DColorMixer", SPanelHungerBar )
        ColorMixHungerBar:SetPos( 0, 30 )
        ColorMixHungerBar:SetSize( 200, 180 )		
        ColorMixHungerBar:SetPalette( true )  								
        ColorMixHungerBar:SetWangs( false ) 	
        ColorMixHungerBar:SetPalette( false )
        ColorMixHungerBar:SetAlphaBar( false )
        ColorMixHungerBar:SetColor( string.ToColor( CLEARHUD.HungerBarColor )) 	
        ColorMixHungerBar.ValueChanged = function( self )
            TempHungerBarColor = self:GetColor()
            TempHungerBarColor = Color( TempHungerBarColor.r, TempHungerBarColor.g, TempHungerBarColor.b ) 
        end

        local BtnColorHungerBar = vgui.Create( "DButton", SPanelHungerBar )
        BtnColorHungerBar:SetPos( 0,220 )
        BtnColorHungerBar:SetSize( 200, 30 )
        BtnColorHungerBar:SetText( CLEARHUD.Confirm )
        BtnColorHungerBar:SetFont( "CleanHUD_Font_Small" )
        BtnColorHungerBar:SetTextColor( Color(255,255,255) )
        BtnColorHungerBar.Paint = function( s , w , h )
            draw.RoundedBox( 5, 0, 0, w, h, TempHungerBarColor or string.ToColor( CLEARHUD.HungerBarColor )) 
        end
        BtnColorHungerBar.DoClick = function() 
            CreateTempFile( "basichud", "hungerbarcolor", tostring( TempHungerBarColor )) 
        end

    end

    if index == 4 then ---------------------------> Money Bar
        
        local SPanelMoneyBar = vgui.Create( "DScrollPanel", PanelBasicHUD )
        SPanelMoneyBar:SetPos( 275, 60 ) 
        SPanelMoneyBar:SetSize( 200, 250 ) 
        SPanelMoneyBar:SetBackgroundColor( Color(27,27,27) )
        SPanelMoneyBar:SetPaintBackground( true )

        local ChkBoxMoneyBarStatus = vgui.Create( "DCheckBox", SPanelMoneyBar )
        ChkBoxMoneyBarStatus:SetPos( 0, 0 ) 
        ChkBoxMoneyBarStatus:SetSize( 20, 20 )
        ChkBoxMoneyBarStatus:SetValue( CLEARHUD.MoneyBarStatus )
        ChkBoxMoneyBarStatus.OnChange = function( self )
            if self:GetChecked() == true then CreateTempFile( "basichud", "moneybarstatus", "true" )
            else CreateTempFile( "basichud", "moneybarstatus", "false" ) end
        end
        
        local LblMoneyBar = vgui.Create("DLabel", SPanelMoneyBar )
        LblMoneyBar:SetPos( 30, 0 )
        LblMoneyBar:SetSize( 200, 20 )
        LblMoneyBar:SetText( CLEARHUD.Active )
        LblMoneyBar:SetFont( "CleanHUD_Font_Small" )
        LblMoneyBar:SetColor( Color(255,255,255) )

        local ColorMixMoneyBar = vgui.Create("DColorMixer", SPanelMoneyBar )
        ColorMixMoneyBar:SetPos( 0, 30 )
        ColorMixMoneyBar:SetSize( 200, 180 )		
        ColorMixMoneyBar:SetPalette( true )  								
        ColorMixMoneyBar:SetWangs( false ) 	
        ColorMixMoneyBar:SetPalette( false )
        ColorMixMoneyBar:SetAlphaBar( false )
        ColorMixMoneyBar:SetColor( string.ToColor( CLEARHUD.MoneyBarColor )) 	
        ColorMixMoneyBar.ValueChanged = function( self )
            TempMoneyBarColor = self:GetColor()
            TempMoneyBarColor = Color( TempMoneyBarColor.r, TempMoneyBarColor.g, TempMoneyBarColor.b ) 
        end

        local BtnColorMoneyBar = vgui.Create( "DButton", SPanelMoneyBar )
        BtnColorMoneyBar:SetPos( 0,220 )
        BtnColorMoneyBar:SetSize( 200, 30 )
        BtnColorMoneyBar:SetText( CLEARHUD.Confirm )
        BtnColorMoneyBar:SetFont( "CleanHUD_Font_Small" )
        BtnColorMoneyBar:SetTextColor( Color(255,255,255) )
        BtnColorMoneyBar.Paint = function( s , w , h )
            draw.RoundedBox( 5, 0, 0, w, h, TempMoneyBarColor or string.ToColor( CLEARHUD.MoneyBarColor )) 
        end
        BtnColorMoneyBar.DoClick = function() 
            CreateTempFile( "basichud", "moneybarcolor", tostring( TempMoneyBarColor )) 
        end

    end

    if index == 5 then ---------------------------> Velocity Bar
        
        local SPanelVelocityBar = vgui.Create( "DScrollPanel", PanelBasicHUD )
        SPanelVelocityBar:SetPos( 275, 60 ) 
        SPanelVelocityBar:SetSize( 200, 250 ) 
        SPanelVelocityBar:SetBackgroundColor( Color(27,27,27) )
        SPanelVelocityBar:SetPaintBackground( true )

        local ChkBoxVelocityBarStatus = vgui.Create( "DCheckBox", SPanelVelocityBar )
        ChkBoxVelocityBarStatus:SetPos( 0, 0 ) 
        ChkBoxVelocityBarStatus:SetSize( 20, 20 )
        ChkBoxVelocityBarStatus:SetValue( CLEARHUD.MoneyBarStatus )
        ChkBoxVelocityBarStatus.OnChange = function( self )
            if self:GetChecked() == true then CreateTempFile( "basichud", "moneybarstatus", "true" )
            else CreateTempFile( "basichud", "velocitybarstatus", "false" ) end
        end
        
        local LblVelocityBar = vgui.Create("DLabel", SPanelVelocityBar )
        LblVelocityBar:SetPos( 30, 0 )
        LblVelocityBar:SetSize( 200, 20 )
        LblVelocityBar:SetText( CLEARHUD.Active )
        LblVelocityBar:SetFont( "CleanHUD_Font_Small" )
        LblVelocityBar:SetColor( Color(255,255,255) )

        local ColorMixVelocityBar = vgui.Create("DColorMixer", SPanelVelocityBar )
        ColorMixVelocityBar:SetPos( 0, 30 )
        ColorMixVelocityBar:SetSize( 200, 180 )		
        ColorMixVelocityBar:SetPalette( true )  								
        ColorMixVelocityBar:SetWangs( false ) 	
        ColorMixVelocityBar :SetPalette( false )
        ColorMixVelocityBar:SetAlphaBar( false )
        ColorMixVelocityBar:SetColor( string.ToColor( CLEARHUD.VelocityBarColor )) 	
        ColorMixVelocityBar.ValueChanged = function( self )
            TempVelocityBarColor = self:GetColor()
            TempVelocityBarColor = Color( TempVelocityBarColor.r, TempVelocityBarColor.g, TempVelocityBarColor.b ) 
        end

        local BtnColorVelocityBar = vgui.Create( "DButton", SPanelVelocityBar )
        BtnColorVelocityBar:SetPos( 0,220 )
        BtnColorVelocityBar:SetSize( 200, 30 )
        BtnColorVelocityBar:SetText( CLEARHUD.Confirm )
        BtnColorVelocityBar:SetFont( "CleanHUD_Font_Small" )
        BtnColorVelocityBar:SetTextColor( Color(255,255,255) )
        BtnColorVelocityBar.Paint = function( s , w , h )
            draw.RoundedBox( 5, 0, 0, w, h, TempVelocityBarColor or string.ToColor( CLEARHUD.VelocityBarColor )) 
        end
        BtnColorVelocityBar.DoClick = function() 
            CreateTempFile( "basichud", "velocitybarcolor", tostring( TempVelocityBarColor )) 
        end

    end

end

    end

    -----------------------------------------------------------------
    -------------------|Index 3 = Context Menu |---------------------
    -----------------------------------------------------------------

    if index == 3 then -- if "ContextMenu" is choose then...
    
    local PanelContextMenu = vgui.Create( "DScrollPanel", ConfigMenuFrame )
    PanelContextMenu:SetPos( 5, 100 ) 
    PanelContextMenu:SetSize( 490, 395 ) 
    PanelContextMenu:SetBackgroundColor( Color(27,27,27) )
    PanelContextMenu:SetPaintBackground( true )
    
    end

    -----------------------------------------------------------------
    -------------------|Index 4 = Death HUD |------------------------
    -----------------------------------------------------------------

    if index == 4 then -- if "DeathHUD" is choose then...
    
    local PanelDeathHUD = vgui.Create( "DScrollPanel", ConfigMenuFrame )
    PanelDeathHUD:SetPos( 5, 100 ) 
    PanelDeathHUD:SetSize( 490, 395 ) 
    PanelDeathHUD:SetBackgroundColor( Color(27,27,27) )
    PanelDeathHUD:SetPaintBackground( true )

    end

    -----------------------------------------------------------------
    --------------------|Index 5 = Door HUD |------------------------
    -----------------------------------------------------------------

    if index == 5 then -- if "Door HUD" is choose then...
    
    local PanelDoorHUD = vgui.Create( "DScrollPanel", ConfigMenuFrame )
    PanelDoorHUD:SetPos( 5, 100 ) 
    PanelDoorHUD:SetSize( 490, 395 ) 
    PanelDoorHUD:SetBackgroundColor( Color(27,27,27) )
    PanelDoorHUD:SetPaintBackground( true )

    end

    -----------------------------------------------------------------
    --------------------|Index 6 = Ammo HUD |------------------------
    -----------------------------------------------------------------

    if index == 6 then -- if "Ammo HUD" is choose then...
    
    local PannelAmmoHUD = vgui.Create("DScrollPanel", ConfigMenuFrame)
    PannelAmmoHUD:SetPos( 5, 100 ) 
    PannelAmmoHUD:SetSize( 490, 395 ) 
    PannelAmmoHUD:SetBackgroundColor( Color(27,27,27) )
    PannelAmmoHUD:SetPaintBackground( true )

    end
    end
end

    ----------------------------------------------------------------------------------------------------
    --| Utility functions |-----------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------------

    -----------> Function for double-check (serverside and clientside) the usergroup

    net.Receive( "CleanHUDOpenConfigMenu", function()
        if ply:IsUserGroup( "superadmin" ) then ConfigMenu() end -- double check (here clientside, serverside already checked  in "sv_checkforconfigmenu.lua")
    end)

    -----------> Function to create a temp file in the data folder (needed for a secure step after)

    function CreateTempFile(foldername, filename, filecontent)    
        file.Write( "cleanhud/"..foldername.."/cleanhud_temp_"..filename.."_"..ply:SteamID64()..".txt", filecontent )
    end

    -----------> Function to send the "save temporary settings in permanent" for re-check the usergroup

    function SaveNewSettings()
        net.Start( "CleanHUD_ConfigMenu_savesettings" )
        net.SendToServer()
    end

    -----------> Delete temporary files created earlier

    function DeleteSettingTempFiles() 
        file.Delete( "cleanhud/general/cleanhud_temp_language_"..ply:SteamID64()..".txt" ) 
    end

end)