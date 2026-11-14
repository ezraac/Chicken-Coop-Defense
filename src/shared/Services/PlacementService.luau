local PlacementService = {}
PlacementService.__index = PlacementService

local placementRemotes = game:GetService("ReplicatedStorage").Remotes.Placement
local isServer = game:GetService("RunService").IsServer()

function PlacementService.new(canvasPart)
	local self = setmetatable({}, PlacementService)

	self.CanvasPart = canvasPart

	if isServer then
		self.CanvasObjects = Instance.new("Folder")
		self.CanvasObjects.Name = "CanvasObjects"
		self.CanvasObjects.Parent = canvasPart
	else
		self.CanvasObjects = placementRemotes.InitPlacement:InvokeServer(canvasPart)
	end

	self.CanvasObjects.Surface = Enum.NormalId.Top
	self.GridUnit = 1
end

return PlacementService
