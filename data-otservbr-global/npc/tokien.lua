local internalNpcName = "Tokien"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130, -- Roupa de Mage (Masculino)
	lookHead = 57,  -- Cinza
	lookBody = 115, -- Marrom
	lookLegs = 114, -- Marrom
	lookFeet = 116, -- Marrom Escuro
	lookAddons = 3, -- Addons completos (Chapeu e Varinha)
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 30,
	{ text = "Cade a porcaria do meu cachimbo?" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval) npcHandler:onThink(npc, interval) end
npcType.onAppear = function(npc, creature) npcHandler:onAppear(npc, creature) end
npcType.onDisappear = function(npc, creature) npcHandler:onDisappear(npc, creature) end
npcType.onMove = function(npc, creature, fromPosition, toPosition) npcHandler:onMove(npc, creature, fromPosition, toPosition) end
npcType.onSay = function(npc, creature, type, message) npcHandler:onSay(npc, creature, type, message) end
npcType.onCloseChannel = function(npc, creature) npcHandler:onCloseChannel(npc, creature) end

npcHandler:setMessage(MESSAGE_GREET, "Saudacoes, |PLAYERNAME|! Quer fazer um {trade} em alguns Platinum Tokens com seu ouro?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Ate logo! Volte com mais ouro.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Que cuzao...")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Cada token esta custando 1 milhao de pecas de ouro... foda essa inflacao, ne?! Ta ruim pra todo mundo!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- AQUI ESTAVA O ERRO: Faltava fechar a chave do shop e colocar as funções finais
npcConfig.shop = {
	{ itemName = "platinum token", clientId = 22723, buy = 1000000 },
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
end

npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
