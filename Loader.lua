--// 🧠 Magic Hub TitanTD - Auto System [By Magic_Master]

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")

----------------------------------------------------
-- 🛡️ 1. ANTI KICK 20 PHÚT
----------------------------------------------------
task.spawn(function()
    local LocalPlayer = Players.LocalPlayer
    local VirtualUser = game:GetService("VirtualUser")

    LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

----------------------------------------------------
-- 🏃‍♂️ 2. AUTO TĂNG SPEED (FIX LỖI THIẾU end)
----------------------------------------------------
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            RS.Remotes.ChangeSpeed:FireServer(2)
        end)
    end
end)

----------------------------------------------------
-- 🗳️ 3. AUTO VOTE DIFFICULTY + READY (CHẠY 1 LẦN – CÙNG LÚC)
----------------------------------------------------
task.spawn(function()
    pcall(function()
        RS:WaitForChild("Globals"):WaitForChild("Difficulty"):WaitForChild("Vote"):FireServer("Hard")
    end)

    pcall(function()
        RS:WaitForChild("Remotes"):WaitForChild("ReadyUp"):FireServer()
    end)
end)

----------------------------------------------------
-- ⚙️ 4. AUTO UPGRADE TOWER (Lặp mỗi 2 giây)
----------------------------------------------------
task.spawn(function()
    while task.wait(2) do
        for _, tower in ipairs(WS.GameAssets.Towers:GetChildren()) do
            local rem = tower:FindFirstChild("UpgradeRem")
            if rem and rem:IsA("RemoteEvent") then
                pcall(function()
                    rem:FireServer("Sub")
                    rem:FireServer()
                end)
            end
        end
    end
end)

----------------------------------------------------
-- 🚪 5. AUTO VÀO SECRET BUNKER
----------------------------------------------------
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            RS.Remotes.QueueForMM:FireServer("Secret Bunker")
        end)
    end
end)

----------------------------------------------------
-- 🗂️ 6. AUTO PLACE TOWER (GIỮ NGUYÊN LOGIC)
----------------------------------------------------
task.spawn(function()
    local place = RS.Remotes.PlaceTower

    local towerList = {

        -- 2 UNIT SỐ 6
        {"6", Vector3.new(874.633544921875, 56.90999984741211, -71.01261138916016), 0, "XD"},
        {"6", Vector3.new(874.9434814453125, 56.90999984741211, -67.67831420898438), 0, "XD"},

        -- 2 UNIT SỐ 4
        {"4", Vector3.new(862.5279541015625, 57.13500213623047, -99.61219787597656), 0, "XD"},
        {"4", Vector3.new(862.6406860351562, 57.13500213623047, -65.58415222167969), 0, "XD"},

        -- 3 UNIT SỐ 5
        {"5", Vector3.new(862.3339233398438, 57.92250061035156, -88.58125305175781), 0, "XD"},
        {"5", Vector3.new(861.7651977539062, 57.92250061035156, -84.03717041015625), 0, "XD"},
        {"5", Vector3.new(861.79736328125, 57.92250061035156, -79.05168151855469), 0, "XD"},

        -- 3 UNIT SỐ 1
        {"1", Vector3.new(844.0299682617188, 57.92250061035156, -82.6032943725586), 0, "XD"},
        {"1", Vector3.new(843.9747314453125, 57.92250061035156, -88.00092315673828), 0, "XD"},
        {"1", Vector3.new(844.2078857421875, 57.92250061035156, -77.33682250976562), 0, "XD"},

        -- 3 UNIT SỐ 2
        {"2", Vector3.new(874.2919921875, 57.36000061035156, -89.64865112304688), 0, "XD"},
        {"2", Vector3.new(840.1883544921875, 57.36000061035156, -80.11038208007812), 0, "XD"},
        {"2", Vector3.new(837.8319091796875, 57.36000061035156, -67.77001190185547), 0, "XD"},
        -- UNIT SỐ 3
        {"3", Vector3.new(856.5842895507812, 61.185001373291016, -72.8548355102539), 0, "XD"},
    }

    while task.wait(3) do
        for _, data in ipairs(towerList) do
            pcall(function()
                place:FireServer(unpack(data))
            end)
            task.wait(0.2)
        end
    end
end)

----------------------------------------------------
-- 🎒 7. AUTO USE GEAR
----------------------------------------------------
task.spawn(function()
    local Globals = RS:WaitForChild("Globals")
    local BasePercent = Globals:WaitForChild("BasePercent") -- IntValue

    while task.wait(0) do
        pcall(function()
            if BasePercent.Value <= 50 then
                RS.Remotes.UseGear:FireServer(Enum.UserInputState.Begin)
                -- print("[Gear] Used | BasePercent =", BasePercent.Value)
            else
                -- print("[Gear] Skip | BasePercent =", BasePercent.Value)
            end
        end)
    end
end)


task.spawn(function()
    while task.wait(3) do
        pcall(function()
            game:GetService("Players").LocalPlayer:WaitForChild("SkipLoader")
        end)
    end
end)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(31.07, 57.85, 990.52)
