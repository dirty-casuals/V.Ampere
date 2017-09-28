local camera = require("vendors.orthographic.camera")

local M = {}

--- Works out if a gameobject is in viewport of a camera
-- @param camera_id The id of the camera
-- @param go_pos    The position of the gameobject
-- @param scr_w     The screen width
-- @param scr_h     The screen height
-- @return A bool, wether the gameobject is in view or not
function M.is_go_on_screen(camera_id, go_pos, scr_w, scr_h)
	local screen_pos = camera.world_to_screen(camera_id, go_pos)
	local in_screen_x = screen_pos.x < scr_w and screen_pos.x > 0.0 
	local in_screen_y = screen_pos.y < scr_h and screen_pos.y > 0.0 

	return in_screen_x and in_screen_y
end

--- Works out if a gameobject is near the viewport of a camera
-- @param camera_id The id of the camera
-- @param go_pos    The position of the gameobject
-- @param scr_w     The screen width
-- @param scr_h     The screen height
-- @param near_dist The distance within which to be considered near
-- @return A bool, wether the gameobject is near in view or not
function M.is_go_near_screen(camera_id, go_pos, scr_w, scr_h, near_dist)
	local screen_pos = camera.world_to_screen(camera_id, go_pos)
	local near_screen_x = screen_pos.x < scr_w + near_dist and screen_pos.x > 0.0 
	local near_screen_y = screen_pos.y < scr_h + near_dist and screen_pos.y > 0.0 

	return near_screen_x and near_screen_y
end

return M