-- name: Save Loc
-- description: CS Surf/Bhop style saveloc
local savedPitch
local savedYaw

local x, y, z
local vx, vy, vz

function mario_update(m)
	-- save loc
	if (m.controller.buttonPressed & R_JPAD) ~= 0 then
		savedPitch = gFirstPersonCamera.pitch
		savedYaw = gFirstPersonCamera.yaw
		x = m.pos.x
		y = m.pos.y
		z = m.pos.z

		vx = m.vel.x
		vy = m.vel.y
		vz = m.vel.z
	end
	-- tele back to save loc
	if (m.controller.buttonPressed & L_JPAD) ~= 0 then
		print(string.format("x:%f,y:%f,z:%f", x, y, z))
		m.pos.x = x
		m.pos.y = y
		m.pos.z = z

		m.vel.x = vx
		m.vel.y = vy
		m.vel.z = vz

		gFirstPersonCamera.pitch = savedPitch
		gFirstPersonCamera.yaw = savedYaw
	end
end

hook_event(HOOK_BEFORE_MARIO_UPDATE, mario_update)
