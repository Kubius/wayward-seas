local landfill_condition = data.raw["item"]["landfill"].place_as_tile.tile_condition

for k, v in pairs(landfill_condition) do
    if v == "gleba-deep-lake" then
        table.remove(landfill_condition,k)
        break
    end
end

table.insert(data.raw.item.foundation.place_as_tile.tile_condition, "wetland-blue-slime")
table.insert(data.raw.item.foundation.place_as_tile.tile_condition, "gleba-deep-lake")