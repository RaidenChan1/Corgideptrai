--[[
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
    🚀 PANDA AUTH V2.5 LOADER (UPDATED INPUT)
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
]]

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

-----------------------------------------------------------
-- 📝 CẤU HÌNH (HÃY ĐIỀN CHÍNH XÁC)
-----------------------------------------------------------
local LoaderConfig = {
    ServiceID = "ditroblox", -- Tên Service trên Panda
    
    -- ⚠️ QUAN TRỌNG: Link này PHẢI LÀ LINK SCRIPT HACK (Github Raw), KHÔNG ĐƯỢC LÀ LINK PANDA
    TargetScript = "https://pandadevelopment.net/virtual/file/ec4f0e9f24a7e775", 
    
    -- Key lấy từ Global Variable (getgenv)
    InputKey = getgenv().Key 
}
-----------------------------------------------------------

-- [HTTP REQUEST FIX]
local httpRequest = nil
if syn and syn.request then httpRequest = syn.request
elseif http and http.request then httpRequest = http.request
elseif request then httpRequest = request
elseif http_request then httpRequest = http_request
end

local function log(...)
    print("[PandaAuth]", ...)
end

-- [HWID GENERATOR]
local function getHWID()
    local hwid = nil
    if gethwid then 
        local ok, res = pcall(gethwid)
        if ok and res ~= "" then hwid = res end
    end
    if not hwid then
        local ok, res = pcall(function() return game:GetService("RbxAnalyticsService"):GetClientId() end)
        if ok and res ~= "" then hwid = res end
    end
    return hwid or "unknown_hwid"
end

-- [KEY STORAGE]
local function getSavedKeyPath(sid) return sid .. "_v2_key.txt" end

local function saveKey(sid, key)
    if writefile then writefile(getSavedKeyPath(sid), key) end
end

local function loadSavedKey(sid)
    if not isfile then return nil end
    local path = getSavedKeyPath(sid)
    if isfile(path) then return readfile(path) end
    return nil
end

local function clearSavedKey(sid)
    if delfile and isfile(getSavedKeyPath(sid)) then delfile(getSavedKeyPath(sid)) end
end

-- [VALIDATION - CHỐNG BYPASS]
local function validateKey(key, serviceId)
    if not httpRequest then return false, "No HTTP Request" end
    local hwid = getHWID()
    
    -- Encode URL để tránh lỗi ký tự đặc biệt
    local safeKey = HttpService:UrlEncode(key)
    local safeHWID = HttpService:UrlEncode(hwid)
    local safeService = HttpService:UrlEncode(serviceId)

    local url = "https://pandadevelopment.net/v2_validation?service="..safeService.."&key="..safeKey.."&hwid="..safeHWID
    
    log("Checking key with Server...")
    local ok, response = pcall(function()
        return httpRequest({
            Url = url, 
            Method = "GET",
            Headers = {["User-Agent"] = "Roblox/Client"} -- Thêm Header để giống thật
        })
    end)

    if not ok or not response then return false, "Lỗi kết nối mạng" end

    local ok2, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
    if not ok2 then return false, "Lỗi dữ liệu từ Server" end

    -- Kiểm tra kỹ trạng thái trả về
    if data.V2_Authentication == "success" then
        return true, data
    else
        return false, data.V2_Authentication -- Trả về lý do lỗi (Key sai/Hết hạn)
    end
end

-- ========================================================
-- 🚀 PHẦN 2: LOGIC CHẠY SCRIPT (AUTO RUN)
-- ========================================================

local function RunMainScript()
    print("✅ Key chuẩn! Đang tải Script...")
    
    -- Đánh dấu biến toàn cục (Script Hub nên check biến này)
    getgenv().PandaAuthPassed = true 
    
    StarterGui:SetCore("SendNotification", {
        Title = "Panda Auth",
        Text = "Xác thực thành công!",
        Duration = 5
    })
    
    -- Tải Script Hub
    local success, err = pcall(function()
        loadstring(game:HttpGet(LoaderConfig.TargetScript))()
    end)
    
    if not success then
        warn("❌ Link TargetScript bị lỗi: " .. tostring(err))
        StarterGui:SetCore("SendNotification", {Title = "Lỗi Script", Text = "Link Script Hub bị hỏng!", Duration = 5})
    end
end

-- [MAIN LOGIC]
print("🔄 Đang khởi động Panda Auth V2.5...")

local keyToValidate = LoaderConfig.InputKey
local isSavedKey = false

-- 1. Nếu không nhập key mới, thử tìm key cũ
if not keyToValidate or keyToValidate == "" then
    local saved = loadSavedKey(LoaderConfig.ServiceID)
    if saved and saved ~= "" then
        print("📂 Tìm thấy key đã lưu: " .. saved)
        keyToValidate = saved
        isSavedKey = true
    end
end

-- 2. Bắt đầu kiểm tra
if keyToValidate and keyToValidate ~= "" then
    local isValid, msg = validateKey(keyToValidate, LoaderConfig.ServiceID)
    
    if isValid then
        -- Nếu key đúng -> Lưu lại (nếu là key mới) và Chạy Script
        if not isSavedKey then saveKey(LoaderConfig.ServiceID, keyToValidate) end
        RunMainScript()
    else
        -- Nếu key sai
        warn("❌ Key không hợp lệ: " .. tostring(msg))
        
        -- Nếu key sai mà là key cũ -> Xóa file lưu để lần sau nhập lại
        if isSavedKey then 
            print("🗑️ Key cũ đã hết hạn, đang xóa...")
            clearSavedKey(LoaderConfig.ServiceID)
        end
        
        -- Copy Link Get Key
        local getKeyURL = "https://pandadevelopment.net/getkey?service=" .. LoaderConfig.ServiceID .. "&hwid=" .. getHWID()
        if setclipboard then 
            setclipboard(getKeyURL)
            StarterGui:SetCore("SendNotification", {
                Title = "Key Sai/Hết Hạn",
                Text = "Đã copy link lấy key mới!",
                Duration = 10
            })
        end
        
        -- KICK NGƯỜI CHƠI (Để chắc chắn không bypass)
        Players.LocalPlayer:Kick("Key sai: " .. tostring(msg))
    end
else
    -- Không có key nào được nhập
    local getKeyURL = "https://pandadevelopment.net/getkey?service=" .. LoaderConfig.ServiceID .. "&hwid=" .. getHWID()
    if setclipboard then setclipboard(getKeyURL) end
    Players.LocalPlayer:Kick("Vui lòng nhập Key vào Script (getgenv().Key)!")
end
