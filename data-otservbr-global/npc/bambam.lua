local internalNpcName = "Bambam"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 500
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1824, -- 
	lookHead = 114, --
	lookBody = 86,  -- 
	lookLegs = 86,  -- 
	lookFeet = 114, -- 
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "TAH SAINDO DA JAULA O MONSTRO!!" },
	{ text = "BOOOORA!! EH HORA DO SHOW PORRA... BIRLLL!!" },
	{ text = "Trapezio descendente eh o nome disso ai... eh ele... eh ele que nos vai buscar... ele ta olhando gente. FILHO DA PUTA, SAI FILHO DA PUTA!!!! EH 13 MEMO!!" },
	{ text = "UUUUAAAARRGH!!! AQUI EH BODYBUILDER PORRA... VAI SUBIR EM ARVORE EH CARAI PORRA, OH O HOMI ALI PO, EH 13 PORRA, SUBIR EM ARVORE... VOU DERRUBAR TUDO ESSAS ARVORE DO PARQUE IBIRAPUERA!! " },
}

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
end
npcHandler:setMessage(MESSAGE_GREET, "Frango |PLAYERNAME|, ta suave?. Se quiser uns produtinhos brabos, bora fazer um {trade}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Falou... caraca, saca meu biceps.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "AAAAARGHH... negativa!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Eita porra! Aqui nos constroi fibra, nao eh agua com musculo... olha os bagulho ai.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "500c exercise sword", clientId = 28552, buy = 347222, count = 500 },
	{ itemName = "500c exercise axe", clientId = 28553, buy = 347222, count = 500 },
	{ itemName = "500c exercise club", clientId = 28554, buy = 347222, count = 500 },
	{ itemName = "500c exercise bow", clientId = 28555, buy = 347222, count = 500 },
	{ itemName = "500c exercise wraps", clientId = 50293, buy = 347222, count = 500 },
	{ itemName = "500c exercise shield", clientId = 44065, buy = 347222, count = 500 },

	{ itemName = "1800c exercise sword", clientId = 35279, buy = 1250000, count = 1800 },
	{ itemName = "1800c exercise axe", clientId = 35280, buy = 1250000, count = 1800 },
	{ itemName = "1800c exercise club", clientId = 35281, buy = 1250000, count = 1800 },
	{ itemName = "1800c exercise bow", clientId = 35282, buy = 1250000, count = 1800 },
	{ itemName = "1800c exercise wraps", clientId = 50294, buy = 1250000, count = 1800 },
	{ itemName = "1800c exercise shield", clientId = 44066, buy = 1250000, count = 1800 },

	{ itemName = "14400c exercise sword", clientId = 35285, buy = 10000000, count = 14400 },
	{ itemName = "14400c exercise axe", clientId = 35286, buy = 10000000, count = 14400 },
	{ itemName = "14400c exercise club", clientId = 35287, buy = 10000000, count = 14400 },
	{ itemName = "14400c exercise bow", clientId = 35288, buy = 10000000, count = 14400 },
	{ itemName = "14400c exercise wraps", clientId = 50295, buy = 10000000, count = 14400 },
	{ itemName = "14400c exercise shield", clientId = 44067, buy = 10000000, count = 14400 },
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
