--border frame------------------------------------------------------------------------------------------
local borderFrame = CreateFrame("Frame", "borderFrame", UIParent)
tinsert(UISpecialFrames, "borderFrame")
borderFrame:SetClampedToScreen(true)
borderFrame:SetMovable(true)
borderFrame:EnableMouse(true)
borderFrame:RegisterForDrag("LeftButton")
borderFrame:SetScript("OnDragStart", borderFrame.StartMoving)
borderFrame:SetScript("OnDragStop", borderFrame.StopMovingOrSizing)
borderFrame:Hide()
borderFrame:SetPoint("CENTER")
--border texture
borderFrame.Texture = borderFrame:CreateTexture(nil, "BACKGROUND", borderFrame)
borderFrame.Texture:SetAllPoints()
borderFrame.Texture:SetColorTexture(0, 0, 0, 1)
--border text label
borderFrame.TextLabel = borderFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
borderFrame.TextLabel:SetJustifyH("CENTER")
borderFrame.TextLabel:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 16)
borderFrame.TextLabel:SetText("honorEstimate")
borderFrame.TextLabel:SetPoint("TOP", borderFrame, "TOP", 0, 16)


--border button------------------------------------------------------------------------------------------
local buttonFrame = CreateFrame("Button", nil, borderFrame)
buttonFrame:SetSize(20, 20)
buttonFrame:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", 0, 0) 
--border button texture
buttonFrame.Texture = buttonFrame:CreateTexture(nil, "BACKGROUND", buttonFrame)
buttonFrame.Texture:SetAllPoints()
buttonFrame.Texture:SetColorTexture(1, 0, 0, 1)
--border button text
buttonFrame.TextLabel = buttonFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
buttonFrame.TextLabel:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 18)
buttonFrame.TextLabel:SetTextColor(1, 1, 1, 1)
buttonFrame.TextLabel:SetPoint("CENTER", buttonFrame, "CENTER", .5, -.5)
buttonFrame.TextLabel:SetText("X")
--border button click
local function buttonClicked(self)
    hePoint, heRelativeTo, heRelativePoint, hexOfs, heyOfs = borderFrame:GetPoint()
    borderFrame:Hide()
end
buttonFrame:SetScript("OnClick", buttonClicked)


--current bracket frame------------------------------------------------------------------------------------------
local currentBracketFrame = CreateFrame("Frame", nil, borderFrame)
--current bracket texture
currentBracketFrame.Texture = currentBracketFrame:CreateTexture(nil, "BACKGROUND", currentBracketFrame)
currentBracketFrame.Texture:SetAllPoints()
currentBracketFrame.Texture:SetColorTexture(.25, .25, .25, 1)
--current bracket text bracket number
currentBracketFrame.TextRank = currentBracketFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
currentBracketFrame.TextRank:SetJustifyH("LEFT")
currentBracketFrame.TextRank:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--current bracket text bracket maximum
currentBracketFrame.TextRankMax = currentBracketFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
currentBracketFrame.TextRankMax:SetJustifyH("LEFT")
currentBracketFrame.TextRankMax:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--current bracket text bracket minimum
currentBracketFrame.TextRankMin = currentBracketFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
currentBracketFrame.TextRankMin:SetJustifyH("LEFT")
currentBracketFrame.TextRankMin:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)


--previous bracket frame------------------------------------------------------------------------------------------
local previousBracketFrame = CreateFrame("Frame", nil, borderFrame)
--previous bracket texture
previousBracketFrame.Texture = previousBracketFrame:CreateTexture(nil, "BACKGROUND", previousBracketFrame)
previousBracketFrame.Texture:SetAllPoints()
previousBracketFrame.Texture:SetColorTexture(.25, .25, .25, 1)
--previous bracket text bracket number
previousBracketFrame.TextRank = previousBracketFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
previousBracketFrame.TextRank:SetJustifyH("LEFT")
previousBracketFrame.TextRank:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--previous bracket text bracket maximum
previousBracketFrame.TextRankMax = previousBracketFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
previousBracketFrame.TextRankMax:SetJustifyH("LEFT")
previousBracketFrame.TextRankMax:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--previous bracket text bracket minimum
previousBracketFrame.TextRankMin = previousBracketFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
previousBracketFrame.TextRankMin:SetJustifyH("LEFT")
previousBracketFrame.TextRankMin:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)


--rank frame------------------------------------------------------------------------------------------
local rankFrame = CreateFrame("Frame", nil, borderFrame)
--rank texture
rankFrame.Texture = rankFrame:CreateTexture(nil, "BACKGROUND", rankFrame)
rankFrame.Texture:SetAllPoints()
rankFrame.Texture:SetColorTexture(.25, .25, .25, 1)
--rank text label
rankFrame.TextLabel = rankFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
rankFrame.TextLabel:SetJustifyH("RIGHT")
rankFrame.TextLabel:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--rank text previous
rankFrame.TextPrevious = rankFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
rankFrame.TextPrevious:SetJustifyH("LEFT")
rankFrame.TextPrevious:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--rank text current
rankFrame.TextCurrent = rankFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
rankFrame.TextCurrent:SetJustifyH("LEFT")
rankFrame.TextCurrent:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)
--rank text next
rankFrame.TextNext = rankFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
rankFrame.TextNext:SetJustifyH("LEFT")
rankFrame.TextNext:SetFont("Interface\\AddOns\\honorEstimate\\consolab.ttf", 12)


--honor arrays-------------------------------------------------------------------------------------------
local rankNumber = {14,13,12,11,10,9,8,7,6,5,4,3,2,1}
local rankRPMin = {60000,55000,50000,45000,40000,35000,30000,25000,20000,15000,10000,5000,2000,0}
local rankRPMax = {60000,60000,55000,50000,45000,40000,35000,30000,25000,20000,15000,10000,5000,2000}
local earnMin = {12000,11000,10000,9000,8000,7000,6000,5000,4000,3000,2000,1000,400,0}
local earnMax = {13000,12000,11000,10000,9000,8000,7000,6000,5000,4000,3000,2000,1000,400}
local brackAbs = {0.003,0.008,0.020,0.035,0.060,0.100,0.159,0.228,0.327,0.436,0.566,0.697,0.845,1.000}
local brackRel = {0.003,0.005,0.012,0.015,0.025,0.040,0.059,0.069,0.099,0.109,0.130,0.131,0.148,0.155}


--number rounding-------------------------------------------------------------------------------------------
local function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power + 0.5) / power
end


--padding multiplier-------------------------------------------------------------------------------------------
local function pad(num)
    padding = 5
    return padding * num
end


--array search-------------------------------------------------------------------------------------------
local function getIndex(array, value, compare)
    for index,element in ipairs(array) do      
        if compare == 'gt' then
            if value >= element then
                    return index
            end
        elseif compare == 'lt' then
            if value <= element then
                    return index
            end
        else
            if value == element then
                    return index
            elseif value == index then
                    return element
            end
        end
    end
end


--current rank data-------------------------------------------------------------------------------------------
local function getCurrent(self)
    if UnitPVPRank("player") ~= 0 then
        currentRank = (UnitPVPRank("player") - 4)
        currentProgress = GetPVPRankProgress()
        _, _, currentHonor, currentStanding = GetPVPLastWeekStats()
        currentIndex = getIndex(rankNumber, currentRank)
        currentRPMin = rankRPMin[currentIndex]
        currentRPMax = rankRPMax[currentIndex]
        currentRP = ((currentRPMax - currentRPMin) * currentProgress) + currentRPMin
        currentDecay = currentRP * 0.2
        currentAbs = brackAbs[currentIndex] - (currentProgress * brackRel[currentIndex])
    end
end


--next rank data-------------------------------------------------------------------------------------------
local function getNext(self)
    if currentRank ~= nil then
        nextRP = (currentRPMax + currentDecay) - currentRP
        nextIndex = getIndex(earnMin, nextRP, "gt")
        nextBracket = rankNumber[nextIndex]
        nextRank = currentRank + 1
        nextEarnMax = earnMax[nextIndex]
        nextEarnMin = earnMin[nextIndex]
        nextBracketProgress = (nextRP - nextEarnMin) / (nextEarnMax - nextEarnMin)
        nextStanding = round(currentBracketMin[nextIndex] - (nextBracketProgress * currentBracketSize[nextIndex]),0)
        --nextHonor = round(currentHonor * ((currentPool * brackAbs[deltaIndex]) - (currentBracketProgress * brackRel[deltaIndex])) / ((currentPool * brackAbs[nextIndex]) - (nextBracketProgress * brackRel[nextIndex])),0)   --inaccurate
    end
end


--delta rank data-------------------------------------------------------------------------------------------
local function getDelta(self)
    if previousRank ~= nil then
        deltaRP = (currentRP - previousRP) + previousDecay
        deltaIndex = getIndex(earnMin, deltaRP, "gt")
        currentBracket = rankNumber[deltaIndex]
        deltaEarnMax = earnMax[deltaIndex]
        deltaEarnMin = earnMin[deltaIndex]
        currentBracketProgress = (deltaRP - deltaEarnMin) / (deltaEarnMax - deltaEarnMin)
        currentPool = round(currentStanding / (brackAbs[deltaIndex] - (currentBracketProgress * brackRel[deltaIndex])),0)
    end
end


--bracket data-------------------------------------------------------------------------------------------
local function getBracket(self)
    if currentPool ~= nil then
        currentBracketSize = {}
        currentBracketMin = {}
        currentBracketMax = {}
            for index,element in ipairs(brackRel) do
                currentBracketSize[index] = round(element * currentPool,0)
                if index == 1 then
                    currentBracketMin[index] = currentBracketSize[index]
                    currentBracketMax[index] = 1
                else
                    currentBracketMin[index] = currentBracketSize[index] + currentBracketMin[index - 1]
                    currentBracketMax[index] = currentBracketMin[index - 1] + 1
                end
            end
    end
end


local function initFrames(self)
    if previousPool ~= nil then
        --previous bracket text
        previousBracketFrame.TextRank:SetText("BRK\n"..table.concat(rankNumber,"\n"))
        previousBracketFrame.TextRankMax:SetText("PREV\nMAX\n"..table.concat(previousBracketMax,"\n"))
        previousBracketFrame.TextRankMin:SetText("MIN\n"..table.concat(previousBracketMin,"\n"))
        --previous bracket text size    
        previousRankW = previousBracketFrame.TextRank:GetStringWidth()
        previousRankMaxW = previousBracketFrame.TextRankMax:GetStringWidth()
        previousRankMinW = previousBracketFrame.TextRankMin:GetStringWidth()
        previousRankH = previousBracketFrame.TextRank:GetStringHeight()
        --previous bracket frame size 
        previousBracketFrame:SetSize(previousRankW + previousRankMaxW + previousRankMinW + pad(3), 171)
        previousBracketFrame:SetPoint("BOTTOMLEFT", borderFrame, "BOTTOMLEFT", pad(1), pad(1))
        previousBracketFrame.TextRank:SetPoint("TOPLEFT", previousBracketFrame, "TOPLEFT", 3, 12)
        previousBracketFrame.TextRankMax:SetPoint("TOPLEFT", previousBracketFrame, "TOPLEFT", previousRankW + pad(2) + 3, 24)
        previousBracketFrame.TextRankMin:SetPoint("TOPLEFT", previousBracketFrame, "TOPLEFT", previousRankW + previousRankMaxW + pad(3) + 3, 12)
    end
    if currentPool ~= nil then
        --current bracket text
        currentBracketFrame.TextRank:SetText("BRK\n"..table.concat(rankNumber,"\n"))
        currentBracketFrame.TextRankMax:SetText("CURR\nMAX\n"..table.concat(currentBracketMax,"\n"))
        currentBracketFrame.TextRankMin:SetText("MIN\n"..table.concat(currentBracketMin,"\n"))
        --current bracket text size   
        currentRankW = currentBracketFrame.TextRank:GetStringWidth()
        currentRankMaxW = currentBracketFrame.TextRankMax:GetStringWidth()
        currentRankMinW = currentBracketFrame.TextRankMin:GetStringWidth()
        currentRankH = currentBracketFrame.TextRank:GetStringHeight()
        currentRankMaxH = currentBracketFrame.TextRankMax:GetStringHeight()
        --current bracket frame size
        currentBracketFrame:SetSize(currentRankW + currentRankMaxW + currentRankMinW + pad(3), 171)
        currentBracketFrame:SetPoint("BOTTOMLEFT", borderFrame, "BOTTOMLEFT", pad(2) + previousBracketFrame:GetWidth(), pad(1))
        currentBracketFrame.TextRank:SetPoint("TOPLEFT", currentBracketFrame, "TOPLEFT", 3, 12)
        currentBracketFrame.TextRankMax:SetPoint("TOPLEFT", currentBracketFrame, "TOPLEFT", currentRankW + pad(2) + 3, 24)
        currentBracketFrame.TextRankMin:SetPoint("TOPLEFT", currentBracketFrame, "TOPLEFT", currentRankW + currentRankMaxW + pad(3) + 3, 12)
    end
    if previousRank ~= nil then
        rankFrame.TextPrevious:SetText("PREV\n"..previousRank.."\n"..round(previousProgress * 100,2).."%\n"..round(previousRP,0).."\n"..round(previousDecay,0).."\n"..previousStanding.."\n"..previousHonor.."\n"..previousBracket.."\n"..round(previousBracketProgress * 100,2).."%")
        prevW = rankFrame.TextPrevious:GetStringWidth()
    end
    if UnitPVPRank("player") ~= 0 then
        --rank text
        rankFrame.TextLabel:SetText("RANK:\n%RANK:\nRP:\nDECAY:\nSTAND:\nHONOR:\nBRK:\n%BRK:")
        rankFrame.TextCurrent:SetText("CURR\n"..currentRank.."\n"..round(currentProgress * 100,2).."%\n"..round(currentRP,0).."\n"..round(currentDecay,0).."\n"..currentStanding.."\n"..currentHonor.."\n"..currentBracket.."\n"..round(currentBracketProgress * 100,2).."%")
        --rankFrame.TextNext:SetText("NEXT\n"..nextRank.."\n0.00%\n"..round(nextRP,0).."\n\n"..nextStanding.."\n"..nextHonor.."\n"..nextBracket.."\n"..round(nextBracketProgress * 100,2).."%") --if using nexthonor
        rankFrame.TextNext:SetText("NEXT\n"..nextRank.."\n0.00%\n"..round(nextRP,0).."\n\n"..nextStanding.."\n\n"..nextBracket.."\n"..round(nextBracketProgress * 100,2).."%") --if not using nexthonor
        --rank text size   
        labelW = rankFrame.TextLabel:GetStringWidth()
        currW = rankFrame.TextCurrent:GetStringWidth()
        nextW = rankFrame.TextNext:GetStringWidth()
        labelH = rankFrame.TextLabel:GetStringHeight()
        --rank frame size
        rankFrame:SetSize(prevW + currW + nextW + pad(5), 98)
        rankFrame:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", labelW + pad(1), -(buttonFrame:GetHeight() + pad(1)))
        rankFrame.TextLabel:SetPoint("TOPLEFT", rankFrame, "TOPLEFT", -(labelW + pad(1)), 0)
        rankFrame.TextPrevious:SetPoint("TOPLEFT", rankFrame, "TOPLEFT", pad(1), 12)
        rankFrame.TextCurrent:SetPoint("TOPLEFT", rankFrame, "TOPLEFT", prevW + pad(2), 12)
        rankFrame.TextNext:SetPoint("TOPLEFT", rankFrame, "TOPLEFT", prevW + currW + pad(4), 12)
        --border frame size   
        borderFrame:SetSize(rankFrame:GetWidth() + labelW + pad(3), 310 + pad(4))
    end
 end
 

--addon init-------------------------------------------------------------------------------------------
local honorEstimateInit = CreateFrame("FRAME")
honorEstimateInit:RegisterEvent("PLAYER_LOGIN")
local function initHonorEstimate(self)
    print('honorEstimate loaded! enter /he for details')
    if currentRank == nil then
        print('no rank data found, collecting it')
        getCurrent()
        borderFrame:SetPoint("CENTER")
    elseif (tostring(currentRank * currentProgress) ~= tostring((UnitPVPRank("player") - 4) * GetPVPRankProgress())) then
        print('new rank data found!')
        previousRank = currentRank
        previousProgress = currentProgress
        previousRP = currentRP
        previousHonor = currentHonor
        previousStanding = currentStanding
        previousDecay = currentDecay
        previousPool = currentPool
        previousBracketSize = currentBracketSize
        previousBracketMin = currentBracketMin
        previousBracketMax = currentBracketMax
        previousBracket = currentBracket
        previousBracketProgress = currentBracketProgress
        getCurrent()
        getDelta()
        getBracket()
        getNext()
        borderFrame:SetPoint(hePoint, UIParent, heRelativePoint, hexOfs, heyOfs)
    else
        getCurrent() 
        borderFrame:SetPoint(hePoint, UIParent, heRelativePoint, hexOfs, heyOfs)
    end
end
honorEstimateInit:SetScript("OnEvent", initHonorEstimate)


--chat commands-------------------------------------------------------------------------------------------
local function HECommands(msg, editbox)
    getCurrent()
    getDelta()
    getBracket()
    getNext()
    initFrames()
    if borderFrame:IsShown() then
        hePoint, heRelativeTo, heRelativePoint, hexOfs, heyOfs = borderFrame:GetPoint()
        borderFrame:Hide()
    else
        borderFrame:Show()
    end
    if previousRank == nil then
        print('no previous rank data !!')
    end
end

SLASH_HE1 = "/he"
SlashCmdList["HE"] = HECommands