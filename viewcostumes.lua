-- // Configuration: \\ --

local prefix = '.';

-- // Main: \\ --

local library = loadstring(game:HttpGet("https://pastebin.com/raw/8NVWi5PM"))(); -- Avatar Library

-- // For the sake of your sanity, do not read the ugly ass code below, you've been warned.

local f;
if game.CoreGui:FindFirstChild("AvatarCache") then
	f = game.CoreGui.AvatarCache
else 
	f = Instance.new("Folder");
	f.Parent = game.CoreGui;
	f.Name = 'AvatarCache';
end

pcall(function()
	game.CoreGui.UI:Destroy();
end)

local UI = Instance.new("ScreenGui")
local AvatarViewer = Instance.new("Frame")
local LblTitle = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local Next = Instance.new("TextButton")
local Previous = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local OutfitName = Instance.new("TextLabel")

UI.Name = "UI"
UI.Parent = game.CoreGui;

AvatarViewer.Name = "AvatarViewer"
AvatarViewer.Parent = UI
AvatarViewer.Active = true
AvatarViewer.AnchorPoint = Vector2.new(0.5, 0.5)
AvatarViewer.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
AvatarViewer.BorderColor3 = Color3.fromRGB(255, 255, 255)
AvatarViewer.BorderSizePixel = 5
AvatarViewer.ClipsDescendants = true
AvatarViewer.Position = UDim2.new(0.5, 0, 0.5, 0)
AvatarViewer.Size = UDim2.new(0, 251, 0, 346)
AvatarViewer.Style = Enum.FrameStyle.DropShadow
AvatarViewer.Visible = false

LblTitle.Name = "LblTitle"
LblTitle.Parent = AvatarViewer
LblTitle.AnchorPoint = Vector2.new(0.5, 0)
LblTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LblTitle.BackgroundTransparency = 1.000
LblTitle.Position = UDim2.new(0.5, 0, 0, 8)
LblTitle.Size = UDim2.new(1, 0, 0, 20)
LblTitle.ZIndex = 66
LblTitle.Font = Enum.Font.SourceSansBold
LblTitle.Text = "ROBLOX's Outfits"
LblTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LblTitle.TextScaled = true
LblTitle.TextSize = 24.000
LblTitle.TextStrokeColor3 = Color3.fromRGB(128, 128, 128)
LblTitle.TextStrokeTransparency = 0.700
LblTitle.TextWrapped = true

UITextSizeConstraint.Parent = LblTitle
UITextSizeConstraint.MaxTextSize = 24

Next.Name = "Next"
Next.Parent = AvatarViewer
Next.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Next.Position = UDim2.new(0, 163, 0, 292)
Next.Size = UDim2.new(0, 60, 0, 30)
Next.ZIndex = 2
Next.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
Next.Font = Enum.Font.SourceSansBold
Next.Text = ">"
Next.TextColor3 = Color3.fromRGB(126, 126, 126)
Next.TextSize = 20.000
Next.TextWrapped = true

Previous.Name = "Previous"
Previous.Parent = AvatarViewer
Previous.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Previous.Position = UDim2.new(0, 12, 0, 292)
Previous.Size = UDim2.new(0, 60, 0, 30)
Previous.ZIndex = 2
Previous.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
Previous.Font = Enum.Font.SourceSansBold
Previous.Text = "<"
Previous.TextColor3 = Color3.fromRGB(126, 126, 126)
Previous.TextSize = 20.000

CloseButton.Name = "CloseButton"
CloseButton.Parent = AvatarViewer
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Position = UDim2.new(0, 73, 0, 292)
CloseButton.Size = UDim2.new(0, 90, 0, 30)
CloseButton.ZIndex = 2
CloseButton.Style = Enum.ButtonStyle.RobloxRoundButton
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12.000

OutfitName.Name = "OutfitName"
OutfitName.Parent = AvatarViewer
OutfitName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutfitName.BackgroundTransparency = 1.000
OutfitName.Position = UDim2.new(0.5, 0, 0, 35)
OutfitName.Size = UDim2.new(0, 1, 0, 1)
OutfitName.Font = Enum.Font.SourceSans
OutfitName.Text = "[0/0] Nil"
OutfitName.TextColor3 = Color3.fromRGB(255, 255, 255)
OutfitName.TextSize = 14.000
OutfitName.TextStrokeColor3 = Color3.fromRGB(128, 128, 128)
OutfitName.TextStrokeTransparency = 0.700

-- I have no idea where I got this lmfao I just have it saved on my desktop

local drag = function(frame)
	local mouse = game:GetService("Players").LocalPlayer:GetMouse();
	local inputService = game:GetService('UserInputService');
	local heartbeat = game:GetService("RunService").Heartbeat;


	local s, event = pcall(function()
		return frame.MouseEnter
	end)

	if s then
		frame.Active = true;

		event:connect(function()
			local input = frame.InputBegan:connect(function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 then
					local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
					while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', 0, true);
					end
				end
			end)

			local leave;
			leave = frame.MouseLeave:connect(function()
				input:disconnect();
				leave:disconnect();
			end)
		end)
	end
end

drag(AvatarViewer);

local current;
local tc = {};
local position = 0;
local tbl = {};

local index = function(id)
	local dummy;
	if tc[id] then
		dummy = tc[id];
	else
		tc[id] = library.fetch(id);
		dummy = tc[id];
	end
	dummy.Parent = f;
	
	local viewportFrame = Instance.new("ViewportFrame")
	viewportFrame.Size = UDim2.new(0, 200, 0, 220);
	viewportFrame.Position = UDim2.new(.5, 0, .5, 0)
	viewportFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	viewportFrame.Name = 'VPF';
	viewportFrame.AnchorPoint = Vector2.new(.5, .5);
	viewportFrame.BorderSizePixel = 0;
	viewportFrame.BackgroundTransparency = 1;
	viewportFrame.Parent = AvatarViewer;

	dummy.Parent = viewportFrame;
	dummy.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
	local vp = viewportFrame;
	local root = dummy:WaitForChild("HumanoidRootPart");

	local c = Instance.new("Camera")
	c.Parent = vp
	vp.CurrentCamera = c

	local c = 0;

	game:GetService("RunService").Heartbeat:Connect(function()
		if viewportFrame:IsDescendantOf(game.CoreGui) then 
			local cframe = root.CFrame * CFrame.Angles(0, math.rad(c), 0) * CFrame.new(0, 0, -6) 
			cframe = CFrame.new(cframe.p, root.Position)
			vp.CurrentCamera.CFrame = cframe;
			c = c + 1;
		end 
	end)
end

AvatarViewer.ChildAdded:Connect(function(o)
	if o:IsA("ViewportFrame") then
		for i, v in pairs(o.Parent:GetChildren()) do
			if v:IsA("ViewportFrame") and v == o == false then
				v.Dummy.Parent = f;
				v:Destroy();
			end
		end
	end
end)

function loadoutfits(uid)
	local data = library.get(uid);
	position = 0;
	local l = 0;
	tbl = {};
	local start = '';
	for i, v in pairs(data) do
		l = l + 1;
		if l == 1 then
			start = i;
		end
		tbl[l] = v;
	end

	LblTitle.Text = game:GetService("Players"):GetNameFromUserIdAsync(uid).."'s Outfits"
	
	if l >= 1 then
		position = 1;
		OutfitName.Text = '[1/'..l..'] '..start;
		current = data;
		index(data[start])
	else
		OutfitName.Text = '[0/0] None found!';
	end
	
	AvatarViewer.Visible = true;
end

Next.MouseButton1Click:Connect(function()
	if position == #tbl then
		position = 1;
	else
		position = position + 1;
	end
	local gn = function(ii)
		for i, v in pairs(current) do
			if v == ii then
				return i;
			end
		end
		return 'N/A';
	end
	OutfitName.Text = '['..position..'/'..#tbl..'] '..gn(tbl[position]);
	index(tbl[position])
end)

Previous.MouseButton1Click:Connect(function()
	if position == 1 then
		position = #tbl;
	else
		position = position - 1;
	end
	local gn = function(ii)
		for i, v in pairs(current) do
			if v == ii then
				return i;
			end
		end
		return 'N/A';
	end
	OutfitName.Text = '['..position..'/'..#tbl..'] '..gn(tbl[position]);
	index(tbl[position])
end)

CloseButton.MouseButton1Click:Connect(function()
	AvatarViewer.Visible = false;
end)

local notify = function(msg)             
	game.StarterGui:SetCore("SendNotification", {
		Title = "Notification:"; 
		Text = msg; 
		Duration = 15;
	})
end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(m)
	local spl = string.split(m, ' ');
	if #spl >= 2 then
		if spl[1] == prefix..'load' then
			
			local v;
			pcall(function()
				v = tonumber(spl[2]);
			end)
			
			if v then
				local valid;
				pcall(function()
					valid =  game:GetService("Players"):GetNameFromUserIdAsync(v)
				end)
				if valid then
					loadoutfits(v);
				else
					notify("Invalid user!")
				end
			else 
				local valid;
				pcall(function()
					valid =  game:GetService("Players"):GetUserIdFromNameAsync(spl[2])
				end)
				if valid then
					loadoutfits(game:GetService("Players"):GetUserIdFromNameAsync(spl[2]));
				else
					notify("Invalid user!")
				end
			end
		else
		end
		
	end
end)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
 
local bindableEvent = Instance.new("BindableEvent")
local function action(targetPlayer)
	loadoutfits(targetPlayer.UserId);
end
bindableEvent.Event:Connect(action)
 
local options = {
	"View Outfits",
	bindableEvent
}
StarterGui:SetCore("AvatarContextMenuEnabled", true)
StarterGui:SetCore("AddAvatarContextMenuOption", options)
