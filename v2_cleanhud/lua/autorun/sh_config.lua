-- nothing to do here, all is in "/clearhud"

CLEARHUD = {}

CLEARHUD.Gamemode           = engine.ActiveGamemode()
CLEARHUD.Language           = file.Read("cleanhud/general/cleanhud_language.txt", "DATA") or "english" 
CLEARHUD.Font1              = file.Read("cleanhud/general/cleanhud_font1.txt", "DATA") or "Arial" 
CLEARHUD.Font2              = file.Read("cleanhud/general/cleanhud_font2.txt", "DATA") or "Arial" 

-- Basic HUD

CLEARHUD.BasicHUDEnable     = file.Read( "cleanhud/basichud/cleanhud_active.txt", "DATA" ) or "true" 
CLEARHUD.BasicHUDPos        = file.Read( "cleanhud/basichud/cleanhud_position.txt", "DATA" ) or "DownLeft" 
CLEARHUD.BasicHUDSpaceBetwnBars = file.Read( "cleanhud/basichud/cleanhud_spacebetwnbars.txt", "DATA" ) or "10"
CLEARHUD.BasicHUDbarsLength = file.Read( "cleanhud/basichud/cleanhud_barslength.txt", "DATA" ) or "300"
CLEARHUD.BasicHUDBarsThickness = file.Read( "cleanhud/basichud/cleanhud_barsthickness.txt", "DATA" ) or "30"
CLEARHUD.BasicHUDMoneyCurrency = file.Read( "cleanhud/basichud/cleanhud_moneycurrenct.txt", "DATA" ) or "$"

CLEARHUD.HealthBarStatus    = file.Read( "cleanhud/basichud/cleanhud_healthbarstatus.txt", "DATA" ) or "true" 
CLEARHUD.HealthBarColor     = file.Read( "cleanhud/basichud/cleanhud_healthbarcolor.txt", "DATA" ) or tostring(Color(225, 0, 0 ))

CLEARHUD.ArmorBarStatus    = file.Read( "cleanhud/basichud/cleanhud_armorbarstatus.txt", "DATA" ) or "true" 
CLEARHUD.ArmorBarColor     = file.Read( "cleanhud/basichud/cleanhud_armorbarcolor.txt", "DATA" ) or tostring(Color(0, 0, 255 ))

CLEARHUD.HungerBarStatus    = file.Read( "cleanhud/basichud/cleanhud_hungerbarstatus.txt", "DATA" ) or "true" 
CLEARHUD.HungerBarColor     = file.Read( "cleanhud/basichud/cleanhud_hungerbarcolor.txt", "DATA" ) or tostring(Color(245, 125, 0 ))

CLEARHUD.MoneyBarStatus    = file.Read( "cleanhud/basichud/cleanhud_moneybarstatus.txt", "DATA" ) or "true" 
CLEARHUD.MoneyBarColor     = file.Read( "cleanhud/basichud/cleanhud_moneybarcolor.txt", "DATA" ) or tostring(Color(245, 125, 0 ))

CLEARHUD.VelocityBarStatus    = file.Read( "cleanhud/basichud/cleanhud_velocitybarstatus.txt", "DATA" ) or "true" 
CLEARHUD.VelocityBarColor     = file.Read( "cleanhud/basichud/cleanhud_velocitybarcolor.txt", "DATA" ) or tostring(Color(245, 125, 0 ))

CLEARHUD.SalaryBarStatus = file.Read( "cleanhud/basichud/cleanhud_speedbarstatus.txt", "DATA" ) or "true"