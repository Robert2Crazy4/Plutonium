-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Plutos Scripthub",
   LoadingTitle = "Loading!...",
   LoadingSubtitle = "by Pluto",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Universal = Window:CreateTab("Universal", 4483362458)
local TitanicTab = Window:CreateTab("Titanic", 4483362458)
local UtilityTab = Window:CreateTab("Utility", 4483362458)

-- Fly Script Button
Universal:CreateButton({
   Name = "Fly",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end
})

-- Godmode Script Button (Universal)
Universal:CreateButton({
   Name = "Godmode (Universal)",
   Callback = function()
       loadstring(game:HttpGet("https://freenote.biz/raw/Fhpx5r5A8M"))()
   end
})

-- Dex Explorer Button
Universal:CreateButton({
   Name = "Dex Explorer",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/dyyll/Dex-V5-leak/refs/heads/main/Dex%20V5.lua"))() -- Dex Explorer Script
   end
})

-- Infinite Yield Button
Universal:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() -- Infinite Yield Script
   end
})


-- Button to Spawn EZHub Script
Universal:CreateButton({
   Name = "Spawn EZHub",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/EZHub/main/EZHub.lua'))() -- EZHub Script
   end
})

-- Button to Spawn Orca Script Hub
Universal:CreateButton({
   Name = "Spawn Orca",
   Callback = function()
       loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
   end
})

-- Save and Exit button (optional)
Universal:CreateButton({
   Name = "Exit ScriptHub",
   Callback = function()
       Rayfield:Destroy()
   end
})



TitanicTab:CreateButton({
   Name = "Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/pattingbabies/blora/main/titanicgui"))()
   end,
})

UtilityTab:CreateButton({
   Name = "UNCCheckEnv",
   Callback = function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/refs/heads/main/UNCCheckEnv.lua"))()
   end,
})

Universal:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false, -- Default value, off
   Flag = "Toggle1", -- Unique flag for saving settings
   Callback = function(Value)
      local infjmp = Value -- Value is true when toggled on, false when toggled off
      if infjmp then
         -- Enable Infinite Jump
         game:GetService("UserInputService").jumpRequest:Connect(function()
            if infjmp then
               game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
         end)
      else
         -- You can add code here to disable the functionality if needed
         -- However, as the script stands, it will simply not jump when 'infjmp' is false
      end
   end,
})

Universal:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

-- Load the UI
Rayfield:LoadConfiguration()