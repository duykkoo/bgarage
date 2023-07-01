if GetResourceState("ox_core") ~= "started" then return end

if UseOx then
	assert(load(LoadResourceFile("ox_core", "imports/server.lua"), "@@ox_core/imports/server.lua"))()
end

--This was made based upon other resources that use ox_core
---@todo
local players = {}

---@param callback function
function Framework.onPlayerLoaded(cb)
	AddEventHandler("ox:playerLoaded", function(source)
		---
	end)
end

---@param callback function
function Framework.onPlayerUnloaded(cb)
	AddEventHandler("ox:playerLogout", function(source)
		players[source] = nil
	end)
end

---@param name any
---@param callback function
function Framework.RegisterCallback(name, cb)
	lib.callback.register(name, cb)
end

---@param source number
---@return string
function Framework.getPlayerId(source)
	return Ox.GetPlayer(source).charid
end

---@param source number
---@param amount value
function Framework.removeMoney(source, amount)
	local player = Framework.getPlayerId(source)
	if not player then return end

	if type(amount) ~= "number" then return end

	---
end