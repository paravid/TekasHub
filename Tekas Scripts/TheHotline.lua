local Global = (getgenv and getgenv()) or shared
if game:GetService("Players").LocalPlayer.Character.Name ~= "Reanimate" then
	error("Not Reanimated")
end
if game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck") then
	error("Script Running")
end
local getsynasset = getsynasset or getcustomasset or function() warn("no getcustomasset/getsynasset") end
local Events = Global.TableOfEvents
Global.GetLoadLibrary()
Global.AntiScript()

local script = game:GetObjects("rbxassetid://11390460692")[1]
task.wait(0.5)
local AHB = Instance.new("BindableEvent")
local FPS = 30
local TimeFrame = 0
local LastFrame = tick()
local Frame = 1/FPS
table.insert(Events, game:GetService('RunService').Heartbeat:connect(function(s,p)
	TimeFrame = TimeFrame + s
	if(TimeFrame >= Frame)then
		for i = 1,math.floor(TimeFrame/Frame) do
			AHB:Fire()
		end
		LastFrame=tick()
		TimeFrame=TimeFrame-Frame*math.floor(TimeFrame/Frame)
	end
end))

local function swait(dur)
	if(dur == 0 or typeof(dur) ~= 'number')then
		AHB.Event:wait()
	else
		for i = 1, dur*FPS do
			AHB.Event:wait()
		end
	end
end

wait(1/60)
Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound",Torso)

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor


Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 40
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
--ROBLOXIDLEANIMATION.Parent = Humanoid
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
ANIMATOR:Destroy()
local UNANCHOR = true
local HITPLAYERSOUNDS = {--[["199149137", "199149186", "199149221", "199149235", "199149269", "199149297"--]]"263032172", "263032182", "263032200", "263032221", "263032252", "263033191"}	
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

table.insert(Events, game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end))


local function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end


function Clerp(a, b, t)
    return a:lerp(b,t)
end



function weld(parent, part0, part1, c0, c1)
	local w = IT("Weld")
	w.Part0 = part0
	w.Part1 = part1
	w.C0 = c0
	w.C1 = c1
	w.Parent = parent
	return w
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.EmitterSize = 5*VOLUME
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end
-- MODIFED PART
local gu = script.g
local Hat = Character:FindFirstChild("Type-49 Abomindation Back Accessory")
if Hat then
	gu.Gun.Transparency = 1
	Global.AlignPart(Hat.Handle, gu.Gun, Vector3.new(0.3,-0.45, -0.25), Vector3.new(50,-90,0))
end
local Bullet = Global.RealChar:FindFirstChild("Bullet")
if Bullet then
	if Bullet:FindFirstChild("AntiRotate") then
		Bullet:FindFirstChild("AntiRotate"):Destroy()
	end
	Global.PartDisconnected = true
	local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local RootTo = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	local Pos = Instance.new("BodyPosition")
	Pos.MaxForce = Vector3.new(1,1,1)*math.huge
	Pos.P = 25000
	Pos.D = 125
	Pos.Name = "Movement"
	Pos.Position = Bullet.Position
	Pos.Parent = Bullet
	local Flinger = Instance.new("BodyAngularVelocity")
	Flinger.MaxTorque = Vector3.new(1,1,1)*math.huge
	Flinger.P = math.huge
	Flinger.AngularVelocity = Vector3.new(5000,5000,5000)
	Flinger.Name = "Flinger"
	Flinger.Parent = Bullet
	table.insert(Events, game:GetService("RunService").PostSimulation:Connect(function()
		if ATTACK then
			if Mouse.Target ~= nil then
				Pos.Position = Mouse.Hit.Position
			end
		else
			Pos.Position = RootTo.Position
		end
	end))
end

function WACKYEFFECT2(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end


function SHAKECAM(POSITION,RANGE,INTENSITY,TIME)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						local CAMSHAKER = script.CamShake:Clone()
						CAMSHAKER.Shake.Value = INTENSITY
						CAMSHAKER.Timer.Value = TIME
						CAMSHAKER.Parent = CHILD
						CAMSHAKER.Disabled = false
					end
				end
			end
		end
	end
end


local asd = Instance.new("ParticleEmitter")
asd.Color = ColorSequence.new(Color3.new(0.5, 0, 0), Color3.new(.3, 0, 0))
asd.LightEmission = .1
asd.Texture = "http://www.roblox.com/asset/?ID=291880914"
aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6),NumberSequenceKeypoint.new(1, 2)})
bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
asd.Transparency = bbb
asd.Size = aaa
asd.ZOffset = .9
asd.Acceleration = Vector3.new(0, -15, 0)
asd.LockedToPart = false
asd.EmissionDirection = "Back"
asd.Lifetime = NumberRange.new(1, 2)
asd.Rotation = NumberRange.new(-100, 100)
asd.RotSpeed = NumberRange.new(-100, 100)
asd.Speed = NumberRange.new(10)
asd.Enabled = false
asd.VelocitySpread = 999

function getbloody(victim,amount)
	local PART = CreatePart(3, Effects, "Metal", 0, 1, "Mid gray", "Blood", victim.Size)
	PART.CFrame = victim.CFrame
	local HITPLAYERSOUNDS = {"356551938","264486467"}
	Debris:AddItem(PART,5)
	CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
	CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
	CreateSound(HITPLAYERSOUNDS[MRANDOM(1, #HITPLAYERSOUNDS)], PART, 1, (math.random(8,12)/10))
	local prtcl = asd:Clone()
	prtcl.Parent = PART
	prtcl:Emit(amount*10)
end



--weap
local SONG = 1251094537
d = CF(0,0,0)
local w = weld(RightArm,gu.Main,RightArm,CF(0,-.3,0)*ANGLES(RAD(180),RAD(180),RAD(180)),d)
for i,v in pairs(gu:GetChildren()) do
v.Anchored = false	
end
gu.Parent = Character
local naeeym2 = IT("BillboardGui",Character)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(5,35,2,15)
naeeym2.StudsOffset = Vector3.new(0,2,0)
naeeym2.MaxDistance = 75
naeeym2.Adornee = Character.Head
naeeym2.Name = "a"
local t = IT("TextLabel",naeeym2)
t.BackgroundTransparency = 1
t.TextScaled = true
t.BorderSizePixel = 0
t.Text = "The Hotline"
t.Font = "Arial"
t.TextSize = 45
t.TextStrokeTransparency = 0
t.TextColor3 = C3(1,1,1)
t.TextStrokeColor3 = C3(0,0,0)
t.Size = UDim2.new(1,0,0.5,0)
t.Parent = naeeym2
Hole = gu.Hole
gre = script.gre
gre.Parent = nil

--uhhh

function chatfunc(text,timeex)
local chat = coroutine.wrap(function()
if Character:FindFirstChild("TalkingBillBoard")~= nil then
Character:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeey2 = Instance.new("BillboardGui",Character)
naeey2.AlwaysOnTop = true
naeey2.Size = UDim2.new(5,35,2,15)
naeey2.StudsOffset = Vector3.new(0,2,0)
naeey2.MaxDistance = 75
naeey2.Adornee = Character.Head
local tecks2 = t:Clone()
tecks2.Parent = naeey2
local tecks3 = t:Clone()
t.TextTransparency = t.TextTransparency  + 1
t.TextStrokeTransparency = t.TextStrokeTransparency + 1
for i = 0, 74*timeex do
swait()
t.TextTransparency = 1
t.TextStrokeTransparency = 1
tecks2.Text = text
tecks3.Text = text
end
local randomrot = math.random(1,2)
if randomrot == 1 then
for i = 1, 50 do
swait()
tecks2.Text = text
tecks3.Text = text
t.TextTransparency = t.TextTransparency - .02
t.TextStrokeTransparency = t.TextStrokeTransparency - .02
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
elseif randomrot == 2 then
	for i = 1, 50 do
swait()
tecks2.Text = text
tecks3.Text = text
t.TextTransparency = t.TextTransparency - .02
t.TextStrokeTransparency = t.TextStrokeTransparency - .02
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
end
t.TextTransparency = 0
t.TextStrokeTransparency = 0
naeey2:Destroy()
end)
chat()
end
---

--dmg

local function kill(MODEL)

end

local function ManSlaughter(MAN)
	
end

local function ApplyDamage(Humanoid,Damage)

end

local function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)

end

--attacks
local function cs()
	if SONG == 1251094537 then
	SONG = 150486020
	elseif SONG == 150486020 then
	SONG = 143364907
	elseif SONG == 143364907 then
	SONG = 729655571
	elseif SONG == 729655571 then
	SONG = 234176878
	elseif SONG == 234176878 then
	SONG = 1338971957
	elseif SONG == 1338971957 then
	SONG = 4361463193
	elseif SONG == 4361463193 then
	SONG = 1251094537	
	end
end

local function shoot()
	ATTACK = true
for i = 1,15 do
	Swait()
  	local Alpha = .15
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.1,0.6,-0.4)*ANGLES(RAD(170.2),RAD(-6),RAD(95.9)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.1,0.1,-0.1)*ANGLES(RAD(-72.1),RAD(71.7),RAD(152.2)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(-0,1,0)*ANGLES(RAD(-90),RAD(0),RAD(132.1)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1,0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.9,0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)	
end	
CreateSound(3617692930,gu.Gun,5,1,false)
for i = 1,10 do
Swait()
  	local Alpha = .15
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.6,0.6,-0.9)*ANGLES(RAD(164.8),RAD(39.6),RAD(97.6)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.1,0.1,-0.1)*ANGLES(RAD(-72.1),RAD(71.7),RAD(152.2)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(-0,1,0.1)*ANGLES(RAD(-97.3),RAD(1.8),RAD(166.5)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1,0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.9,0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)	
end
for i = 0,30 do
	Swait()
	  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.2,0.8,-1)*ANGLES(RAD(93.7),RAD(-0.8),RAD(73.2)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1,0.5,-0.2)*ANGLES(RAD(8.3),RAD(68.5),RAD(88.8)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(-0,1,0)*ANGLES(RAD(-90),RAD(0),RAD(153.1)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1,0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.9,0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)
end	
repeat
for i = 0,2 do
	Swait()
	  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.2,0.8,-1)*ANGLES(RAD(93.7),RAD(-0.8),RAD(73.2)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1,0.5,-0.2)*ANGLES(RAD(8.3),RAD(68.5),RAD(88.8)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(-0,1,0)*ANGLES(RAD(-90),RAD(0),RAD(153.1)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1,0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.9,0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)
end
local HIT,POS = CastProperRay(Hole.Position,  Mouse.Hit.p, 500, Character)
local DISTANCE = (POS - Hole.Position).Magnitude
if HIT then
if HIT.Parent:FindFirstChildOfClass("Humanoid") then
ManSlaughter(HIT.Parent)
elseif HIT.Parent.Parent:FindFirstChildOfClass("Humanoid") then
ManSlaughter(HIT.Parent.Parent)
end
end
WACKYEFFECT2({Time = 12, EffectType = "Box", Size = VT(.01,.01,.01), Size2 = VT(.7,.7,.7), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame, MoveToPos = nil, RotationX = MRANDOM(-20,20), RotationY = MRANDOM(-20,20), RotationZ = MRANDOM(-20,20), Material = "Neon", Color = C3(1,1,0),SoundID = 529312443, SoundPitch = 1, SoundVolume = 10, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
WACKYEFFECT2({Time = 8, EffectType = "Box", Size = Vector3.new(0,0,DISTANCE), Size2 = Vector3.new(0.1,0.1,DISTANCE), Transparency = 0, Transparency2 = 1, CFrame = CF(Hole.Position,POS)*CF(0,0,-DISTANCE/2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.new(1,1,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
WACKYEFFECT2({Time = 20, EffectType = "Round Slash", Size = VT(.01,.01,.01), Size2 = VT(.025,.01,.025), Transparency = 0, Transparency2 = 1, CFrame = Hole.CFrame*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})

for i = 0,0.10,0.2 do
Swait()
local Alpha = .6
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0+0.08*COS(SINE/27),-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.2,0.8,-.5)*ANGLES(RAD(93.7),RAD(-0.8),RAD(73.2)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(0.9,0.5,0)*ANGLES(RAD(8.3),RAD(68.5),RAD(88.8)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(-0,1,0)*ANGLES(RAD(-90),RAD(0),RAD(153.1)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1-0.08*COS(SINE/27),0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.9-0.08*COS(SINE/27),0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)	
end
until HOLD == false
ATTACK = false
end

local function taunt()
ATTACK = true
chatfunc("Such a waste.",.8)
CreateSound(4148542202,RootPart,6,1,false)
for i = 0,85 do
local Alpha = .1
Swait()
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.7,0.3,-0.9)*ANGLES(RAD(-36),RAD(-68.6),RAD(143.6)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(0,1,0.1)*ANGLES(RAD(-100.6),RAD(-4.8),RAD(-155.8 - 20 * COS(SINE/8))),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1,0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1,-0.9,0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)
end
ATTACK = false
end

local function grenade()
ATTACK = true
for i = 0,20 do
	Swait()
	  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.9,0.4,0)*ANGLES(RAD(24.5),RAD(-38.2),RAD(62.8)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(0,1,0.1)*ANGLES(RAD(-99.3),RAD(-11),RAD(-130.6)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1,0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.9,0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)
end
local grec = gre:Clone()
grec.Parent = Character
grec.Anchored = false
for i,v in pairs(grec:GetChildren()) do
	if v:IsA("BasePart") then v.Anchored = false end
	end
local gw = weld(LeftArm,grec,LeftArm,CF(0.4,0,1)*ANGLES(RAD(90),0,0),d)
CreateSound(326088041,grec,8,1,false)
for i = 0,24 do
	Swait()
	  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0.1,0.2)*ANGLES(RAD(-76.8),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.7,0.7,0.1)*ANGLES(RAD(68),RAD(-67),RAD(-128.6)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(0,1,0.1)*ANGLES(RAD(-92.1),RAD(-4.7),RAD(175)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-0.9,-1,0.1)*ANGLES(RAD(-24.1),RAD(-50.1),RAD(-16.4)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-1.1,0)*ANGLES(RAD(-38),RAD(80.2),RAD(25.4)),Alpha)
end
gw:Destroy()
for i,v in pairs(grec:GetChildren()) do
	if v:IsA("BasePart") then
		v.CanCollide = true
	end
end
grec.CanCollide = true
grec.Parent = workspace
local br = CF(grec.Position,Mouse.Hit.p)
local mmm = IT("BodyVelocity")
	mmm.Parent = grec
	mmm.Velocity = br.lookVector*125
	mmm.MaxForce = VT(50000,50000,50000)
	Debris:AddItem(mmm,.19)
	Debris:AddItem(grec,3)
	coroutine.resume(coroutine.create(function()
		local h = false
		swait(1.2)
		local hi = grec.Touched:Connect(function(hit)
		if h == false and hit.Parent ~= Character then
			h = true
			grec:BreakJoints()
			ApplyAoE(grec.Position,33,0,0,100,true)
			CreateSound(142070127,grec,10,1,false)
			for i = 1,4 do
				WACKYEFFECT2({Time = 80, EffectType = "Sphere", Size = VT(40,40,40), Size2 = VT(55,55,55), Transparency = 0, Transparency2 = 1, CFrame = grec.CFrame, MoveToPos = grec.Position + VT(MRANDOM(-25,25),0,MRANDOM(-25,25)), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(255,MRANDOM(30,150),0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
			end
			for i = 1,25 do
				WACKYEFFECT2({Time = 80, EffectType = "Sphere", Size = VT(1.3,1.3,1.3), Size2 = VT(.3,.3,.3), Transparency = 0, Transparency2 = 1, CFrame = grec.CFrame*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = grec.Position+VT(MRANDOM(-40,40),MRANDOM(-40,40),MRANDOM(-40,40)), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(255,MRANDOM(30,150),0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})

			end
		end	
		end)
	end))
for i = 0,15 do
  	local Alpha = .1
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.1)*ANGLES(RAD(-99.7),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-1,0.9,-0.1)*ANGLES(RAD(105.8),RAD(-53.2),RAD(-39)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(0,1,-0.1)*ANGLES(RAD(-76.3),RAD(-5.8),RAD(158.8)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-0.9,-1,0)*ANGLES(RAD(8.4),RAD(-51.4),RAD(-1.4)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.1,-0.8,-0.1)*ANGLES(RAD(-47.5),RAD(73.5),RAD(56.6)),Alpha)	
end

for i = 0,20 do
	Swait()
	  	local Alpha = .25
  	RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,-0.4)*ANGLES(RAD(-136.9),RAD(0),RAD(-155.3)),Alpha)
  	LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(0,0.6,-0.9)*ANGLES(RAD(111.5),RAD(-33.8),RAD(79.8)),Alpha)
  	RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),Alpha)
  	Neck.C0 =Neck.C0:lerp(CF(0,1,-0.1)*ANGLES(RAD(-76.3),RAD(-5.8),RAD(158.8)),Alpha)
  	LeftHip.C0 = LeftHip.C0:lerp(CF(-0.7,-1,-0.9)*ANGLES(RAD(-134.4),RAD(-73.1),RAD(-61.8)),Alpha)
  	RightHip.C0 = RightHip.C0:lerp(CF(1.2,-0.5,-0.2)*ANGLES(RAD(-41),RAD(62.5),RAD(86.1)),Alpha)
end
ATTACK = false	
end
--keys
local function MouseDown(Mouse)
	HOLD = true
	if ATTACK == false then
		shoot()
	end
end

local function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "z" and ATTACK == false then
	grenade()	
	end
	if Key == "x" and ATTACK == false then
		
	end

	if Key == "c" and ATTACK == false then
		
	end

	if Key == "v" and ATTACK == false then
		
	end

	if Key == "b" and ATTACK == false then
		
	end
	
	if Key == "t" and ATTACK == false then
		taunt()
	end
	
	if Key == "m" then
		cs()
	end
end

function KeyUp(Key)
	KEYHOLD = false
end

	table.insert(Events, Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end))
	table.insert(Events, Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end))
	table.insert(Events, Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end))
	table.insert(Events, Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end))

function unanchor()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c ~= RootPart then
			c.Anchored = false
		end
	end
	if UNANCHOR == true then
		RootPart.Anchored = false
	else
		RootPart.Anchored = true
	end
end

--loop stuff

table.insert(Events, Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end))

sick.SoundId = getsynasset("GelatekHub/Scripts/TheHotline.mp3")
sick.Looped = true
sick.Pitch = 1
sick.Volume = 3
sick.Playing = true
while true do
	if Global.Stopped == true then
		break
	end
	Swait()
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	SINE = SINE + CHANGE*2
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight, Character)
	local TiltVelocity = CF(RootPart.CFrame:vectorToObjectSpace(RootPart.Velocity/1.6))
	local WALKSPEEDVALUE = 12 / (Humanoid.WalkSpeed / 16)
	t.Rotation = 4*SIN(SINE/30)
	t.TextColor3 = Color3.fromRGB(127.5 + 127.5 * COS(SINE/35),127.5 + 127.5 * COS(SINE/35),127.5 + 127.5 * COS(SINE/35))
	t.TextStrokeColor3 = Color3.fromRGB(127.5 - 127.5 * COS(SINE/35),127.5 - 127.5 * COS(SINE/35),127.5 - 127.5 * COS(SINE/35))
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),1/Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(-25 - 10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4, -0.6) * ANGLES(RAD(1), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),1/Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(-45 - 10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.7) * ANGLES(RAD(-25 + 5 * SIN(SINE / 12)), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.8, -0.3) * ANGLES(RAD(-10), RAD(-80), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		local Alpha = .1
		ANIM = "Idle"
		if ATTACK == false then
  		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0 + 0.08 * COS(SINE/27),-0.1)*ANGLES(RAD(-90),RAD(0),RAD(-155.3)),Alpha)
  		LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-0.9,0.4,-0.1)*ANGLES(RAD(-36),RAD(-68.6 + 3 * SIN(SINE/27)),RAD(-38)),Alpha)
  		RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8 +2.5*COS(SINE/27)),RAD(14.7),RAD(-109.1)),Alpha)
  		Neck.C0 =Neck.C0:lerp(CF(-0,1,0)*ANGLES(RAD(-90 + 2 * SIN(SINE/27)),RAD(0),RAD(132.1)),Alpha)
  		LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1- 0.08 * COS(SINE/27),0.1)*ANGLES(RAD(-5.5),RAD(-51.6),RAD(-7.9)),Alpha)
  		RightHip.C0 = RightHip.C0:lerp(CF(1,-0.9- 0.08 * COS(SINE/27),0)*ANGLES(RAD(-45.9),RAD(76.5),RAD(45.8)),Alpha)
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
		local Alpha = .1
  		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0 + .1 * SIN(SINE/WALKSPEEDVALUE*2),0 - 0.10 * COS(SINE/(WALKSPEEDVALUE/2)))*ANGLES(RAD(-92+3*SIN(SINE/(WALKSPEEDVALUE/2)))+RAD(TiltVelocity.z),RAD(0),RAD(-180+10*COS(SINE/WALKSPEEDVALUE))),Alpha)
  		LeftShoulder.C0 = LeftShoulder.C0:lerp(CF(-1,0.5,0)*ANGLES(RAD(-55*COS(SINE/WALKSPEEDVALUE))+SIN(SINE/WALKSPEEDVALUE)/2.5,RAD(-90)-RAD(TiltVelocity.X)*0.5,RAD(0)),Alpha)
  		RightShoulder.C0 = RightShoulder.C0:lerp(CF(1.5,0.3,0)*ANGLES(RAD(-9.8),RAD(14.7),RAD(-109.1)),Alpha)
  		Neck.C0 =Neck.C0:lerp(CF(0,1,0)*ANGLES(RAD(-80+1.5*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(-180-10*COS(SINE/WALKSPEEDVALUE)-RAD(TiltVelocity.z)*1)-RAD(TiltVelocity.x)*3),Alpha)
  		LeftHip.C0 = LeftHip.C0:lerp(CF(-1,-1+1.85*COS(SINE/WALKSPEEDVALUE)/2,0-0.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(-5+65*COS(SINE/WALKSPEEDVALUE))+RootPart.RotVelocity.Y/75+SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.z)*10,RAD(-90-25*COS(SINE/WALKSPEEDVALUE)*RAD(TiltVelocity.X)*4.5),RAD(0))*ANGLES(RAD(0-2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0)),Alpha)
  		RightHip.C0 = RightHip.C0:lerp(CF(1,-1-1.85*COS(SINE/WALKSPEEDVALUE)/2,0+0.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(-5-65*COS(SINE/WALKSPEEDVALUE))-RootPart.RotVelocity.Y/-75+-SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.z)*10,RAD(90+25*COS(SINE/WALKSPEEDVALUE)*RAD(TiltVelocity.X)*4.5),RAD(0))* ANGLES(RAD(0+2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0)),Alpha)	
		end
	end
	if Global.Stopped == true then
		break
	end
	unanchor()
	if Global.Stopped == true then
		break
	end
	Humanoid.MaxHealth = 1e4
	Humanoid.Health = 1e4
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	if Global.Stopped == true then
		break
	end
end
