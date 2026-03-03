local MAP_SCRIPTS = {
    [10595058975] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/ALPremium.lua",
    [3351674303] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/DM192914914.lua",
    [86111605798689] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/SF3142121515151241.lua",
    [77747658251236] = "https://raw.githubusercontent.com/bosskub1/EVE/refs/heads/main/77747658251236.lua",
}


local url = MAP_SCRIPTS[game.PlaceId]
if url then
    loadstring(game:HttpGet(url))()
else
    warn("❌ Map not supported")
end
