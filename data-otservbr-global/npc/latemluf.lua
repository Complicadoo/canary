local internalNpcName = "Latem Luf"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 3

npcConfig.outfit = {
	lookType = 133, -- Roupa de Summoner (Masculino)
	lookHead = 79,  -- Amarelo Claro (Loiro)
	lookBody = 114, -- Preto
	lookLegs = 63,  -- Roxo
	lookFeet = 114, -- Preto
	lookAddons = 3, -- Addons completos (Capa e Frascos)
}

npcConfig.flags = {
	floorchange = false,
}


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval) npcHandler:onThink(npc, interval) end
npcType.onAppear = function(npc, creature) npcHandler:onAppear(npc, creature) end
npcType.onDisappear = function(npc, creature) npcHandler:onDisappear(npc, creature) end
npcType.onMove = function(npc, creature, fromPosition, toPosition) npcHandler:onMove(npc, creature, fromPosition, toPosition) end
npcType.onSay = function(npc, creature, type, message) npcHandler:onSay(npc, creature, type, message) end
npcType.onCloseChannel = function(npc, creature) npcHandler:onCloseChannel(npc, creature) end

npcHandler:setMessage(MESSAGE_GREET, "Ola, |PLAYERNAME|! Estou tentando criar uma nova pocao, transmutando chumbo em ouro... mas tambem posso fazer um {trade} contigo!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Use com sabedoria. Ate mais!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Vou transformar esse desgracado em pocao...")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Aqui esta meu estoque de pocoes GOSTOSAS.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "kooldown-aid", clientId = 36723, buy = 200000 },
	{ itemName = "strike enhancement", clientId = 36724, buy = 1000000 },
	{ itemName = "stamina extension", clientId = 36725, buy = 4000000 },
	{ itemName = "charm upgrade", clientId = 36726, buy = 500000 },
	{ itemName = "wealth duplex", clientId = 36727, buy = 1000000 },
	{ itemName = "bestiary betterment", clientId = 36728, buy = 500000 },
	{ itemName = "fire resilience", clientId = 36729, buy = 500000 },
	{ itemName = "ice resilience", clientId = 36730, buy = 500000 },
	{ itemName = "earth resilience", clientId = 36731, buy = 500000 },
	{ itemName = "energy resilience", clientId = 36732, buy = 500000 },
	{ itemName = "holy resilience", clientId = 36733, buy = 500000 },
	{ itemName = "death resilience", clientId = 36734, buy = 500000 },
	{ itemName = "physical resilience", clientId = 36735, buy = 2000000 },
	{ itemName = "fire amplification", clientId = 36736, buy = 500000 },
	{ itemName = "ice amplification", clientId = 36737, buy = 500000 },
	{ itemName = "earth amplification", clientId = 36738, buy = 500000 },
	{ itemName = "energy amplification", clientId = 36739, buy = 500000 },
	{ itemName = "holy amplification", clientId = 36740, buy = 2000000 },
	{ itemName = "death amplification", clientId = 36741, buy = 1000000 },
	{ itemName = "physical amplification", clientId = 36742, buy = 1500000 },
{ itemName = "great health potion", clientId = 239, buy = 225 },
			{ itemName = "great mana potion", clientId = 238, buy = 158 },
			{ itemName = "great spirit potion", clientId = 7642, buy = 254 },
			{ itemName = "health potion", clientId = 266, buy = 50 },
			{ itemName = "mana potion", clientId = 268, buy = 56 },
			{ itemName = "strong health potion", clientId = 236, buy = 115 },
			{ itemName = "strong mana potion", clientId = 237, buy = 108 },
			{ itemName = "supreme health potion", clientId = 23375, buy = 650 },
			{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
			{ itemName = "ultimate mana potion", clientId = 23373, buy = 488 },
			{ itemName = "ultimate spirit potion", clientId = 23374, buy = 488 },
			{ itemName = "empty potion flask", clientId = 283, sell = 5 },
			{ itemName = "empty potion flask", clientId = 284, sell = 5 },
			{ itemName = "empty potion flask", clientId = 285, sell = 5 },
			{ itemName = "vial", clientId = 2874, sell = 5 },
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
end

npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
