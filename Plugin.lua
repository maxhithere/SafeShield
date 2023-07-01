local toolbar = plugin:CreateToolbar("SafeShield") 
local Opened = false
local CreatePartButton = toolbar:CreateButton("Scan","Main","rbxassetid://11237984738") 
local SettingsButton = toolbar:CreateButton("Settings","Settings","rbxassetid://11238002932")
local WhitelistButton = toolbar:CreateButton("Whitelist","Misc","rbxassetid://11362194247")
local TweenService = game:GetService("TweenService")
local countt = 0
local counttTable = {}
local virusTable = {}
local closeBtn
local clone
local switch1
local switch2
local switch3
local switch4
local switch1toggled
local switch2toggled
local switch3toggled
local switch4toggled
local posValue = 0.115
local viewPosValue = 0.492
local cloned 
local testTable = {}
local virusName = {}
local newFrame
local whiteListTable = {}
local whiteListTableDisplay = {}
local posValue2 = 0.097
local hextest



function ishex(h)
	local a = tonumber(h, 16)
	if a == nil then return
	else
		return a

	end
end



function resultsFrameActive(clonee)
	clonee.Frame.ImageLabel.Position = UDim2.new(0.143, 0, 0.5, 0)
	clonee.Bar:Destroy()
	clonee.Frame.SafeShieldTitle.Text = 'SafeShield - Results'

	newFrame = clonee.New
	newFrame.Visible = true
end


function setToggle(request, holder, circle)
	local Duration = 0.25
	local Style = Enum.EasingStyle.Sine
	local Direction = Enum.EasingDirection.Out
	local RepeatCount = 0
	local Reverse = false
	local TweenDelay = 0
	local AnimateInfo = TweenInfo.new(Duration, Style, Direction, RepeatCount, Reverse, TweenDelay)

	if request == true then
		local holder1_Open = TweenService:Create(holder, AnimateInfo, {BackgroundColor3 = Color3.new(0, 0.847059, 0.337255)}) --holder1
		local circle1_Open = TweenService:Create(circle, AnimateInfo, {Position = UDim2.new(1, 0, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5)}) --circle1

		holder1_Open:Play()
		circle1_Open:Play()
	elseif request == false then
		local holder1_Close = TweenService:Create(holder, AnimateInfo, {BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)})
		local circle1_Close = TweenService:Create(circle, AnimateInfo, {Position = UDim2.new(0, 0, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5)})

		holder1_Close:Play()
		circle1_Close:Play()
	else
		warn("Wrong request")
	end
end
	
	
SettingsButton.Click:Connect(function()
		

	 clone = script.Parent.GUIs:Clone()
	clone.Parent = game:GetService("CoreGui")
	
	
	
	
	 closeBtn = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.ImageButton
	closeBtn.MouseButton1Click:Connect(function()
		clone:Destroy()
		--clone.Enabled = false
	end)
	
	
	
	
	switch1 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.GameScanSetting.Holder.Button
	local holder1 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.GameScanSetting.Holder
	local circle1 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.GameScanSetting.Holder.Circle
	
	local switch2 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.ScriptsOnlySetting.Holder.Button
	local holder2 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.ScriptsOnlySetting.Holder
	local circle2 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.ScriptsOnlySetting.Holder.Circle
	
	
	local switch3 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.QuarantineSetting.Holder.Button
	local holder3 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.QuarantineSetting.Holder
	local circle3 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.QuarantineSetting.Holder.Circle
	
	local switch4 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.DeleteSetting.Holder.Button
	local holder4 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.DeleteSetting.Holder
	local circle4 = clone["Settings UI"]["UI Elements"]["Section Frame"].SectionUI.InnerScrollingFrame.DeleteSetting.Holder.Circle
	
	

	if switch1toggled == true then
		setToggle(true, holder1, circle1)

	end
	
	if switch2toggled == true then
		setToggle(true, holder2, circle2)

	end
	
	if switch3toggled == true then
		setToggle(true, holder3, circle3)

	end
	
	if switch4toggled == true then
		setToggle(true, holder4, circle4)

	end
	
	
	
	
	local Cooldown = false
	local isOpen = false
	
	
	
	
	
	switch1.MouseButton1Click:Connect(function()
		if not Cooldown then
			Cooldown = true

			if not isOpen then
				setToggle(true, holder1, circle1)
				switch1toggled = true

				isOpen = true
			else
				setToggle(false, holder1, circle1)
				switch1toggled = false


				isOpen = false
			end


			wait(0.2)
			Cooldown = false
		end
	end)
	
	switch2.MouseButton1Click:Connect(function()
		if not Cooldown then
			Cooldown = true

			if not isOpen then
				setToggle(true, holder2, circle2)

				switch2toggled = true

				isOpen = true
			else
				setToggle(false, holder2, circle2)
				switch2toggled = false


				isOpen = false
			end


			wait(0.2)
			Cooldown = false
		end
	end)
	
	
	
	
	switch3.MouseButton1Click:Connect(function()
		if not Cooldown then
			Cooldown = true

			if not isOpen then
				setToggle(true, holder3, circle3)
				switch3toggled = true


				isOpen = true
			else
				setToggle(false, holder3, circle3)
				switch3toggled = false


				isOpen = false
			end


			wait(0.2)
			Cooldown = false
		end
	end)
	
	
	
	switch4.MouseButton1Click:Connect(function()
		if not Cooldown then
			Cooldown = true

			if not isOpen then
				setToggle(true, holder4, circle4)
				switch4toggled = true
				


				isOpen = true
			else
				setToggle(false, holder4, circle4)
				switch4toggled = false


				isOpen = false
			end


			wait(0.2)
			Cooldown = false
		end
	end)
	
	
	
	

end)







CreatePartButton.Click:Connect(function()

	local clonee = script.Parent.Main:Clone()
	clonee.Parent = game:GetService("CoreGui")
	local Close = clonee.Frame.CloseBtn
	local startScan = clonee.Frame.FullGameScan
	

	startScan.MouseButton1Click:Connect(function()
		
		if not switch1toggled and not switch2toggled or switch1toggled == false and switch2toggled == false then
			print('ggg')
			startScan.Text = 'You have to have a toggle in settings!'
			
			elseif switch1toggled == true and switch2toggled == true then
			startScan.Text = 'You cannot have full game scan and only scripts scan toggled at the same time!'
		end
		
		clonee.Frame.ImageLabel.ImageTransparency = 0.7
		startScan:Destroy()

		local bar = clonee.Bar
		local filler = clonee.Bar.Filler
		local percentage = clonee.Bar.PercentTracker

		bar.Visible = true
		wait(1)

		for i = 1, 100 do
			wait(0.08)
			percentage.Text = i.."%"
			local formula = i/100

			filler:TweenSize(UDim2.new(formula, 0, 1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08)



		end
		wait(1)
		
		
		
		
		
		
		if switch1toggled == true and not switch2toggled then
			checkServices()
			wait(0.3)
			resultsFrameActive(clonee)

			for _, z in pairs(virusTable) do  
				
		
					
						posValue = posValue + 0.115
				
				local newButton = Instance.new('TextButton')
				
				newButton.BackgroundTransparency = 1
					newButton.Parent = newFrame
				newButton.Position = UDim2.new(0.279, 0, posValue , 0) --+ 0.243
				newButton.Size = UDim2.new(0.534, 0,0.141, 0)
			
				newButton.FontFace.Bold = true
					newButton.Text = tostring(z)
					newButton.TextScaled = true
				newButton.TextColor3 = Color3.new(1, 1, 1)
				
				
				newButton.MouseButton1Click:Connect(function()
					
					local good, err = pcall(function()
						plugin:OpenScript(z)
					end)
					
					if good then 
						return
					else
						warn('[SafeShield] - That is not a valid script (Cannot be opened)')
					end
					
				end)
				
				wait(1)
				z:Destroy()
				end
				
				
			
				
				
				
	
		
			
		elseif not switch1toggled and switch2toggled == true then
			checkMalCode()
			
			wait(0.3)
			resultsFrameActive(clonee)

			for _, z in pairs(virusTable) do   
				posValue = posValue + 0.115

				local newButton = Instance.new('TextButton')

				newButton.BackgroundTransparency = 1
				newButton.Parent = newFrame
				newButton.Position = UDim2.new(0.279, 0, posValue , 0) --+ 0.243
				newButton.Size = UDim2.new(0.534, 0,0.141, 0)

				newButton.FontFace.Bold = true
				newButton.Text = tostring(z)
				newButton.TextScaled = true
				newButton.TextColor3 = Color3.new(1, 1, 1)


				newButton.MouseButton1Click:Connect(function()

					local good, err = pcall(function()
						plugin:OpenScript(z)
					end)

					if good then 
						return
					else
						warn('[SafeShield] - That is not a valid script (Cannot be opened)')
					end

				end)

			end
			
			
		end

	end)

	Close.MouseButton1Click:Connect(function()
		for i, v in pairs(virusTable) do
			table.remove(virusTable, i)
		end
		clonee:Destroy()
	end)
end)


	
WhitelistButton.Click:Connect(function()
	local listClone = script.Parent.Whitelist:Clone()
	listClone.Parent = game:GetService("CoreGui")
	
	local textbox = listClone.Frame.WhitelistBox

	
	local scFrame = listClone.ScrollingFrame
	
	local function textLabelCreate()
		for i, v in pairs(whiteListTableDisplay) do
			print(i)
			posValue2 = posValue2 + 0.05 --5

			local newLabel = Instance.new('TextLabel')

			newLabel.Parent = scFrame
			newLabel.Position = UDim2.new(0.497, 0, posValue2 , 0) --+ 0.243
			newLabel.Size = UDim2.new(0.499, 0,0.031, 0)

			newLabel.FontFace.Bold = true
			newLabel.Text = tostring(v)
			newLabel.TextScaled = true
			newLabel.TextColor3 = Color3.new(1, 1, 1)				

		end
	end
	
	
	
	
	
	local previousLabel = {}
	textbox.InputEnded:Connect(function()
		for i, instance in pairs(previousLabel) do	
			instance:Destroy()
		end

		for i, v in pairs(whiteListTableDisplay) do

			posValue2 = posValue2 + 0.05 

			local newLabel = Instance.new('TextLabel')

			newLabel.Parent = scFrame
			newLabel.Position = UDim2.new(0.28, 0, 0.171, 0)
			newLabel.Size = UDim2.new(0.499, 0,0.031, 0)

			newLabel.FontFace.Bold = true
			newLabel.Text = tostring(v)
			newLabel.TextScaled = true
			newLabel.TextColor3 = Color3.new(1, 1, 1)		

			table.insert(previousLabel, newLabel)
		end
	end)
	
	
	textbox.FocusLost:Connect(function()
		
		
		local text = textbox.Text
		textbox.Text = ""

		local exists = true

		local splitText = string.split(text,".")

		local parentInstance
		if game:FindFirstChild(splitText[1]) then
			parentInstance = game[splitText[1]]
			for i = 2, #splitText do
				local newinstance = parentInstance:FindFirstChild(splitText[i])
				if newinstance then
					parentInstance = newinstance
				else
					textbox.Text = splitText[i].." was not found in "..parentInstance.Name
					
					exists = false
				end 
			end
			if exists then
				textbox.Text = parentInstance.Name.." added to whitelist"
				table.insert(whiteListTableDisplay, parentInstance.Name)
				table.insert(whiteListTable, parentInstance)

				
			end
		else
			textbox.Text = splitText[1].." not found inside game"
		end
	end)
	
	
	
	listClone.Frame.CloseBtn.MouseButton1Click:Connect(function()
		
		listClone:Destroy()
		
	end)
	
	
end)
	
	
	
	







local num
local count = 0
local viruses = {"inFECtion",
	"LOLWUT? LOLHOO? LOLYOU! Got hacked",
	"Vaccine",
	"OH SNAP YOU GOT INFECTED XD XD XD",
	"d��������������ng.........you got owned...",
	"ANTIVIRISIS",
	"SnapReducer",
	"Snap-Reducer",
	"Snap Reducer",
	"ANTIVIRIS",
	"Anti-Lag",
	"Anti Lag",
	"AntiLag",
	"Wildfire",
	"AntiVirus",
	"Anti-Virus",
	"Anti Virus",
	"4D Being",
	"No samurai plzzz",
	"OHAI",
	"VIRUS",
	"Infected",
	"LOLNO",
	"Put Virise here",
	"ROFL",
	"Guest Free Chat Script",
	"Guest_Talking_Script",
	"Spreadify",
	"Kill tem!",
	"join teh moovment!",
	"Wormed",
	"Trashed",
	"asdf",
	"ROLF",
	"kill tem",
	"Anti-Lag2",
	"Lolzorz",
	"Guest Talking Script",
	"soz i herd u lik mudkipz",
	"Nice little scripty",
	"Harmless little scripty",
	"Agnst",
	"Affinity",
	"�9001",
	"ajmi1n5",
	"ALL HAIL THE CREED!",
	"AntiVirus",
	"Anti Virus",
	"Anti-Virus",
	"Anti Lag v18.0",
	"AntiLag",
	"Anti Lag",
	"Anti-Lag",
	"ANTILAG",
	"Anti-Owner",
	"Anti-WeldVirus",
	"apbsjci9",
	"asome script",
	"AntiVirusSoftware",
	"ANTIVIRIS",
	"ANTIVIRISIS",
	"Ajedi32's RS Anti-Virus",
	"Anti-Spread",
	"Anti-1x1x1x1andothervirus's",
	"Anti-Virus Script",
	"Anti Virus Script",
	"Anti Lag Script",
	"AutoJoint",
	"AutoPilot",
	"asdf",
	"Anti-Lag2",
	"Antivirus",
	"aky",
	"BackpackItem",
	"badvirus",
	"Balefire",
	"Ban",
	"belz",
	"BlackPlague",
	"BreakJoints",
	"b5hcmqj5",
	"bu5nlkawo",
	"b2whx3",
	"bob",
	"BOB",
	"DUH vaccine",
	"Bilylones is your new master",
	"Billylones is your new master",
	"Billylones is awesomesauce",
	"boomboom9188",
	"bryant90",
	"Cooldude816's anti-vaccine script. (Works)",
	"Chaotic",
	"Chez",
	"credit",
	"CleanUpSnaps",
	"Check",
	"CHUCKNORRIS vaccine",
	"CountCars",
	"cooltime101 was here and i hacked you",
	"DUMB vaccine",
	"deeeeeeeeeeeeeeng.........you got owned...",
	"Rofl",
	"do you liek waffles",
	"d764crw",
	"DellThermonater",
	"DANGEROUS VIRUS",
	"DDV",
	"DaNg, Virus! Got You!",
	"d1im",
	"duing26l",
	"deaner",
	"Drain",
	"Death to you",
	"Error",
	"fqfr",
	"Dont Worry Im A Friendly Virus",
	"Exbawx",
	"FunBoks",
	"FREEMODALNUB vaccine",
	"Fix",
	"Feature",
	"fcybm",
	"Deth 2 teh samurai!",
	"Fear Made This!!",
	"FREEMODALNOOB vaccine",
	"Guest_Talking_Script",
	"Got You!",
	"FeelFreeToIns3rtGramm�tic�lErrorsHere",
	"FreeStyleM�yGoAnywhereIfNeeded",
	"FREEMODEL vaccine",
	"Gotcha",
	"Geometry",
	"GuestTalking",
	"Guest Free Chat Script",
	"Guest Talking Virus",
	"gcl2hlra",
	"gvzvm",
	"garmo hacked ur place",
	"Geometry",
	"getfenv",
	"HopperBin",
	"harmless little scripty",
	"hi2m",
	"hsxpydccb",
	"heve",
	"H4ck",
	"H4x",
	"Hello...I �m Your New Lord Lolz",
	"HACKEDBYEXPLOITSCRIPTS",
	"hax",
	"Hacker Central",
	"HIHELLO",
	"Hacker",
	"H4XXX :3",
	"HAX3D!",
	"Hacker Worm",
	"Infected",
	"j8jw1",
	"IDIOT vaccine",
	"IT'S OVER 9000!!!",
	"ik7txer",
	"i0916",
	"infect",
	"I'm getting T133D",
	"IMAHAKWTFZ",
	"Influenza AH1N1",
	"I will show your password CENSORED",
	"IAmHereToHe�lYourPlace",
	"ISt�rtHere",
	"jdu7jlf",
	"Layschips2378minion2",
	"jevjx",
	"join teh moovement!",
	"join teh moovment!",
	"JointInstance",
	"kg5r46vf",
	"KillAll",
	"kuktzitr",
	"Kill tem!",
	"lzfocy",
	"li8i7",
	"LoadTime",
	"LMAO",
	"LOL",
	"LOLOLOLOL J00 PHAILED!",
	"LOLOL I AM UR NEW LoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoRD!!!!!!!",
	"LMAO vaccine",
	"LocalBackpack",
	"LocalBackpackItem",
	"LAWL vaccine",
	"Lolzorz",
	"lolbobkillsnoobs",
	"lordnathan",
	"mf04z",
	"majmi1n5",
	"m630g4",
	"MotorFeature",
	"Making Cat Ice Cream Make Me Happy!",
	"MMMMMM PIZZZA UM NUM UM NUM",
	"McHammer",
	"MHAHAHA!!!",
	"no samurai plzzzzzz",
	"N00B 4TT4CK!",
	"noob!",
	"N0ISE",
	"Nice little scripty",
	"Free-St�le Pl0x",
	"NOw randomness",
	"NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOBZ",
	"Nomnomnom1",
	"Nomnomnom2",
	"NOISE",
	"No Lag Script",
	"NoNoIDon'tNeedAllOfYourAwkw�rdSovietArguments",
	"Loader",
	"Let there be light",
	"OHAI",
	"Skyst4r",
	"OMG PIKACHU ATTACK!",
	"OWNED vaccine",
	"PWNED vaccine",
	"P0K3M4WN",
	"ProBlox",
	"pkw0",
	"p2qr0i",
	"Player Injury Blood Script",
	"ProperGr�mmerNeededInPhilosiphalLocations",
	"ProperGr�mmerNeededInPhilosiphalLocations,insertNoobHere",
	"ProjectX",
	"RED ROBIN YUMMMMMMMM",
	"Rotate",
	"Running 'Black Plague' Virus...",
	"RS Anti-Virus",
	"RobloxShield� AntiVirus",
	"Run",
	"ROFLCOPTER vaccine",
	"rgzgl1rwj",
	"rbxa11",
	"r2snyt",
	"ROFL vaccine",
	"Random�GoesHere:3",
	"ScriptBuild",
	"Reviver 2.0",
	"Script......Or is it...",
	"Spreadify",
	"Snap Reducer",
	"SnapReducer",
	"Snap-Reducer",
	"STFU NOOB",
	"s008qne",
	"sv1om4",
	"soz i herd u lik mudkipz",
	"Safe Script! Don't Delete!",
	"SnapRemover",
	"Snap Remover",
	"Snap-Remover",
	"N0ISESCRIPT",
	"Script Made By Sonicthehedgehogxx",
	"StockSound",
	"script.....or..is.it",
	"Script......Or is it...",
	"Spreadify",
	"b5hcmqj5",
	"SoundJack",
	"Soundjack",
	"Sound Jack",
	"Sleep",
	"Sharp Shooter",
	"Sctmappy",
	"Scattah",
	"sonicthehedgehogxx Made this!!",
	"survivor2256",
	"Saddness",
	"teh end",
	"This is created by Noob Software",
	"Timer",
	"Throbber",
	"Tazer",
	"Tazer 1.0",
	"Tazer 2.0",
	"Tazer 3.0",
	"Tazer 5.0",
	"Tazer 6.0",
	"Tazer 7.0",
	"Tazer 8.0",
	"Tazer 9.0",
	"Tazer 9.5",
	"Tazer 10.0",
	"Tazer 11.0",
	"Tazer 12.0",
	"Tazer 13.0",
	"Tazer 14.0",
	"Tazer 15.0",
	"Tazer 16.0",
	"Tazer 17.0",
	"Tazer 18.0",
	"Tazer 19.0",
	"Tazer 20.0",
	"Tazer 21.0",
	"Tazer 22.0",
	"Tazer 23.0",
	"Tazor 23.0",
	"Tazer 24.0",
	"Tazor 24.0",
	"SuRViV",
	"ThisScriptIsAJumpStartToAHe�lthyLifestyle",
	"u5vv",
	"ulxt0",
	"ug3v",
	"u3zsi",
	"u56w",
	"ViVRuS",
	"v7srq67gj",
	"vk36rg3",
	"vtlac",
	"Vaccine",
	"VelocityMotor",
	"Virus Pack 3.6",
	"VirusVaccine",
	"VaccineScript",
	"Virus!",
	"Virus Databace",
	"Worm",
	"Wormed",
	"Worm Virus",
	"Wildfire",
	"whx3iu3z",
	"whx3iu3z",
	"WTFZ0R",
	"Wormah",
	"SkapeTTAJA",
	"Working Anti-lag script",
	"x8ujsh5g",
	"XPQR",
	"XPQR-Virus",
	"YOU GOT INFECTED XD XD XD",
	"Layschips2378minion2",
	"you just got pwned by: BLOOXERindisguise",
	"ywo59tjv",
	"ZXMLFCSAJORWQ#)CXFDRE)$#Q)JCOUSEW#)@!HOIFDS(AEQ#HI*DFHRI(#FA",
	"z91xw8",
	"zpyo4vh",
	"07wbx",
	"1x1x1x1ify",
	"1x1x1x1",
	"18pb",
	"2sv8",
	"3D Being",
	"3DBeing",
	"3qs51bp7c",
	"4k5x03156",
	"3809G3j4993",
	"3.14159265358979,ALotOfR�ndomPiNumbers",
	"4D Being",
	"4DBeing",
	"4D Being Remover",
	"4DBieng",
	"4k5x03156",
	"5ydg8dkm",
	"5o9g6upwz",
	"5xld",
	"65wz0f1",
	"7m5ebj5m",
	"77�",
	"81izc18pb",
	"81izc18pb",
	"8sjwgawq",
	[[""''""''""�|`�]],
	"ajmi1n5",
	"_Utility",
	"ALL HAIL THE CREED!",
	"AntiVirus",
	"Anti Virus",
	"Anti-Virus",
	"Anti Lag v18.0",
	"AntiLag",
	"Anti Lag",
	"Anti-Lag",
	"ANTILAG",
	"apbsjci9",
	"asome script",
	"AntiVirusSoftware",
	"Anti-Spread",
	"Anti-1x1x1x1andothervirus's",
	"Anti-Virus Script",
	"belz",
	"Anti Virus Script",
	"Anti Lag Script",
	"AutoJoint",
	"BackpackItem",
	"badvirus",
	"Balefire",
	"Mcafee Anti-Lag",
	"bu5nlkawo",
	"b2whx3",
	"boomboom9188",
	"Cooldude816's anti-vaccine script. (Works)",
	"credit",
	"Deth 2 teh samurai!",
	"d764crw",
	"d1im",
	"duing26l",
	"Dont Worry Im A Friendly Virus",
	"FunBoks",
	"Feature",
	"fcybm",
	"fqfr",
	"Fear Made This!!",
	"Dr.hacks",
	"Guest_Talking_Script",
	"Geometry",
	"Glue",
	"GuestTalking",
	"Guest Talking Virus",
	"gcl2hlra",
	"gvzvm",
	"garmo hacked ur place",
	"HopperBin",
	"Hello",
	"harmless little scripty",
	"hi2m",
	"hsxpydccb",
	"heve",
	"H4ck",
	"H4x",
	"Hello...I �m Your New Lord Lolz",
	"HACKEDBYEXPLOITSCRIPTS",
	"hax",
	"HIHELLO",
	"Hacker",
	"H4XXX :3",
	"Infected",
	"IT'S OVER 9000!!!",
	"ik7txer",
	"i0916",
	"infect",
	"I'm getting T133D",
	"IMAHAKWTFZ",
	"Influenza AH1N1",
	"j8jw1",
	"jdu7jlf",
	"IAmHereToHe�lYourPlace",
	"ISt�rtHere",
	"LMFAO",
	"join teh moovement!",
	"join teh moovment!",
	"JointInstance",
	"kg5r46vf",
	"KillAll",
	"kuktzitr",
	"Kill tem!",
	"lzfocy",
	"LMAO",
	"li8i7",
	"Layschips2378minion2",
	"LocalBackpack",
	"LocalBackpackItem",
	"lolbobkillsnoobs",
	"lordnathan",
	"mf04z",
	"majmi1n5",
	"m630g4",
	"MotorFeature",
	"N00B 4TT4CK!",
	"N0ISE",
	"N0ISESCRIPT",
	"NOw randomness",
	"No Lag Script",
	"OHAI",
	"Random�GoesHere:3",
	"OMG PIKACHU ATTACK!",
	"pkw0","p2qr0i",
	"RS Anti-Virus",
	"Avira",
	"RobloxShield� AntiVirus",
	"rgzgl1rwj",
	"rbxa11",
	"r2snyt",
	"Random�GoesHere:3",
	"RotateP",
	"RotateV",
	"Shout",
	"ScriptBuild",
	"Script......Or is it...",
	"Spreadify",
	"Snap Reducer",
	"SnapReducer",
	"Snap-Reducer",
	"STFU NOOB",
	"s008qne",
	"sv1om4",
	"Script Made By Sonicthehedgehogxx",
	"Spreadify",
	"SuRViV",
	"Snap",
	"Skin",
	"survivor2256",
	"teh end",
	"This is created by Noob Software",
	"u5vv",
	"ulxt0",
	"ug3v",
	"u3zsi",
	"MaxStuff",
	"u56w",
	"ViVRuS",
	"v7srq67gj",
	"vk36rg3",
	"vtlac",
	"Vaccine",
	"VelocityMotor",
	"Worm",
	"Wormed",
	"Wildfire",
	"whx3iu3z",
	"TAKE ONE!",
	"whx3iu3z",
	"WTFZ0R",
	"Working Anti-lag script",
	"x8ujsh5g",
	"yxcl8llf",
	"YOU GOT INFECTED XD XD XD",
	"PleaseKeepThis!",
	"ywo59tjv",
	"ZXMLFCSAJORWQ#)CXFDRE)$#Q)JCOUSEW#)@!HOIFDS(AEQ#HI*DFHRI(#FA",
	"z91xw8",
	"zpyo4vh",
	"07wbx",
	"18pb",
	"2sv8",
	"3D Being",
	"3DBeing",
	"3qs51bp7c",
	"4D Being",
	"4DBeing",
	"4k5x03156",
	"5ydg8dkm",
	"5o9g6upwz",
	"5xld",
	"65wz0f1",
	"7m5ebj5m",
	"77�",
	"81izc18pb",
	"81izc18pb",
	"8sjwgawq",
	"BackUp Firewall",
	"McAfee",
	"BackUp FireWall",
	"FreeStyleM�yGoAnywhereIfNeeded",
	"cahrlie84",
	"OBF HAXED YOU",
	"SirRichMcNoob will destroy roblox",
	"HAX",
	"SirRichMcNoob will hack ur account lawl",
	"SirRichMcNoob will show your password CENSORED",
	"073dea7p",
	"L��ger",
	"MMMMMM YOUR PASSWORD SirRichMcNoob",
	"SirRichMcNoob will kill you",
	"Script Made By SirRichMcNoob",
	"PASSWORDZ YUMMMMMMMM",
	"SirRichMcNoob will show YOUR password then use it",
	"OBF made this hack :P",
	"Win32.netsky.worm",
	"Win32.netsky.Worm Other",
	"Win32.netsky.worm Other 2",
	"VirusShocker360 v.3.2",
	"VirusShocker360 v.3.1",
	"VirusShocker360 v.2.0",
	"VirusShocker360 v.1.0",
	"Avira Anti Virus",
	"Script Made By Sonicthehedgehogxx",
	"hoaijfe,oaihdgoiwha,039uy0,98dfy,048h,doefihw,o983hr,9o8",
	"3408",
	"VGA Main Support",
	"N0ISESCRIPT",
	"�9001",
	"Making Cat Ice Cream Make Me Happy!+",
	"Hello, Billylones is your new master.",
	"2_2_1_1_s_s_",
	"NEW VACCINE",
	"IT'S OVER 9000!!!",
	"MasterScript",
	"N00B 4TT4CK!",
	"Hello, Billylones is your new",
	"AE COMMANDS",
	"purpl3haz3123",
	"ARBITER47",
	"dereck1231",
	"Skyst4r",
	"MAHAHAHAHA",
	"GOOP721",
	"dshfjnsaldfjbashjbdfhbshfdlsafbasjdfbj",
	"lzfocy",
	"**virusmaster***",
	"z91xw8",
	"heve",
	"3qs51bp7c",
	"fcybm",
	"rbxa11",
	"sv1om4",
	"gcl2hlra",
	"d764crw",
	"p2qr0i",
	"lzfocy",
	"hsxpydccb",
	"pkw0",
	"b5hcmqj5",
	"5ydg8dkm",
	"hi2m",
	"belz",
	"rgzgl1rwj",
	"whx3iu3z",
	"81izc18pb",
	"vk36rg3",
	"ulxt0",
	"ajmi1n5",
	"majmi1n5",
	"v7srq67gj",
	"bu5nlkawo",
	"s008qne",
	"4k5x03156",
	"Vaccine",
	"?????????",
	"H4ck",
	"badvirus",
	"HACKEDBYEXPLOITSCRIPTS",
	"T1ME&P�radox!",
	"Wojtek123 is king",
	"ROFL",
	"OHAI",
	"Guest Free Chat Script",
	"Snap-Remover",
	"Snap Remover",
	"SnapRemover",
	"nrhbord",
	"QuarantinedVirus",
	"lireon",
	"mf04z",
	"ScriptBuild",
	"Balefire",
	"BreakJoints",
	"KillAll",
	"ViVRuS",
	"gvox9d3",
	"YOU GOT INFECTED XD XD XD",
	"Script......Or is it...",
	"harmless little scripty",
	"Nomnomnom1 Virus",
	"1x1x1x1ify",
	"rws2",
	"BlackPlague",
	"Running 'Black Plague' Virus...",
	"Virus...",
	"X3-Z3AI",
	"neutronstarcollision.rbapp",
	"1mgxrczsf",
	"noobtitus",
	"x2mdg",
	"n4bs",
	"loser",
	"hyfrs2",
	"antivirisis",
	"wtfz0r",
	"kg0ec",
	"iumtx578",
	"fffffffffff",
	"lol vaccine",
	"lawl vaccine",
	"zxmlfcsjaorwq#)cxferd)$#q)jcousew#)@!hoifds(aeq#hi*dfhri(#fa",
	"hyfrs2",
	"suckmyoingas vaccine",
	"�A?KUNKNOWNNIGHTM�R� ?ILL ?U?E ???LO?IA!!!",
	"tefqwy3he",
	"wormed",
	"�A?KUNKNOWNNIGHTM�R� ?ILL",
	"hyfrs2",
	"Mchammer",
	"noobvirus",
	"controls",
	"y3rq",
	"n%uy?fp%b?n1~tk?}?#",
	"cpninjahacker waz here",
	"0rjuha6",
	"altconfigcodes *dont mess with",
	"all hail the creed!!!!",
	"kill tem!",
	"1mgxrczsf",
	"XAZ�?^?@?qs?xpmy6n�mhb?qrk�3g",
	"hax",
	"Viris",
	"5ooox38",
	"nxspf",
	"77�",
	"pxd3n5s",
	"2ufinap",
	"f9wk7",
	"r3ukmb61",
	"f5v2hq",
	"b0bectuth",
	"ai5vfa",
	"mlwjkt6",
	"ilixzyx",
	"zpyo4vh",
	"hsxpydccb",
	"zzdnr8",
	"w35uvc2q",
	"hywxtdtb",
	"4q9xzc30",
	"yidtzuasq",
	"umz8oj5v",
	"rh2wmr9n8",
	"N0ISE",
	"I_AM_TE1ANNON",
	"CompassEffect",
	"PWNZ0R3D",
	"073dea7p",
	"whfcjgysa",
	"protection",
	"no availiblitly lock",
	"ropack backup",
	"ropack",
	"safity lock",
	"ropack injection",
	"antivirussoftware",
	"spreadify",
	"datacontrollers",
	"timer",
	"worm",
	"zomg saved",
	"vivrus",
	"wtfzor",
	"imahakwtfz",
	"numbrez",
	"snap infection",
	"anti-lag",
	"guest talker",
	"join teh moovement",
	"geometry",
	"wildfire",
	"rolf",
	"snap-reducer",
	"snapreducer",
	"Money Hack",
	"no samurai plzzz",
	"infected",
	"4d being",
	"4dbeing",
	"y3rq",
	"kg0ec",
	"iumtx578",
	"guesttalking",
	"5pau0p",
	"fcybm",
	"cpninjahacker waz here",
	"noob vaccine",
	"darkunknownnightmare",
	"darkunknownnightmare will nuke robloxia!!!",
	"nou",
	"omghax",
	"noobtitus",
	"i am a virus",
	"noobvirus",
	"lsl9ar565",
	"hax",
	"z8ravg",
	"0rjuha6",
	"q5rvhce",
	"s454xsz",
	"3h7lfva8t",
	"18293q",
	"4gadbh",
	"c29awv2",
	"234kn",
	"zwjo",
	"w0e8",
	"ca6o1gdpy",
	"controls",
	"6grqzi",
	"fmgjh",
	"fvc98ypa",
	"s80r",
	"eh76fx",
	"brox9f82a",
	"9tq6",
	"rozox",
	"kpzv8am",
	"99qm8hjj",
	"u3zsi",
	"haxed",
	"?????????",
	"%9n?a1?6?tuk?t??f+g}=�gukxe",
	"all hail the creed!!!! and loloa and gunggung1!!!",
	"Scheduler",
	"li8i7",
	"hintor",
	"XAZ�?^?@?qs?xpmy6n�mhb?qrk�3g","??-m[4o:?zrJ?",
	"n%uy?fp%b?n1~tk?}?#",
	"?�?n???j???=l$!gu5tm%",
	"skull8889",
	"zxmlfcsjaorwq#)cxferd)$#q)jcousew#)@!hoifds(aeq#hi*dfhri(#fa",
	"zomg saved",
	"h4xxx :3",
	"bjk2jkm",
	"k0lm",
	"9vssb36tj",
	"i'm getting t1r33d",
	"imahakwtfz",
	"deth 2 teh samurai!",
	"turd",
	"fatass",
	"Infection Killer--NO INFECTION'S",
	"5pau0p",
	"UMG HAXORED BY OBF",
	"OBF HAXED YOU",
	"Quarantine",
	"Quarantined",
	"Virus",
	"Virus Test",
	"Anti-Hack Script",
	"bandit5292",
	"94m3 Cr45h3r 1337 5cr1p7",
	"94m3 Cr45h3r",
	"94m3 Cr45h3r 1337 m355a93",
	"D3c41",
	"1337 5cr1p7 4 n0 m0r3 P14y3r5",
	"yxcl8llf",
	"SuckMahCock Nd STop Beggin Admin well U Got it now But Do something Wrong Prepare 2 Get banned",
	"Hack/Virus Blocker",
	"Cavedog962's Fire Wall",
	"Anti-Exploiting script",
	"Anti-Exploiting",
	"Anti Exploiting script",
	"Anti Exploiting",
	"j8jw1",
	"Victimizer",
	"ZIndexer",
	"No eyeballs!",
	"dark scanner",
	"Necro31sAV_V1_0",
	"RJ's Anti Virus V1.0",
	"SuckMahCock",
	"Infected >:3",
	"DescendantShield",
	"GameShield",
	"RJ's Anti-Virus",
	"Facw's Anti Hack, Virus, Lag Brick",
	"99.99% Anti-Hack Script!",
	"5xld",
	"Working Anti-lag script",
	"Thank You for using Facw's Anti Hack, Lag, Virus Brick.",
	"Anti Infected",
	"289042342hf843",
	"Getting All Children Of Workspace Please wait .",
	"IDKN00BH�x0r:3",
	"infectzSN�P",
	"HEHEHEHEHEHEHEHE�����!",
	"badvirus",
	"WORSHIP THE 0.1x0.1x0.1 BRICK!",
	"Worship the 0.1x0.1x0.1 brick!",
	"The 0.1x0.1x0.1 brick will lead the way!",
	"Go towards the small brick!",
	"http://www.roblox.com/Behold-the-0-1x0-1x0-1-Brick-item?id=33507435",
	"I BELIEVE",
	"The 0.1x0.1x0.1 brick is all knowing!",
	"Instance. BasePart. Part. Tiny Part. All equal.",
	"Belief",
	"Worship",
	"Worship the 0.1x0.1x0.1 brick or be SMITED!",
	"Small bricks are 1337!",
	"SPREAD THE WORD!",
	"0.1x0.1x0.1 created ROBLOX!",
	"BELIEVES IN THE 0.1x0.1x0.1 BRICK! WHEN HE DIES, HE WILL RESPAWN LIKE NO OTHER.",
	"Uninfection Script",
	"Anti Lagging Script",
	"qwertysam's Ad Script",
	"LinkedLeaderboard",
	"micolord's Admin Commands V2",
	"norton-s�curity anti-virus box",
	"Forum�ngSucks",
	"Parodox sky box",
	"Skybox--by.5blackcat5g",
	"Zeno egg skybox",
	"spongebob skybox",
	"Hidden",
	"Infected",
	"Claypwns592",
	"Death",
	"iStoleJ00rC00K3HZOLOLOLOLOL",
	"Wormed",
	"Storm",
	"apbsjci9",
	"Vivrus",
	"KillAll",
	"N0ISE",
	"LMAO",
	"infect",
	"hax",
	"Kill tem!",
	"Wildfire",
	"asome script",
	"Anti-Lag",
	"z91xw8",
	"ANTILAG",
	"Spreadify",
	"Chaotic",
	"No samurai plzzz",
	"OH SNAP YOU GOT INFECTED XD XD XD",
	"07wbx",
	"ViVRuS",
	"u56w",
	"gvzvm",
	"''''",
	"HIHELLO",
	"ProjectX",
	"SoundJack",
	"ugwdq",
	"Hacker",
	"Virus",
	"WTFZ0R",
	"I'm getting T133D",
	"IMAHAKWTFZ",
	"SuRViV",
	"AntiVirusSoftware",
	"ANTIVIRIS",
	"VIRUS",
	"Influenza AH1N1",
	"SnapReducer",
	"Snap Reducer",
	"INFECTED",
	"This is created by Noob Software",
	"NoNoobs",
	"LOL",
	"No Lag Script",
	"Vaccine",
	"H4XXX :3",
	"credit",
	"Anti-Virus",
	"antivirus",
	"badvirus",
	"anti-virus",
	"Guest_Talking_Script",
	"Dr. Hacks",
	"Guest Talking Virus",
	"RS Anti-Virus",
	"Anti-Spread",
	"Guest_Free_Chat_Script",
	"you just got pwned by: BLOOXERindisguise",
	"HACKEDBYEXPLOITSCRIPTS",
	"Anti-1x1x1x1andothervirus's",
	"NOISE",
	"la la la",
	"Guest Free Chat Script",
	"lol",
	"bob",
	"BOB",
	"Anti-Virus Script",
	"Anti Virus Script",
	"The Best Anti-Lag Script",
	"Brick",
	"Anti Lag Script",
	"IAmHereToHe�lYourPlace",
	"Dont Worry Im A Friendly Virus",
	"Fear Made This!!",
	"9.3451928735982369e+164",
	"sonicthehedgehogxx Made this!!",
	"I will show your password CENSORED",
	"Working Anti-lag script",
	"brad1342's Fire Wall",
	"j83245uyj34ioj52348952u34m5j23mj4j590234i5j34-c528903j4573894758923",
	"game.Workspace.Lag:Remove()",
	"DO NOT CLICK ME",
	"53479682709823j4jkh5jkdhf89034uf934nrf7h3h8497r384nh8r7394nr374r7h3hrh3hr84h8h38rh8784r38hr78397",
	"Anti Lag / 100%",
	"n5727832j53fj7y475n238425ny3f579834ny257834u52i3hf4jk52hy34782f5ny35j7h23h4j572394fj25y34785y2f3b45f27i34y5u7",
	"349085-23mn40958234m5f28345f27fnf549f45692f59f52342894268yfr4y7834y857927f3by64257834ny64ny64ny64ny64ny64ny64ny653d5n7y2934785y3f4f52",
	"989384j34nh278934f502n834500235f023f57050f5270f523702f50f520f52052f52f52n02f5n2f5nf259n2f507982f5",
	"Vaccine - Remover",
	"Anti Lag,Hacks,etc.",
	"Ro�Cleaner [V 2.1]",
	"CleanUpSnaps",
	"3DGamers anti lagg script",
	"DO NOT CLICK ME",
	"KillServer",
	"Server Killer",
	"Vaccine Script - Remover",
	"RobloxiWare 4.0",
	"The 'OH SNAP YOU GOT INFECTED XD XD XD' Removal Script",
	"shauns rickroll virus",
	"Hint remover",
	"323m",
	"484dy7o",
	"cptrick",
	"shaunthesheep1`s unharmful rickroll virus",
	"eric virus",
	"Norton 360�",
	"Original1x1x1x1Cured",
	"Tancul AVG Scripts",
	"AssertAntiVirus",
	"Database",
	"No Lag Scripts",
	"A-L (Anti-Lag)",
	"Ristone3-labs-Total-Protection-Professional-Edition-V1.0",
	"Ristone3-labs-Total-Protection-V5.0",
	"join teh moovment!",
	"Ristone3 Labs All Around Protection",
	"VScript",
	"Anti Hack",
	"ProperGr�mmerNeededInPhilosiphalLocations,Player",
	"Anti",
	"100% working vaccine/virus remover.",
	"best time regen script",
	"4444vince2's Fire Wall",
	"TOUCH THIS TO FIGHT!",
	"bu5nlkawo",
	"balle only here! fight!",
	"if testing a nuke get a FF",
	"[PAEV1]-READ THIS",
	"AntiBackpackInsert",
	"AntiInsert",
	"HINT BAWX",
	"AntiSpeedhack",
	"Anti-Virus Script",
	"Anti-Virus Script",
	"z91xw8",
	"The Worm Steals your files...",
	"AVG 9.0 Anti-Virus!",
	"AVG 9.1 Anti-Virus,Anti-Hack!",
	"AVG 9.2 Anti-Virus,Anti-Hack!",
	"AVG 9.3 Anti-Virus,Anti-Hack!",
	"AVG 9.4 Anti-Virus,Anti-Hack!",
	"AVG 9.5 Anti-Virus,Anti-Hack!",
	"AVG 9.6 Anti-Virus,Anti-Hack!",
	"Avg Anti-Hack",
	"Server Launcher",
	"AVG FireWall 8.5 Betta",
	"Anti Lag v18.0",
	"anti lag *lolz*",
	"AVG-Antivirus",
	"LOLNO",
	"Story (lol)",
	"KSS",
	"Infection Remover",
	"CAV",
	"Avg-banscript",
	"AVG Anti-Virus",
	"ultima antivirus",
	"MessageBox",
	"1xNew-removal",
	"TinySB",
	"DSource",
	"Micro Destroyer.",
	"fqfr",
	"NetSecure Security Suite 2010",
	"CHAOTIC-removal",
	"Calco-removal",
	"Stocksound-removal",
	"Vaccine Script - Remover",
	"2sv8","Vaccine - Remover",
	"NoHacking",
	"Avira",
	"Avira AntiVirus",
	"PROFIREWALL",
	"KeepName",
	"Trend Micro",
	"AntiViralSystems 1.1",
	"ViralScriptRemover",
	"Sys1",
	"Sys2",
	"Malicious Objects Vaccine 6.2",
	"E-Secure Anti Virus 4.0",
	"Anti Credit",
	"unHacked",
	"E-Secure Anti Virus 3.0",
	"Mirical Cure",
	"AdvanceVirusClean",
	"ramtruck54k6",
	"Anti-Virus File",
	"The magic Sword",
	"18pb",
	"Persons admin commands V3! BY gravemind666",
	"McAfee SecurityCenter�",
	"WormV2",
	"HAAXX",
	"WormV1",
	"The Worm Got You!",
	"Lagg Script-IronInforcer",
	"Lagg Script2- IronInforcer",
	"No torsoItis",
	"OBF made this hack :P",
	"NOMNOMNOM1TEST Is F�ke!",
	"CPw>B!Zr#)KT,c?1eWr)68s)lk!C,AEm_(+3!wnaf&[tkYbkP@",
	"Sp��d H�ck",
	"wa� teh lord Nomnomnom1!",
	"PolymorphicPing",
	"d1im",
	"abcdefghijklmnopqrstuvwxwzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890�=+-_!@#$%^&*()[]{},:'\",./<>?",
	"PolymorphicPingSender",
	"/5dl�lyouloses4w7",
	"/5d�verallPowerLeveltrololol",
	"63�ahooumlol",
	"63�mgugotvirusmailtrololol",
	"amy�LLULARcftg",
	"ug3v",
	"hehe�mgugotvirusmail63",
	"trololold�ckedboats4w7",
	"Turbine's Anti Virus [RobWall] V1",
	"AntiVaccine!",
	"omghax",
	"Hacked",
	"best anti virus ever",
	"Anti-Pandora's Box",
	"sk8rude1797",
	"skaterdude51",
	"D.O.O.M. Virus",
	"+++",
	"Security",
	"guesttalking",
	"SuperBoss121's Antihacker",
	"Anti Hacker 2010,Manual in here!",
	"Norton Expedition +++ ",
	"Wont ban me",
	"Claypwns592",
	"Hehevirus",
	"READ ME!DOUBLE CLICK ME!",
	"Less lag script",
	"Talk regen script By Alexdacool",
	"ULTIMATE UNIFECTION SCRIPT",
	"Anti-Hack Script",
	"Example Read The Main Scirpt",
	"Money Hack",
	"belz",
	"hi2m",
	"s008qne",
	"Elemental skybox",
	"v7srq67gj",
	"majmi1n5",
	"ajmi1n5",
	"vk36rg3",
	"81izc18pb",
	"whx3iu3z",
	"rgzgl1rwj",
	"5ydg8dkm",
	"b5hcmqj5",
	"hsxpydccb",
	"FamousSeamus",
	"p2qr0i",
	"d764crw",
	"gcl2hlra",
	"sv1om4",
	"rbxa11",
	"3qs51bp7c",
	"kuktzitr",
	"ik7txer",
	"r2snyt",
	"zpyo4vh",
	"5o9g6upwz",
	"HAx",
	"vtlac",
	"i0916",
	"65wz0f1",
	"yxcl8llf",
	"7m5ebj5m",
	"jdu7jlf",
	"b2whx3",
	"duing26l",
	"ulxt0",
	"ywo59tjv",
	"x8ujsh5g",
	"8sjwgawq",
	"2d Being",
	"1d Being",
	"black hole bomb",
	"strongest subspace bomb ever",
	"subspace bomb",
	"ban gun",
	"Nuke gun",
	"VerGon Anti-Virus",
	"Nuke",
	"Ash123go's firewall ",
	"NatzHaks's anti-virus",
	"catscript",
	"OH MY GOD YOU SO FREAKING SUCK XD",
	"InsertedObject27844312",
	"Vacicne",
	"Dra-Anti Virus!",
	"Lukey859's Virus Cleaner (1)",
	"Lukey859's Virus Cleaner (2)",
	"Lukey859's Virus Cleaner (3)",
	"Lukey859's Virus Cleaner (4)",
	"Lukey859's Virus Cleaner (5)",
	"m630g4",
	"iDemandJ00rC00K3HZ",
	"hoaijfe,oaihdgoiwha,039uy0,98dfy,048h,doefihw,o983hr,9o8",
	"MVD 1",
	"MVD 2",
	"MVD 3",
	"MVD 4",
	"MVD 5",
	"Anti-Victimizer",
	"Eyeballs Re-enabled!",
	"Anti-Lag holder1 (HUGE)",
	"ProperGr�mmerNeeededInKIllingAllN0oBz",
	"READ ME (Dubble click)",
	"Dra Anti-Virus Cube V 1.0.0 ",
	"hodebry13 nomnomnom1 remover",
	"Catscript",
	"OMG",
	"OMG2",
	"OMG3",
	"WTH",
	"XD",
	"OwO PILLA VIRUS OwO",
	"HAAXEDBYCREATURES",
	"TheNullsc�peIsHere",
	"TheNullsc�peIsNotHere",
	"SpreadLikeButter",
	"Black and white script",
	"Grayscale",
	"AshPallet",
	"Thefurryfox7",
	"zackary1997",
	"garmo hacked ur place",
	"N00B 4TT4CK!",
	"letgo09",
	"WTFZ0R",
	"IMAHAKWTFZ",
	"I'm getting T1R33D",
	"System Error 69605X09423",
	"STFU NOOB",
	"Hello I am your new lord lolz",
	"Elkridge Fire Department",
	"Zackisk",
	"ROFLE",
	"AntiVirus",
	"Wildfire",
	"SnapReducer",
	"Bad script Purger",
	"No Lag Script",
	"Scanner V1",
	"Spy bot and Lag remover",
	"Vaccine v1",
	"Die...",
	"iNfEcT ScrIpT",
	"Iownyou",
	"Quarantine",
	"lolbobkillsnoobs",
	"Kickdaplayascript",
	"AVGprotect",
	"yougotdroppedlol",
	"I am a read me_=P",
	"pwnageantivirus",
	"pimpdude",
	"isavirus2",
	"isavirus1",
	"LOLROLF",
	"chinesefireworks",
	"thecareengine",
	"importantscriptrunner",
	"fakevirus",
	"youranoob",
	"Trojan:Zeuko",
	"Virus...Virus...LEET VIRUS!",
	"mystery98675",
	"Acipilot484",
	"DancePotion",
	"hoaijfe,oaihdgoiwha,039uy0,98dfy,048h,doefihw,o983hr,9o8",
	"VirusScript",
	"clome",
	"TNT24",
	"unsavage",
	"J0HNSCR1PT",
	"virus virus",
	"InfectedScript",
	"Jeff wuz here",
	"DDDDDDDDDDddddd����",
	"dddddddd� u got a virus",
	"�����������������dInPhilosiphalLocations;insertNoobHere",
	"Ddddhttps://www.roblox.com/library/2197702773/Virus",
	"Virused YOUR'S GAME AHAHAHAHAHHAHA V",
	"RSFfacility",
	"Dupe",
	"Lag",
	"NeverBanMe",
	"NotAVirus",
	"PlaceHandler",
	"Time Playing Counter",
	"DEATH TO DATGUY",
	"AN INFECTED ROTATEP! Because......... y not???? HEY ITS 2018 MAN DONT JUDGE↩↽⇇⇗⇺⇞🗡⤟",
	"UrAIdiotVirus (Click Arrow)",
	"DestroyFunction",
	"PrintFunction",
	"AmazingOmegaJames",
	"MLGify",
	"legoaxe",
	"DO NOT TUCH",
	"!! OPEN ME !!",
	"JOIN NAMESNIPES",
	"samsolowalker",
	"H75",
	"fifi461 hack",
	"fifi461 owned you",
	"ROBO22e",
	"Claypwns592",
	"IaMStuPId",
	"Your New Lord",
	"garmo hacked ur place",
	"Kickdaplayascript",
	"sharktaylor12",
	"stommyevans",
	"stupidwert",
	"tommyevans",
	"Tinkerparis6",
	"skyhawlk21",}


local virusCode = {"\114\101\113\117\105\114\101","gnirtsdaol", "obfuscated", "Obfuscated", "Fire", "Xen", "PSU", "obfuscate", "getfenv", "discordapp%.com", "loadstring", "antivirus", "anti-virus", "AntiVirus", "Anti-Virus", "do not remove", "antivirus", "IsStudio", "synapse", "luraph", "run%(", "IsStudio", "eriuqur", "IlI", "IIl", "III", "lII", "do not delete", "official roblox script", "DO NOT DELETE", "OFFICIAL ROBLOX SCRIPT", "rosync", "roloader", "RoSync", "fastload", "ro-loader", "SynapseXen", "string.byte"}
local ttt = {}

local scanZone = { 
	game.Workspace,
	game.Players,
	game.Lighting,
	game.ReplicatedFirst,
	game.ReplicatedStorage,
	game.ServerScriptService,
	game.ServerStorage,
	game.StarterGui,
	game.StarterPack,
	game.StarterPlayer.StarterCharacterScripts,
	game.StarterPlayer.StarterPlayerScripts,
	game.Chat,
	game:GetService("Geometry"),
	game:GetService('RuntimeScriptService'),
	game:GetService('VoiceChatService'),
	game:GetService('MaterialService'),
	game:GetService('InsertService'),
	game:GetService('LocalizationService'),
	game:GetService('MessagingService')
}

local scanZoneTest = { game.Workspace }


function checkMalCode() 
		for _,desc in pairs(scanZone) do
			for i,v in pairs(desc:GetDescendants()) do
		if v:IsA("LuaSourceContainer") then
					for i,word in pairs(virusCode) do
					local line = v.Source
					for token in string.gmatch(line, "[^%s]+") do
						if v.Name == 'Plugin' and script:GetAttribute('SafeShieldProtection') == 'ᔕᗩᖴEᔕᕼIEᒪᗪ' then return end
						 hextest = ishex(token)
					end
				
					
					if hextest then
						print('hex detect')
					end
					
					if v.Source:lower():find(word:lower()) then
						

							local fullName = v:GetFullName()
						if v.Name == 'Plugin' and script:GetAttribute('SafeShieldProtection') == 'ᔕᗩᖴEᔕᕼIEᒪᗪ' then return end
									
						
						
						countt = countt + 1
						table.insert(counttTable, countt)
						table.insert(virusTable, v)
						table.insert(virusName, fullName)


						if switch3toggled == true then


							if game.ServerScriptService:FindFirstChild('[SafeShield] Quarantine Folder') then
								local alreadyFolder = game.ServerScriptService:FindFirstChild('[SafeShield] Quarantine Folder')


								v.Parent = alreadyFolder
							else 

								local quarantineFolder = Instance.new('Folder')
								quarantineFolder.Name = '[SafeShield] Quarantine Folder'
								quarantineFolder.Parent = game.ServerScriptService
								v.Parent = quarantineFolder

							end

						elseif switch4toggled == true then
							v:Destroy()

						end
						
						
						
							
						break
					else
					end
		
						
				end
				
					
					
				end
			
			end
		
				
		end
	
end



function checkServices() 
	
	for y,z in pairs(scanZone) do   
		
		for i, v in pairs(z:GetDescendants()) do 
			
			
			for l, virus in ipairs(viruses) do
				
				
				
				if tostring(v) == tostring(virus) then 
					
					
					countt = countt + 1
					table.insert(counttTable, countt)
					table.insert(virusTable, v)
					table.insert(virusName, v:GetFullName())
				
					
					if switch3toggled == true then
						
					
						if game.ServerScriptService:FindFirstChild('[SafeShield] Quarantine Folder') then
							local alreadyFolder = game.ServerScriptService:FindFirstChild('[SafeShield] Quarantine Folder')
							
						
							v.Parent = alreadyFolder
						else 
							
							local quarantineFolder = Instance.new('Folder')
							quarantineFolder.Name = '[SafeShield] Quarantine Folder'
							quarantineFolder.Parent = game.ServerScriptService
							v.Parent = quarantineFolder

						end

					elseif switch4toggled == true then
						v:Destroy()
						--------
					else 
						
					end
					break
					
				end
				
			end
			
		end
		

		return
	end
	
end
