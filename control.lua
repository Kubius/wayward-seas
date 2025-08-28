local crash_site = require("crash-site")
local e = defines.events

local gleba_start_checkup = function()
  if not script.active_mods["cargo-ships"] then
    if not script.active_mods["dredgeworks"] then
      return {"wayward-seas-intro.no-recommended-mods"}
    else
      return {"wayward-seas-intro.cargo-ships-missing"}
    end
  end
  if not script.active_mods["dredgeworks"] then
    return {"wayward-seas-intro.dredgeworks-missing"}
  end
  return {"wayward-seas-intro.recommended-mods-installed"}
end

script.on_event(e.on_player_created, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if settings.startup["do_ws_start_checkup"].value == true and (not storage.gleba_start_checkup_done) then
      if game.is_multiplayer() then
        game.print(gleba_start_checkup())
      else
        if (not script.active_mods["cargo-ships"]) or (not script.active_mods["dredgeworks"]) then
          game.show_message_dialog{text = gleba_start_checkup()}
        else
          game.print(gleba_start_checkup())
        end
      end
      storage.gleba_start_checkup_done = true
    end
end)