for k, v in pairs (data.raw["item"]["landfill"].place_as_tile.tile_condition) do
    if v == "gleba-deep-lake" then
        table.remove(data.raw["item"]["landfill"].place_as_tile.tile_condition,k)
    end
end

table.insert(data.raw.item.foundation.place_as_tile.tile_condition, "gleba-deep-lake");