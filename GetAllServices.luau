local function PrintAllServices(services, ServiceCount)
	local lines = {}

	for serviceName in pairs(services) do
		table.insert(lines, serviceName)
	end
	table.sort(lines)

	for _, serviceName in ipairs(lines) do
		print(serviceName .. ' = game:GetService("' .. serviceName .. '"),')
	end

	print("Services retrieved: " .. ServiceCount)
end

local function GetAllServices(PrintServices: boolean)
	local services = {}
	local ServiceCount = 0

	for _, service in ipairs(game:GetChildren()) do
		local serviceName = string.gsub(service.Name, "%s+", "")
		local success, result = pcall(function()
			return game:GetService(serviceName)
		end)

		if success and result then
			services[serviceName] = result
			ServiceCount += 1
		end
	end

	table.sort(services)
	
	if PrintServices then
		PrintAllServices(services, ServiceCount)
	end

	return services
end

return GetAllServices(false)
