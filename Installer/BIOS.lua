
local result, reason = ""

do
	local handle, chunk = component.proxy(component.list("internet")() or error("Required internet component is missing")).request("https://raw.githubusercontent.com/youaregod666/MineOS_Late_2022/refs/heads/Installer_Test/Installer/Main.lua")

	while true do
		chunk = handle.read(math.huge)
		
		if chunk then
			result = result .. chunk
		else
			break
		end
	end

	handle.close()
end

result, reason = load(result, "=installer")

if result then
	result, reason = xpcall(result, debug.traceback)

	if not result then
		error(reason)
	end
else
	error(reason)	
end
