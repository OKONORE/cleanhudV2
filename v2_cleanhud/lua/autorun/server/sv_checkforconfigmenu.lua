--util.AddNetworkString( "CleanHUDOpenConfigMenu" ) -- define the net message

hook.Add("PlayerSay", "CleanHUDConfigMenu", function( sender, text )

 if text == "/cleanhud" and (sender:IsUserGroup("superadmin")) then -- check the group, and if he send the command

    net.Start( "CleanHUDOpenConfigMenu" ) -- send the net message
    net.Send( sender )
     
 end
    
end)