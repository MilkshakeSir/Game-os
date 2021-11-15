local stats = game:GetService('Stats')

local memoryReportFormat = "%.3f MBs"

local tags = {
	"Instances",
	"Scripts",
	"GraphicsSolidModels",
	"GraphicsTexture",
	"Signals",
	"Sounds",
	"StreamingSounds",
	"Gui"
}

local enumTags = {
	Enum.DeveloperMemoryTag.Instances,
	Enum.DeveloperMemoryTag.Script,
	Enum.DeveloperMemoryTag.GraphicsSolidModels,
	Enum.DeveloperMemoryTag.GraphicsTexture,
	Enum.DeveloperMemoryTag.Signals,
	Enum.DeveloperMemoryTag.Sounds,
	Enum.DeveloperMemoryTag.StreamingSounds,
	Enum.DeveloperMemoryTag.Gui
}
while true do
	local total = 0
	for i = 1, #tags do
		local consumption = stats:GetMemoryUsageMbForTag(enumTags[i])
		total = total + consumption
		script.Parent.Main[tags[i]].Value.Text = memoryReportFormat:format(consumption)
	end
	script.Parent.Main.Total.Value.Text = memoryReportFormat:format(total)
	wait()
end