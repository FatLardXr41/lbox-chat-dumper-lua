-- original LUA: https://lmaobox.net/lua/Lua_Classes/UserMessage/
-- Edited By https://lmaobox.net/forum/v/profile/34545496/somefemboy5141
-- The TXT file is in team fortress 2 folder, not in %localappdata%.
local function myCoolMessageHook(msg)
    if msg:GetID() == SayText2 then 
        local bf = msg:GetBitBuffer()
        bf:SetCurBit(8) -- skip 1 byte of not useful data
        local chatType = bf:ReadString(256)
        local playerName = bf:ReadString(256)
        local message = bf:ReadString(256)
        local pLocal  = entities.GetLocalPlayer()
		local pLocalName = pLocal:GetName()
        local file = io.open("outputforchat.txt", "a")
        
        if file then
            file:write( "[" .. pLocalName .. "]" .. "Player " .. playerName .. " said " .. message .. "\n")
            file:close()
        else
            print("Error: Couldn't open file for writing.")
        end
    end
end

callbacks.Unregister("DispatchUserMessage", "myCoolMessageHook");
callbacks.Register("DispatchUserMessage", "myCoolMessageHook", myCoolMessageHook)
--io.close(file)