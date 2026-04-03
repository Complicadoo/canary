local internalNpcName = "Imbuementeira"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 4000
npcConfig.walkRadius = 1

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 1,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Lugar apertado do diacho!" },
	{ text = "Que saudade daquele veio brocha..." },
}

local playerImbuementData = {}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
	playerImbuementData[creature:getId()] = nil
end

-- Transformada em local para evitar conflito global no servidor
local function addItemsToShoppingBag(npc, player)
	local playerId = player:getId()
	local playerData = playerImbuementData[playerId]

	if playerData then
		local moneyRequired = playerData.moneyRequired
		local itemList = playerData.itemList
		if player:getMoney() + player:getBankBalance() < moneyRequired then
			npcHandler:say("Sem grana nao vai rolar, nem relogio trabalha de graça...", npc, player)
			npcHandler:setTopic(player:getId(), 0)
			return false, "Sem grana nao vai rolar, nem relogio trabalha de graça..."
		end

		local totalWeight = 0
		for _, item in pairs(itemList) do
			local itemType = ItemType(item.itemId)
			totalWeight = totalWeight + (itemType:getWeight() * item.count)
		end

		if player:getFreeCapacity() < totalWeight then
			return false, "Tu eh fraco demais pra carregar isso."
		end

		if player:getFreeBackpackSlots() == 0 then
			return false, "Sua mochila ta lotada, demente."
		end

		local shoppingBag = player:addItem(2856, 1) -- present box
		for _, item in pairs(itemList) do
			shoppingBag:addItem(item.itemId, item.count)
		end

		player:removeMoneyBank(moneyRequired)

		return true
	end

	return false
end

-- Tabela atualizada com a matemática exata baseada na loja
local imbuementPackagesData = {
	["bash"] = { text = "skill club", moneyRequired = 1500000, itemList = { { itemId = 9657, count = 20 }, { itemId = 22189, count = 15 }, { itemId = 10405, count = 10 } } },
	["blockade"] = { text = "skill shield", moneyRequired = 1500025, itemList = { { itemId = 9641, count = 20 }, { itemId = 11703, count = 25 }, { itemId = 20199, count = 25 } } },
	["chop"] = { text = "skill axe", moneyRequired = 1500030, itemList = { { itemId = 10196, count = 20 }, { itemId = 11447, count = 25 }, { itemId = 21200, count = 20 } } },
	["epiphany"] = { text = "magic level", moneyRequired = 1500045, itemList = { { itemId = 9635, count = 25 }, { itemId = 11452, count = 15 }, { itemId = 10309, count = 15 } } },
	["precision"] = { text = "skill distance", moneyRequired = 1500040, itemList = { { itemId = 11464, count = 25 }, { itemId = 18994, count = 20 }, { itemId = 10298, count = 10 } } },
	["slash"] = { text = "skill sword", moneyRequired = 1500020, itemList = { { itemId = 9691, count = 25 }, { itemId = 21202, count = 25 }, { itemId = 9654, count = 5 } } },
	["featherweight"] = { text = "capacity increase", moneyRequired = 345000, itemList = { { itemId = 25694, count = 20 }, { itemId = 25702, count = 10 }, { itemId = 20205, count = 5 } } },
	["strike"] = { text = "critical", moneyRequired = 550000, itemList = { { itemId = 11444, count = 20 }, { itemId = 10311, count = 25 }, { itemId = 22728, count = 5 } } },
	["swiftness"] = { text = "speed", moneyRequired = 347500, itemList = { { itemId = 17458, count = 15 }, { itemId = 10302, count = 25 }, { itemId = 14081, count = 20 } } },
	["vampirism"] = { text = "life leech", moneyRequired = 645000, itemList = { { itemId = 9685, count = 25 }, { itemId = 9633, count = 15 }, { itemId = 9663, count = 5 } } },
	["vibrancy"] = { text = "paralysis removal", moneyRequired = 350000, itemList = { { itemId = 22053, count = 20 }, { itemId = 23507, count = 15 }, { itemId = 28567, count = 5 } } },
	["void"] = { text = "mana leech", moneyRequired = 510000, itemList = { { itemId = 11492, count = 25 }, { itemId = 20200, count = 25 }, { itemId = 22730, count = 5 } } },
	["electrify"] = { text = "energy damage", moneyRequired = 1500018, itemList = { { itemId = 18993, count = 25 }, { itemId = 21975, count = 5 }, { itemId = 23508, count = 1 } } },
	["frost"] = { text = "ice damage", moneyRequired = 1500005, itemList = { { itemId = 9661, count = 25 }, { itemId = 21801, count = 10 }, { itemId = 9650, count = 5 } } },
	["reap"] = { text = "death damage", moneyRequired = 1500030, itemList = { { itemId = 11484, count = 25 }, { itemId = 9647, count = 20 }, { itemId = 10420, count = 5 } } },
	["scorch"] = { text = "fire damage", moneyRequired = 1500030, itemList = { { itemId = 9636, count = 25 }, { itemId = 5920, count = 5 }, { itemId = 5954, count = 5 } } },
	["venom"] = { text = "earth damage", moneyRequired = 1500018, itemList = { { itemId = 9686, count = 25 }, { itemId = 9640, count = 20 }, { itemId = 21194, count = 2 } } },
	["cloud fabric"] = { text = "energy protection", moneyRequired = 1500020, itemList = { { itemId = 9644, count = 20 }, { itemId = 14079, count = 15 }, { itemId = 9665, count = 10 } } },
	["demon presence"] = { text = "holy protection", moneyRequired = 1500045, itemList = { { itemId = 9639, count = 25 }, { itemId = 9638, count = 25 }, { itemId = 10304, count = 20 } } },
	["dragon hide"] = { text = "fire protection", moneyRequired = 1500005, itemList = { { itemId = 5877, count = 20 }, { itemId = 16131, count = 10 }, { itemId = 11658, count = 5 } } },
	["lich shroud"] = { text = "death protection", moneyRequired = 1500030, itemList = { { itemId = 11466, count = 25 }, { itemId = 22007, count = 20 }, { itemId = 9660, count = 5 } } },
	["quara scale"] = { text = "ice protection", moneyRequired = 1500025, itemList = { { itemId = 10295, count = 25 }, { itemId = 10307, count = 15 }, { itemId = 14012, count = 10 } } },
	["snake skin"] = { text = "earth protection", moneyRequired = 1500020, itemList = { { itemId = 17823, count = 25 }, { itemId = 9694, count = 20 }, { itemId = 11702, count = 10 } } },
}

local function purchaseItems(npc, player, message)
	local packageData = imbuementPackagesData[message]
	if packageData and npcHandler:getTopic(player:getId()) == 1 then
		npcHandler:say("Voce quer comprar os itens do " .. packageData.text .. " imbuiment por " .. packageData.moneyRequired .. " gold coins, {yes}?", npc, player)
		npcHandler:setTopic(player:getId(), 2)
		playerImbuementData[player:getId()] = {
			moneyRequired = packageData.moneyRequired,
			itemList = packageData.itemList,
		}
	end
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local msgLower = message:lower() -- Padroniza a mensagem para minúsculo
	
	local imbuementPackages = 
    "Sao esses ai oh:\n"..
	"Skill: {bash}, {blockade}, {chop}, {epiphany}, {precision}, {slash}\n"..
    "Dano elemental: {electrify}, {frost}, {reap}, {scorch}, {venom}\n"..
	"Protecao elemental:{cloud fabric}, {demon presence}, {dragon hide}, {lich shroud}, {quara scale}, {snake skin}\n"..
	"Suporte: {featherweight}, {strike}, {swiftness}, {vampirism}, {vibrancy}, {void}"
    


	if MsgContains(msgLower, "imbuement packages") then
		npcHandler:setTopic(playerId, 1)
		npcHandler:say(imbuementPackages, npc, creature)
	elseif imbuementPackagesData[msgLower] then
		purchaseItems(npc, player, msgLower)
	elseif npcHandler:getTopic(playerId) == 2 then
		if MsgContains(msgLower, "yes") then
			local success, responseMessage = addItemsToShoppingBag(npc, player)
			if not success then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, responseMessage)
				npcHandler:setTopic(playerId, 1)
				npcHandler:say(imbuementPackages, npc, player)
				return true
			end

			playerImbuementData[playerId] = nil
			npcHandler:say("Pronto, tá na mão.", npc, player)
			npcHandler:setTopic(playerId, 1)
			npcHandler:say(imbuementPackages, npc, creature)
		elseif MsgContains(msgLower, "no") then
			playerImbuementData[playerId] = nil
			npcHandler:setTopic(playerId, 1)
			npcHandler:say("Beleza, desiste mesmo. Quer ver a lista de pacotes de novo?", npc, creature)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|, se quiser {imbuement packages} ou fazer um {trade}, eh so falar...")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Vagabunda de merda... saiu andando igual uma rapariga...")
npcHandler:setMessage(MESSAGE_TRADE, "Da uma olhada por ai...")
npcHandler:setMessage(MESSAGE_FAREWELL, "Brigado...")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- Shop atualizado com valores escalados para bater exatamente com o 1.5kk exigido
npcConfig.shop = {
	{ itemName = "battle stone", clientId = 11447, buy = 33334 },
	{ itemName = "blazing bone", clientId = 16131, buy = 84332 },
	{ itemName = "bloody pincers", clientId = 9633, buy = 14000 },
	{ itemName = "brimstone fangs", clientId = 11702, buy = 45419 },
	{ itemName = "brimstone shell", clientId = 11703, buy = 19505 },
	{ itemName = "broken shamanic staff", clientId = 11452, buy = 4930 },
	{ itemName = "compass", clientId = 10302, buy = 2000 },
	{ itemName = "crawler head plating", clientId = 14079, buy = 25302 },
	{ itemName = "crystallized anger", clientId = 23507, buy = 2000 },
	{ itemName = "cultish mask", clientId = 9638, buy = 20741 },
	{ itemName = "cultish robe", clientId = 9639, buy = 11112 },
	{ itemName = "cyclops toe", clientId = 9657, buy = 13200 },
	{ itemName = "damselfly wing", clientId = 17458, buy = 500 },
	{ itemName = "deepling warts", clientId = 14012, buy = 59341 },
	{ itemName = "demon horn", clientId = 5954, buy = 100841 },
	{ itemName = "demonic skeletal hand", clientId = 9647, buy = 34533 },
	{ itemName = "draken sulphur", clientId = 11658, buy = 76037 },
	{ itemName = "elven hoof", clientId = 18994, buy = 25556 },
	{ itemName = "elven scouting glass", clientId = 11464, buy = 11112 },
	{ itemName = "elvish talisman", clientId = 9635, buy = 6339 },
	{ itemName = "energy vein", clientId = 23508, buy = 107428 },
	{ itemName = "fairy wings", clientId = 25694, buy = 2000 },
	{ itemName = "fiery heart", clientId = 9636, buy = 37816 },
	{ itemName = "flask of embalming fluid", clientId = 11466, buy = 7965 },
	{ itemName = "frazzle skin", clientId = 20199, buy = 37152 },
	{ itemName = "frosty heart", clientId = 9661, buy = 43077 },
	{ itemName = "gloom wolf fur", clientId = 22007, buy = 18585 },
	{ itemName = "goosebump leather", clientId = 20205, buy = 5000 },
	{ itemName = "green dragon leather", clientId = 5877, buy = 13825 },
	{ itemName = "green dragon scale", clientId = 5920, buy = 10085 },
	{ itemName = "hellspawn tail", clientId = 10304, buy = 35186 },
	{ itemName = "lion's mane", clientId = 9691, buy = 13741 },
	{ itemName = "little bowl of myrrh", clientId = 25702, buy = 3000 },
	{ itemName = "metal spike", clientId = 10298, buy = 71112 },
	{ itemName = "mooh'tah shell", clientId = 21202, buy = 25191 },
	{ itemName = "moohtant horn", clientId = 21200, buy = 16092 },
	{ itemName = "mystical hourglass", clientId = 9660, buy = 185841 },
	{ itemName = "ogre nose ring", clientId = 22189, buy = 50400 },
	{ itemName = "orc tooth", clientId = 10196, buy = 17242 },
	{ itemName = "peacock feather fan", clientId = 21975, buy = 139258 },
	{ itemName = "petrified scream", clientId = 10420, buy = 107914 },
	{ itemName = "piece of dead brain", clientId = 9663, buy = 25000 },
	{ itemName = "piece of scarab shell", clientId = 9641, buy = 4180 },
	{ itemName = "piece of swampling wood", clientId = 17823, buy = 3586 },
	{ itemName = "pile of grave earth", clientId = 11484, buy = 10792 },
	{ itemName = "poisonous slime", clientId = 9640, buy = 41209 },
	{ itemName = "polar bear paw", clientId = 9650, buy = 4616 },
	{ itemName = "protective charm", clientId = 15000, buy = 2000 },
	{ itemName = "quill", clientId = 28567, buy = 2000 },
	{ itemName = "rope belt", clientId = 11492, buy = 5000 },
	{ itemName = "rorc feather", clientId = 18993, buy = 27852 },
	{ itemName = "sabretooth", clientId = 10311, buy = 10000 },
	{ itemName = "seacrest hair", clientId = 21801, buy = 40000 },
	{ itemName = "silencer claws", clientId = 20200, buy = 5000 },
	{ itemName = "slime heart", clientId = 21194, buy = 131869 },
	{ itemName = "snake skin", clientId = 9694, buy = 47809 },
	{ itemName = "some grimeleech wings", clientId = 22730, buy = 2000 },
	{ itemName = "strand of medusa hair", clientId = 10309, buy = 84508 },
	{ itemName = "swamp grass", clientId = 9686, buy = 16484 },
	{ itemName = "thick fur", clientId = 10307, buy = 49451 },
	{ itemName = "vampire teeth", clientId = 9685, buy = 2400 },
	{ itemName = "vexclaw talon", clientId = 22728, buy = 2000 },
	{ itemName = "war crystal", clientId = 9654, buy = 105344 },
	{ itemName = "warmaster's wristguards", clientId = 10405, buy = 48000 },
	{ itemName = "waspoid wing", clientId = 14081, buy = 2000 },
	{ itemName = "wereboar hooves", clientId = 22053, buy = 3000 },
	{ itemName = "winter wolf fur", clientId = 10295, buy = 6594 },
	{ itemName = "wyrm scale", clientId = 9665, buy = 48193 },
	{ itemName = "wyvern talisman", clientId = 9644, buy = 31928 }
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
