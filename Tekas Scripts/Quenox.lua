if syn then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "synapse has a skill issue",
		Text = "60 upvalues error jumpscare (synapse is buggy; script will not run)",
		Duration = 3
	})
	return
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/scripts/QuenoxLoad.lua"))()
