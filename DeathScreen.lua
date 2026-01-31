---@class FunFact
local FunFact = FunFact

-- Default funny death messages
local DefaultDeathMessages = {
	-- HUMOR (50)
	'Here is a fun fact. You Died.',
	'WELCOME TO FLOOR POV',
	'YOU DIED. AGAIN.',
	'GRAVITY WINS AGAIN',
	'FLOOR INSPECTOR REPORTING',
	'TAKING A DIRT NAP',
	'RESPAWN LOADING...',
	'HORIZONTAL HERO MODE',
	'GROUND LEVEL ACHIEVED',
	'FLOOR IS LAVA? NOT ANYMORE.',
	'TACTICAL REPOSITIONING',
	'UNSCHEDULED NAP TIME',
	'THE FLOOR NEEDED A HUG',
	"THAT WASN'T THE PLAN",
	'CTRL+ALT+DELETED',
	'TASK FAILED SUCCESSFULLY',
	'SKILL ISSUE DETECTED',
	'PRESS F TO PAY RESPECTS',
	'404: LIFE NOT FOUND',
	'CRITICAL EXISTENCE FAILURE',
	'HARDCORE MODE: OFF',
	'HAVE YOU TRIED NOT DYING?',
	'YOUR REPAIR BILL SAYS HELLO',
	'DEATH SPEEDRUN: PERSONAL BEST!',
	'INSTRUCTIONS UNCLEAR. DIED ANYWAY.',
	'WORKING AS INTENDED',
	'CALCULATED. POORLY.',
	'PROTIP: HEALTH SHOULD STAY ABOVE ZERO',
	'YOU ZIGGED WHEN YOU SHOULD HAVE ZAGGED',
	"THAT'LL BUFF OUT... RIGHT?",
	'ACHIEVEMENT UNLOCKED: FLOOR TASTER',
	'YOUR ANCESTORS ARE DISAPPOINTED',
	'INSERT COIN TO CONTINUE',
	'KILLED BY: BAD DECISIONS',
	'YOU FORGOT TO DODGE',
	'TURNS OUT THAT WAS AVOIDABLE',
	'DEATH: 1, YOU: 0',
	'MAYBE TRY EASIER CONTENT?',
	'RIP BOZO',
	'L + RATIO + YOU DIED',
	'CERTIFIED BRUH MOMENT',
	'NOT YOUR FINEST HOUR',
	'WELL THAT ESCALATED QUICKLY',
	'SHOULDA STAYED IN BED TODAY',
	'YOUR LIFE FLASHED. IT WAS BORING.',
	'PLOT TWIST: YOU WERE THE LOOT',
	'FREE TRIP BACK TO THE GRAVEYARD',
	'SPEEDRUNNING THE RESPAWN TIMER',
	'THAT WENT WELL. FOR THEM.',
	'YOU TRIED. THAT COUNTS FOR NOTHING.',

	-- GAMING (25)
	'WASTED',
	'FATALITY',
	'YOU DIED - DARK SOULS STYLE',
	'SNAKE? SNAKE?! SNAAAAKE!!!',
	'FINISH HIM! ...OH WAIT, THEY DID',
	"IT'S DANGEROUS TO GO ALONE. YOU WENT ANYWAY.",
	'YOU HAVE DIED OF DYSENTERY',
	"MISSION FAILED. WE'LL GET 'EM NEXT TIME.",
	'YOUR PRINCESS IS IN ANOTHER GRAVEYARD',
	'DO A BARREL ROLL! ...INTO YOUR GRAVE',
	'ALL YOUR BASE ARE BELONG TO DEATH',
	'THE CAKE WAS A LIE. SO WAS YOUR SURVIVAL.',
	'LEEEEROOOOY JENKINS!!! ...AND THEN YOU DIED',
	'50 DKP MINUS!',
	'MANY WHELPS! HANDLE IT! ...YOU DID NOT.',
	'AT LEAST YOU HAVE CHICKEN',
	'FROSTMOURNE HUNGERS... FOR YOUR SOUL',
	'YOU ARE NOT PREPARED... TO LIVE',
	'RUN AWAY LITTLE GIRL! ...YOU DID NOT.',
	'MORE DOTS! ...NOT ENOUGH DOTS.',
	'THAT WAS NOT VERY CASH MONEY OF THAT BOSS',
	'GG EZ... WAIT, YOU LOST',
	'SKILL TREE NEEDS MORE SURVIVAL POINTS',
	'RESPAWN IN 3... 2... 1...',
	'YOUR GEAR SCORE WAS NOT HIGH ENOUGH',

	-- POP CULTURE (40)
	'HARAMBE SENDS HIS REGARDS',
	'THE UPSIDE DOWN CALLED. YOU ANSWERED.',
	'YOU JUST GOT RICKROLLED BY DEATH',
	'GAME OVER, MAN. GAME OVER!',
	'I USED TO BE AN ADVENTURER LIKE YOU...',
	"THIS ISN'T EVEN MY FINAL FORM",
	'THANKS OBAMA',
	'EMOTIONAL DAMAGE!',
	'TO BE CONTINUED...',
	'DIRECTED BY ROBERT B. WEIDE',
	"I'VE MADE A HUGE MISTAKE",
	'SURPRISE MECHANICS',
	'AND I OOP-',
	"SIR, THIS IS A WENDY'S... GRAVEYARD",
	'THEY DID SURGERY ON A GRAPE. THEY DID MURDER ON YOU.',
	'OK BOOMER. OK DEAD.',
	'IT BE LIKE THAT SOMETIMES',
	'I GUESS YOU COULD SAY... YOU DIED',
	'VIBE CHECK: FAILED',
	'NO CAP, YOU JUST DIED FR FR',
	'SHEESH... THAT WAS BAD',
	'CAUGHT IN 4K... DYING',
	'RENT FREE IN THE GRAVEYARD',
	'POV: YOU MADE A MISTAKE',
	'MAIN CHARACTER SYNDROME: CURED',
	'THE SIMULATION HAS ENDED YOUR TRIAL',
	'WINTER CAME FOR YOU',
	'YOU KNOW NOTHING, DEAD PLAYER',
	'I AM INEVITABLE. YOU ARE DEAD.',
	'PERFECTLY BALANCED. YOU ARE NOT.',
	'REALITY IS OFTEN DISAPPOINTING',
	'YOU SHOULD HAVE GONE FOR THE HEAD',
	'I DONT FEEL SO GOOD...',
	'WHAT IS GRIEF IF NOT LOVE PERSEVERING?',
	'THIS IS THE WAY... TO THE GRAVEYARD',
	'I HAVE SPOKEN. YOU HAVE DIED.',
	'SOMEHOW, YOU DIED AGAIN',
	'NEVER GONNA GIVE YOU UP. DEATH WILL.',
	'THEY TOOK THE HOBBITS TO ISENGARD. THEY TOOK YOU TO THE GRAVE.',
	'ONE DOES NOT SIMPLY WALK INTO MORDOR. OR SURVIVE.',
}

---@class FunFact.DeathScreen
---@field frame Frame The main death screen frame
---@field ticker any C_Timer ticker for fact rotation
---@field currentFact string The currently displayed fact
---@field timeRemaining number Seconds until next fact
---@field isTestMode boolean Whether we're in test mode (not actually dead)
local DeathScreen = {}
FunFact.DeathScreen = DeathScreen

-- Role-specific death messages (25 each)
local HealerDeathMessages = {
	'HEALER DOWN! ...WAIT, YOU ARE THE HEALER',
	'YOU HAD ONE JOB... HEAL YOURSELF',
	'PHYSICIAN, HEAL THYSELF',
	'WHO HEALS THE HEALER? NOBODY, APPARENTLY.',
	'HEALING OTHERS: YES. HEALING SELF: NO.',
	'THE RAID IS FINE. YOU ARE NOT.',
	'MANA WAS FULL. HEALTH WAS NOT.',
	'SHOULD HAVE USED A DEFENSIVE',
	'FORGOT TO HEAL THE MOST IMPORTANT PERSON',
	'YOUR HOTS COULD NOT SAVE YOU',
	'DISPEL THAT DEATH DEBUFF... OH WAIT',
	'THE GREEN BARS BETRAYED YOU',
	'HEAL PRIORITY: TANK > DPS > YOU, APPARENTLY',
	'EVEN YOUR OWN HEALS GAVE UP',
	'STOOD IN FIRE WHILE HEALING EVERYONE ELSE',
	'FOCUSED TOO HARD ON RAID FRAMES',
	'YOUR HEALING METERS DIED WITH YOU',
	'CARRIED THE RAID. DROPPED YOURSELF.',
	'AT LEAST THE TANK IS ALIVE... RIGHT?',
	'OVERHEALING YOURSELF: 0%',
	'WHO NEEDS SELF-PRESERVATION ANYWAY?',
	'HEALING EFFICIENCY: FATAL',
	'YOU WERE TOO BUSY WATCHING HEALTH BARS',
	'COOLDOWNS READY. YOU ARE NOT.',
	'THE SPIRIT HEALER IS NOW YOUR CO-HEALER',
}

local TankDeathMessages = {
	'PULLED TOO MUCH, EH?',
	'FACE TANKING HAS ITS LIMITS',
	'EVEN YOUR ARMOR GAVE UP',
	'THE BOSS FOUND YOUR COOLDOWN GAP',
	'THREAT ESTABLISHED. SURVIVAL NOT.',
	'MAIN TANK DOWN! ...WHO PULLS NOW?',
	'MITIGATION: 100%. SURVIVAL: 0%.',
	'SHOULD HAVE KITED THAT ONE',
	'YOUR SHIELD SENDS ITS CONDOLENCES',
	'HEALER BLAMED. YOU KNOW IT WAS YOU.',
	'DEFENSIVE COOLDOWNS ARE FOR USING',
	'THE FLOOR TANK TAKES OVER',
	'PULLED WALL-TO-WALL. DIED WALL-TO-FLOOR.',
	"THAT'S ONE WAY TO DROP AGGRO",
	'ACTIVE MITIGATION? MORE LIKE INACTIVE.',
	'THOUGHT YOU WERE INVINCIBLE, HUH?',
	'THE BOSS CRITTED YOUR EGO',
	'TANKED EVERYTHING EXCEPT STAYING ALIVE',
	'INCOMING DAMAGE EXCEEDED HEALER PATIENCE',
	'PERHAPS LESS TRASH NEXT PULL?',
	'YOU HELD AGGRO. BRIEFLY.',
	'CONGRATULATIONS, YOU WIPED THE GROUP',
	'RAID LEADER IS TYPING...',
	'YOUR HEALTH BAR SAID GOODBYE',
	'REPAIR BILL: YOUR DIGNITY',
}

local DPSDeathMessages = {
	'IF YOU DID MORE DPS, YOU WOULD NOT BE DEAD',
	'DEAD DPS IS ZERO DPS',
	'SHOULD HAVE KILLED IT FASTER',
	'MECHANICS ARE NOT A DPS LOSS IF YOU LIVE',
	'YOUR PARSE DIED WITH YOU',
	'PADDING METERS FROM THE GRAVEYARD?',
	'TUNNELED THE BOSS. IGNORED THE MECHANIC.',
	'THREAT ISSUES? IN THIS ECONOMY?',
	'THE FLOOR IS NOT PART OF YOUR ROTATION',
	"DPS'D SO HARD YOU FORGOT TO LIVE",
	'STOOD IN BAD FOR THAT EXTRA CAST',
	'GREED CAST: FATAL',
	'YOUR DAMAGE METER STOPPED UPDATING',
	'MAYBE INTERRUPT NEXT TIME?',
	'PHASE TWO CLAIMED ANOTHER ONE',
	'HEALERS HAVE PRIORITIES. YOU WERE NOT ONE.',
	'AT LEAST YOU WERE TOP DPS... FOR A SECOND',
	'EXECUTED THE ROTATION. GOT EXECUTED.',
	"CAN'T PARSE FROM THE FLOOR",
	'SOAK MECHANICS EXIST FOR A REASON',
	'BLOODLUST COULD NOT SAVE YOU',
	'SHOULD HAVE SAVED THAT DEFENSIVE',
	'YOUR COOLDOWNS WILL MISS YOU',
	'ENRAGE TIMER: YOU LOST',
	'LOG THIS, WARCRAFTLOGS',
}

-- Easter egg messages for names ending in 'gale' (druid healer friend)
local GaleDruidMessages = {
	'REJUVENATION? REGROWTH? HELLO?!',
	"LIFEBLOOM COULDN'T SAVE YOU THIS TIME, GALE",
	'INNERVATE THIS, GALE',
	'TRANQUILITY WOULD HAVE BEEN NICE, GALE',
	'WILD GROWTH? MORE LIKE WILD DEATH, GALE',
	"BEAR FORM WASN'T ENOUGH, HUH GALE?",
	'SHOULD HAVE STAYED IN TREE FORM, GALE',
	'EVEN NATURE ABANDONED YOU, GALE',
	'IRONBARK YOURSELF NEXT TIME, GALE... OH WAIT',
	'THE DREAM CALLED. IT SAID GIT GUD, GALE.',
	'SWIFTMEND WAS OFF COOLDOWN, GALE',
	'CENARION WARD SENDS REGRETS, GALE',
}

local GaleNonDruidMessages = {
	'A DRUID WOULD NOT HAVE DIED FROM THAT... GALE.',
	'SHOULD HAVE ROLLED DRUID, GALE.',
	'YOUR DRUID WOULD HAVE LIVED, JUST SAYING.',
	'IMAGINE DYING AS A NON-DRUID... GALE.',
	'MISS YOUR HEALS YET, GALE?',
	'THIS IS WHAT HAPPENS WHEN YOU BETRAY THE DREAM, GALE',
	"NATURE'S CURE CAN'T SAVE YOU NOW, GALE",
	'ELUNE IS DISAPPOINTED, GALE.',
}

---Gets the player's role (HEALER, TANK, DAMAGER, or nil)
---@return string|nil
local function GetPlayerRole()
	local spec = GetSpecialization()
	if spec then
		local role = GetSpecializationRole(spec)
		return role
	end
	return nil
end

---Gets a random death message from defaults + user custom messages
---@return string
function DeathScreen:GetDeathMessage()
	local playerName = UnitName('player') or ''
	local nameLower = playerName:lower()
	local _, playerClass = UnitClass('player')
	local playerRole = GetPlayerRole()

	-- Easter egg: 20% chance for special message if name ends in 'gale'
	if nameLower:sub(-4) == 'gale' and math.random(1, 100) <= 20 then
		if playerClass == 'DRUID' then
			return GaleDruidMessages[math.random(1, #GaleDruidMessages)]
		else
			return GaleNonDruidMessages[math.random(1, #GaleNonDruidMessages)]
		end
	end

	-- 20% chance for role-specific message
	if playerRole and math.random(1, 100) <= 20 then
		if playerRole == 'HEALER' then
			return HealerDeathMessages[math.random(1, #HealerDeathMessages)]
		elseif playerRole == 'TANK' then
			return TankDeathMessages[math.random(1, #TankDeathMessages)]
		elseif playerRole == 'DAMAGER' then
			return DPSDeathMessages[math.random(1, #DPSDeathMessages)]
		end
	end

	local messages = {}

	-- Add default messages
	for _, msg in ipairs(DefaultDeathMessages) do
		table.insert(messages, msg)
	end

	-- Add user custom messages
	if FunFact.DB and FunFact.DB.DeathScreen and FunFact.DB.DeathScreen.customMessages then
		for _, msg in ipairs(FunFact.DB.DeathScreen.customMessages) do
			if msg and msg ~= '' then
				table.insert(messages, msg)
			end
		end
	end

	return messages[math.random(1, #messages)]
end

---Gets a random fact from enabled categories (death screen specific)
---@return string fact The fact text
---@return string category The category display name
function DeathScreen:GetFact()
	local enabledCategories = FunFact.DB.DeathScreen.enabledCategories
	local facts = {}

	-- Collect facts from enabled categories with their category info
	for name, submodule in FunFact:IterateModules() do
		if string.match(name, 'FactList_') then
			local categoryName = string.sub(name, 10)
			-- Check if category is enabled (default to true if not set)
			local isEnabled = enabledCategories[categoryName]
			if isEnabled == nil then
				isEnabled = enabledCategories['**'] or true
			end

			if isEnabled and submodule.Facts then
				local displayName = submodule.displayname or categoryName
				for _, fact in ipairs(submodule.Facts) do
					table.insert(facts, { text = fact, category = displayName })
				end
			end
		end
	end

	if #facts == 0 then
		return 'No facts available. Enable some fact categories in the options.', 'Error'
	end

	local selected = facts[math.random(1, #facts)]
	return selected.text, selected.category
end

---Creates the death screen frame
function DeathScreen:CreateFrame()
	if self.frame then
		return
	end

	local frame = CreateFrame('Frame', 'FunFactDeathScreen', UIParent, 'BackdropTemplate')
	frame:SetSize(780, 195)
	frame:SetPoint('TOP', 0, -220)
	frame:SetFrameStrata('FULLSCREEN_DIALOG')
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:Hide()

	-- Background with atlas
	frame.bg = frame:CreateTexture(nil, 'BACKGROUND')
	frame.bg:SetAllPoints()
	frame.bg:SetAtlas('house-upgrade-reward-section-bg')
	frame.bg:SetAtlas('runecarving-background-smoke')
	frame.bg:SetAlpha(0.9)

	-- Shift+drag to move, Ctrl+Shift+Click to reset
	frame:SetScript('OnMouseDown', function(f, button)
		if button == 'LeftButton' then
			if IsControlKeyDown() and IsShiftKeyDown() then
				-- Reset position
				DeathScreen:ResetPosition()
			elseif IsShiftKeyDown() then
				f:StartMoving()
			end
		end
	end)

	frame:SetScript('OnMouseUp', function(f, button)
		f:StopMovingOrSizing()
		-- Save position and mark as moved
		local point, _, _, x, y = f:GetPoint()
		if FunFact.DB and FunFact.DB.DeathScreen then
			-- Check if position differs from default
			local isDefault = (point == 'TOP' and math.abs(x) < 1 and math.abs(y + 100) < 1)
			FunFact.DB.DeathScreen.position = {
				point = point,
				x = x,
				y = y,
				moved = not isDefault,
			}
			-- Update hint text visibility
			DeathScreen:UpdateHintText()
		end
	end)

	-- Death message header
	frame.deathMessage = frame:CreateFontString(nil, 'OVERLAY', 'GameFontNormalHuge')
	frame.deathMessage:SetPoint('TOP', frame, 'TOP', 0, -15)
	frame.deathMessage:SetTextColor(1, 0.2, 0.2, 1)
	frame.deathMessage:SetText('WELCOME TO FLOOR POV')

	-- Category label
	frame.categoryText = frame:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	frame.categoryText:SetPoint('TOP', frame.deathMessage, 'BOTTOM', 0, -8)
	frame.categoryText:SetTextColor(0.8, 0.8, 0.2, 1)
	frame.categoryText:SetText('FunFact from DadJokes')

	-- Fact text
	frame.factText = frame:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	frame.factText:SetPoint('TOP', frame.categoryText, 'BOTTOM', 0, -10)
	frame.factText:SetPoint('LEFT', frame, 'LEFT', 30, 0)
	frame.factText:SetPoint('RIGHT', frame, 'RIGHT', -30, 0)
	frame.factText:SetJustifyH('CENTER')
	frame.factText:SetJustifyV('TOP')
	frame.factText:SetWordWrap(true)
	frame.factText:SetTextColor(1, 1, 1, 1)
	frame.factText:SetText('')

	-- Close button in top right
	frame.closeButton = CreateFrame('Button', nil, frame)
	frame.closeButton:SetSize(20, 20)
	frame.closeButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -8, -8)
	frame.closeButton:SetNormalAtlas('runecarving-icon-reagent-empty-error')
	frame.closeButton:SetHighlightTexture('Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight')
	frame.closeButton:SetScript('OnClick', function()
		DeathScreen:Hide()
	end)

	-- Clickable timer/spinner button to skip to next fact
	frame.timerButton = CreateFrame('Button', nil, frame)
	frame.timerButton:SetPoint('BOTTOM', frame, 'BOTTOM', 0, 50)
	frame.timerButton:SetSize(150, 24)

	-- Timer text with spinner
	frame.timerText = frame.timerButton:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	frame.timerText:SetPoint('CENTER', frame.timerButton, 'CENTER', 8, 0)
	frame.timerText:SetTextColor(0.7, 0.7, 0.7, 1)
	frame.timerText:SetText('Next fact in 30s')

	-- Spinner animation texture
	frame.spinner = frame.timerButton:CreateTexture(nil, 'OVERLAY')
	frame.spinner:SetSize(16, 16)
	frame.spinner:SetPoint('RIGHT', frame.timerText, 'LEFT', -5, 0)
	frame.spinner:SetAtlas('UI-RefreshButton')

	-- Create rotation animation for spinner
	frame.spinnerAnim = frame.spinner:CreateAnimationGroup()
	local rotation = frame.spinnerAnim:CreateAnimation('Rotation')
	rotation:SetDegrees(-360)
	rotation:SetDuration(2)
	rotation:SetSmoothing('NONE')
	frame.spinnerAnim:SetLooping('REPEAT')

	-- Click to load next fact
	frame.timerButton:SetScript('OnClick', function()
		DeathScreen:UpdateFact()
		DeathScreen.timeRemaining = FunFact.DB.DeathScreen.rotationInterval
		DeathScreen:UpdateTimer()
	end)

	-- Highlight on hover
	frame.timerButton:SetScript('OnEnter', function()
		frame.timerText:SetTextColor(1, 1, 1, 1)
	end)

	frame.timerButton:SetScript('OnLeave', function()
		frame.timerText:SetTextColor(0.7, 0.7, 0.7, 1)
	end)

	-- Copy to Chat button
	frame.copyButton = CreateFrame('Button', nil, frame)
	frame.copyButton:SetSize(120, 28)
	frame.copyButton:SetPoint('BOTTOM', frame, 'BOTTOM', 0, 20)

	frame.copyButton:SetNormalAtlas('auctionhouse-nav-button')
	frame.copyButton:SetHighlightAtlas('auctionhouse-nav-button-highlight')
	frame.copyButton:SetPushedAtlas('auctionhouse-nav-button-select')

	local normalTexture = frame.copyButton:GetNormalTexture()
	if normalTexture then
		normalTexture:SetTexCoord(0, 1, 0, 0.7)
	end

	frame.copyButton.text = frame.copyButton:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	frame.copyButton.text:SetPoint('CENTER')
	frame.copyButton.text:SetText('Copy to Chat')
	frame.copyButton.text:SetTextColor(1, 1, 1, 1)

	frame.copyButton:SetScript('OnClick', function()
		DeathScreen:CopyToChat()
	end)

	-- Hint text for moving/resetting
	frame.hintText = frame:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
	frame.hintText:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -10, 5)
	frame.hintText:SetTextColor(0.5, 0.5, 0.5, 0.7)
	frame.hintText:SetText('Shift+Drag to move')

	self.frame = frame
end

---Updates the hint text based on whether the frame has been moved
function DeathScreen:UpdateHintText()
	if not self.frame or not self.frame.hintText then
		return
	end

	local pos = FunFact.DB.DeathScreen.position
	if pos and pos.moved then
		self.frame.hintText:SetText('Ctrl+Shift+Click to reset')
	else
		self.frame.hintText:SetText('Shift+Drag to move')
	end
end

---Copies the current fact to the chat edit box
function DeathScreen:CopyToChat()
	if not self.currentFact then
		return
	end

	local editBox = ChatFrame1EditBox
	if editBox then
		editBox:SetText(self.currentFact)
		editBox:Show()
		editBox:SetFocus()
		editBox:HighlightText()
	end
end

---Updates the displayed fact
function DeathScreen:UpdateFact()
	if not self.frame then
		return
	end

	local fact, category = self:GetFact()
	self.currentFact = fact
	self.currentCategory = category
	self.frame.factText:SetText(fact)
	self.frame.categoryText:SetText('FunFact from ' .. category)
	self.timeRemaining = FunFact.DB.DeathScreen.rotationInterval
end

---Updates the timer display
function DeathScreen:UpdateTimer()
	if not self.frame or not self.frame:IsShown() then
		return
	end

	if FunFact.DB.DeathScreen.showTimer then
		self.frame.timerText:Show()
		self.frame.spinner:Show()
		self.frame.timerText:SetText(string.format('Next fact in %ds', self.timeRemaining))
	else
		self.frame.timerText:Hide()
		self.frame.spinner:Hide()
	end
end

---Starts the fact rotation timer
function DeathScreen:StartTimer()
	self:StopTimer()

	self.timeRemaining = FunFact.DB.DeathScreen.rotationInterval

	-- Update timer every second
	self.ticker = C_Timer.NewTicker(1, function()
		self.timeRemaining = self.timeRemaining - 1
		self:UpdateTimer()

		if self.timeRemaining <= 0 then
			self:UpdateFact()
			self.timeRemaining = FunFact.DB.DeathScreen.rotationInterval
		end
	end)

	-- Start spinner animation
	if self.frame and self.frame.spinnerAnim then
		self.frame.spinnerAnim:Play()
	end
end

---Stops the fact rotation timer
function DeathScreen:StopTimer()
	if self.ticker then
		self.ticker:Cancel()
		self.ticker = nil
	end

	if self.frame and self.frame.spinnerAnim then
		self.frame.spinnerAnim:Stop()
	end
end

---Resets the frame position to default
function DeathScreen:ResetPosition()
	FunFact.DB.DeathScreen.position = {
		point = 'TOP',
		x = 0,
		y = -220,
		moved = false,
	}

	if self.frame then
		self.frame:ClearAllPoints()
		self.frame:SetPoint('TOP', UIParent, 'TOP', 0, -220)
	end

	self:UpdateHintText()

	if FunFact.logger then
		FunFact.logger.info('DeathScreen position reset to default')
	end
end

---Shows the death screen
---@param isTest boolean|nil Whether this is a test invocation
function DeathScreen:Show(isTest)
	if not FunFact.DB.DeathScreen.enabled then
		return
	end

	self.isTestMode = isTest or false

	if not self.frame then
		self:CreateFrame()
	end

	-- Restore saved position
	local pos = FunFact.DB.DeathScreen.position
	if pos and pos.point then
		self.frame:ClearAllPoints()
		self.frame:SetPoint(pos.point, UIParent, pos.point, pos.x or 0, pos.y or -220)
	end

	-- Update hint text based on moved state
	self:UpdateHintText()

	-- Set death message
	self.frame.deathMessage:SetText(self:GetDeathMessage())

	-- Get initial fact
	self:UpdateFact()
	self:UpdateTimer()

	-- Start rotation
	self:StartTimer()

	self.frame:Show()
end

---Hides the death screen
function DeathScreen:Hide()
	self:StopTimer()

	if self.frame then
		self.frame:Hide()
	end

	self.isTestMode = false
end

---Toggles the death screen (for test command)
function DeathScreen:Toggle()
	if self.frame and self.frame:IsShown() then
		self:Hide()
	else
		self:Show(true)
	end
end

---Initializes the death screen module
function DeathScreen:Initialize()
	-- Create the frame
	self:CreateFrame()

	-- Register for death events
	local eventFrame = CreateFrame('Frame')
	eventFrame:RegisterEvent('PLAYER_DEAD')
	eventFrame:RegisterEvent('PLAYER_ALIVE')
	eventFrame:RegisterEvent('PLAYER_UNGHOST')
	eventFrame:RegisterEvent('PLAYER_ENTERING_WORLD')

	eventFrame:SetScript('OnEvent', function(_, event)
		if event == 'PLAYER_DEAD' then
			-- Small delay to let the death UI appear first
			C_Timer.After(0.5, function()
				DeathScreen:Show(false)
			end)
		elseif event == 'PLAYER_ALIVE' or event == 'PLAYER_UNGHOST' then
			-- Don't hide if in test mode
			if not DeathScreen.isTestMode then
				DeathScreen:Hide()
			end
		elseif event == 'PLAYER_ENTERING_WORLD' then
			-- Check if player is dead on login/reload
			if UnitIsDeadOrGhost('player') then
				C_Timer.After(0.5, function()
					DeathScreen:Show(false)
				end)
			end
		end
	end)

	if FunFact.logger then
		FunFact.logger.info('DeathScreen module initialized')
	end
end
