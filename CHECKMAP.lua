
local MAP_SCRIPTS = {
    [10595058975] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/ArcaneLineage.lua",
    [3351674303] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/DrivingEmpire.lua",
    [1122334455] = "https://raw.githubusercontent.com/bosskub1/EVE/Script3.lua",
}


local url = MAP_SCRIPTS[game.PlaceId]
if url then
    loadstring(game:HttpGet(url))()
else
    warn("❌ Map not supported")
end
