net.Receive( "CleanHUD_ConfigMenu_savesettings", function(len, ply)

    if ply:IsUserGroup("superadmin") then 
        ---> General
        WriteDefFile("general", "language", ply:SteamID64()) -- General/Language
        WriteDefFile("general", "font1", ply:SteamID64()) -- General/Language
        WriteDefFile("general", "font2", ply:SteamID64()) -- General/Language
        ---> Basic HUD
        WriteDefFile("basichud", "active", ply:SteamID64()) -- BasicHUD/Is active ?
        WriteDefFile("basichud", "position", ply:SteamID64()) -- BasicHUD Position
        WriteDefFile("basichud", "spacebetwnbars", ply:SteamID64()) -- BasicHUD space between each bars
        WriteDefFile("basichud", "barslength", ply:SteamID64()) -- BasicHUD lenght of each bars 
        WriteDefFile("basichud", "barsthickness", ply:SteamID64()) -- BasicHUD/hunger bar status
        WriteDefFile("basichud", "moneycurrency", ply:SteamID64()) -- BasicHUD/hunger money currency
       
        WriteDefFile("basichud", "healthbarcolor", ply:SteamID64()) -- BasicHUD/Health bar color
        WriteDefFile("basichud", "healthbarstatus", ply:SteamID64()) -- BasicHUD/Health bar status
       
        WriteDefFile("basichud", "armorbarcolor", ply:SteamID64()) -- BasicHUD/armor bar color
        WriteDefFile("basichud", "armorbarstatus", ply:SteamID64()) -- BasicHUD/armor bar status
        
        WriteDefFile("basichud", "hungerbarcolor", ply:SteamID64()) -- BasicHUD/hunger bar color
        WriteDefFile("basichud", "hungerbarstatus", ply:SteamID64()) -- BasicHUD/hunger bar status
        
        WriteDefFile("basichud", "moneybarcolor", ply:SteamID64()) -- BasicHUD/money bar color
        WriteDefFile("basichud", "moneybarstatus", ply:SteamID64()) -- BasicHUD/hunger bar status

        WriteDefFile("basichud", "velocitybarcolor", ply:SteamID64()) -- BasicHUD/velocity bar color
        WriteDefFile("basichud", "velocitybarstatus", ply:SteamID64()) -- BasicHUD/velocity bar status
        
        
    end
end)

function WriteDefFile(foldername, filename, SteamID64 ) -- function for write definitive file with the temp file content and delete temp file after
file.Write("cleanhud/"..foldername.."/cleanhud_"..filename..".txt", file.Read("cleanhud/"..foldername.."/cleanhud_temp_"..filename.."_"..SteamID64..".txt", "DATA") or file.Read("cleanhud/"..foldername.."/cleanhud_"..filename..".txt", "DATA"))
file.Delete("cleanhud/"..foldername.."/cleanhud_temp_"..filename.."_"..SteamID64..".txt")
end