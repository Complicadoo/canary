local internalNpcName = "Frizzly Adams"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 144,
	lookHead = 105,
	lookBody = 75,
	lookLegs = 125,
	lookFeet = 38,
	lookAddons = 3,
}

npcConfig.flags = { floorchange = false }

-- =================================================================
-- LOJA
-- =================================================================
npcConfig.shop = {
	{ itemName = "podium of vigour", clientId = 38707, buy = 1000000, count = 1 },
}

-- =================================================================
-- BANCO DE DADOS: TASKS, RECOMPENSAS E RANKS
-- =================================================================
FrizzlyStorages = {
	Quest = 85000,
	Kills = 86000,
	RankGoblin = 87001,
	RankDragon = 87002,
	RankDragonLord = 87003,
	RankBehemoth = 87004,
	RankJuggernaut = 87005
}

FrizzlyTasks = {
-- RANK GOBLIN
	[1] = { killsRequired = 200, name = "crocodiles (50k xp/15k gold)", raceName = "Crocodiles", level = { 6, 49 }, creatures = { "crocodile" }, rewards = { { type = "exp", value = 50000 }, { type = "money", value = 13000 } } },
	[2] = { killsRequired = 100, name = "tarantulas (130k xp/7k gold)", raceName = "Tarantulas", level = { 6, 49 }, creatures = { "tarantula" }, rewards = { { type = "exp", value = 130000 }, { type = "money", value = 7000 } } },
	[3] = { killsRequired = 100, name = "mammoths (100k xp/12k gold)", raceName = "Mammoths", level = { 6, 49 }, creatures = { "mammoth" }, rewards = { { type = "exp", value = 100000 }, { type = "money", value = 10000 } } },

-- RANK DRAGON
	[4] = { killsRequired = 230, name = "mutated rats (200k xp/15k gold)", raceName = "Mutated Rats", level = { 50, 99 }, creatures = { "mutated rat" }, rewards = { { type = "exp", value = 200000 }, { type = "money", value = 15000 } } },
	[5] = { killsRequired = 180, name = "ancient scarabs (200k xp/20k gold)", raceName = "Ancient Scarabs", level = { 50, 99 }, creatures = { "ancient scarab" }, rewards = { { type = "exp", value = 200000 }, { type = "money", value = 20000 } } },
	[6] = { killsRequired = 125, name = "crystal spiders (400k xp/10k gold)", raceName = "Crystal Spiders", level = { 50, 99 }, creatures = { "crystal spider" }, rewards = { { type = "exp", value = 400000 }, { type = "money", value = 10000 } } },

-- RANK DRAGONLORD
	[7] = { killsRequired = 250, name = "giant spiders (2.5kk xp/25k gold)", raceName = "Giant Spiders", level = { 100, 199 }, creatures = { "giant spider" }, rewards = { { type = "exp", value = 2500000 }, { type = "money", value = 25000 } } },
	[8] = { killsRequired = 250, name = "hellspawns (1.5kk xp/5k gold)", raceName = "Hellspawns", level = { 100, 199 }, creatures = { "hellspawn" }, rewards = { { type = "exp", value = 1500000 }, { type = "money", value = 50000 } } },
	[9] = { killsRequired = 600, name = "high class lizards (4kk xp/10k gold)", raceName = "High Class Lizards", level = { 100, 199 }, creatures = { "lizard chosen", "lizard dragon priest", "lizard high guard", "lizard legionnaire", "lizard zaogun" }, rewards = { { type = "exp", value = 4000000 }, { type = "money", value = 10000 } } },

-- RANK BEHEMOTH
	[10] = { killsRequired = 700, name = "hydras (5kk xp/50k gold / 2 rb)", raceName = "Hydras", level = { 200, 499 }, creatures = { "hydra" }, rewards = { { type = "exp", value = 5000000 }, { type = "money", value = 50000 }, { type = "item", id = 12045, count = 2 } } },
	[11] = { killsRequired = 650, name = "serpent spawns (5kk xp/50k gold / 2 rb)", raceName = "Serpent Spawns", level = { 200, 499 }, creatures = { "serpent spawn" }, rewards = { { type = "exp", value = 5000000 }, { type = "money", value = 50000 },  { type = "item", id = 12045, count = 2 } } },
	[12] = { killsRequired = 600, name = "medusae (5kk xp/50k gold / 2 rb)", raceName = "Medusae", level = { 200, 499 }, creatures = { "medusa" }, rewards = { { type = "exp", value = 5000000 }, { type = "money", value = 50000 },  { type = "item", id = 12045, count = 2 } } },
	[13] = { killsRequired = 1200, name = "drakens (30kk xp/50k gold / 1 rb)", raceName = "Drakens", level = { 200, 499 }, creatures = { "draken abomination", "draken elite", "draken spellweaver", "draken warmaster" }, rewards = { { type = "exp", value = 30000000 }, { type = "money", value = 50000 },  { type = "item", id = 12045, count = 1 } } },
	[14] = { killsRequired = 400, name = "undead dragons easy (15kk xp/250k gold / 1 rb)", raceName = "Undead Dragons easy", level = { 200, 499 }, creatures = { "undead dragon" }, rewards = { { type = "exp", value = 18000000 }, { type = "money", value = 250000 },  { type = "item", id = 12045, count = 2 } } },

-- RANK JUGGERNAUT
	[15] = { killsRequired = 1200, name = "undead dragons normal", raceName = "Undead Dragons normal", level = { 500, 999 }, creatures = { "undead dragon" }, rewards = { { type = "exp", value = 50000000 }, { type = "item", id = 22723, count = 4 } } },
	[16] = { killsRequired = 700, name = "hellflayers easy", raceName = "Hellflayers easy", level = { 500, 999 }, creatures = { "hellflayer" }, rewards = { { type = "exp", value = 40000000 }, { type = "item", id = 22723, count = 2 } } },
	[17] = { killsRequired = 1000, name = "vexclaws easy", raceName = "Vexclaws easy", level = { 500, 999 }, creatures = { "vexclaw" }, rewards = { { type = "exp", value = 30000000 }, { type = "item", id = 22723, count = 2 } } },
	[18] = { killsRequired = 700, name = "demons easy", raceName = "Demons easy", level = { 500, 999 }, creatures = { "demon" }, rewards = { { type = "exp", value = 30000000 }, { type = "item", id = 22723, count = 2 } } },
	[19] = { killsRequired = 1000, name = "grimeleeches easy", raceName = "Grimeleeches easy", level = { 500, 999 }, creatures = { "grimeleech" }, rewards = { { type = "exp", value = 40000000 }, { type = "item", id = 22723, count = 2 } } },
	[20] = { killsRequired = 900, name = "bashmus", raceName = "Bashmus", level = { 500, 999 }, creatures = { "bashmu" }, rewards = { { type = "exp", value = 50000000 }, { type = "item", id = 22723, count = 2 } } },
	[21] = { killsRequired = 1100, name = "midnight asuras", raceName = "Midnight Asuras", level = { 500, 999 }, creatures = { "midnight asura" }, rewards = { { type = "exp", value = 70000000 }, { type = "item", id = 22723, count = 1 } } },
	[22] = { killsRequired = 1100, name = "dawnfire asuras", raceName = "Dawnfire Asuras", level = { 500, 999 }, creatures = { "dawnfire asura" }, rewards = { { type = "exp", value = 70000000 }, { type = "item", id = 22723, count = 1 } } },
	[23] = { killsRequired = 500, name = "juggernaut", raceName = "Juggernaut", level = { 500, 999 }, creatures = { "juggernaut" }, rewards = { { type = "exp", value = 70000000 }, { type = "item", id = 22723, count = 3 } } },
}

-- =================================================================
-- FUNCOES DO NPC E DIALOGO
-- =================================================================
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval) npcHandler:onThink(npc, interval) end
npcType.onAppear = function(npc, creature) npcHandler:onAppear(npc, creature) end
npcType.onDisappear = function(npc, creature) npcHandler:onDisappear(npc, creature) end
npcType.onMove = function(npc, creature, fromPosition, toPosition) npcHandler:onMove(npc, creature, fromPosition, toPosition) end
npcType.onSay = function(npc, creature, type, message) npcHandler:onSay(npc, creature, type, message) end
npcType.onCloseChannel = function(npc, creature) npcHandler:onCloseChannel(npc, creature) end

local choose = {}
local cancel = {}

local function getAvailableTasks(player)
	local available = {}
	local pLevel = player:getLevel()
	for k, v in pairs(FrizzlyTasks) do
		if pLevel >= v.level[1] and pLevel <= v.level[2] then
			table.insert(available, {id = k, name = v.name})
		end
	end
	return available
end

local function getTaskByName(name)
	for k, v in pairs(FrizzlyTasks) do
		if v.name:lower() == name:lower() or v.raceName:lower() == name:lower() then
			return k
		end
	end
	return false
end

local function getPlayerStartedTasks(player)
	local tmp = {}
	for k, v in ipairs(FrizzlyTasks) do
		if player:getStorageValue(FrizzlyStorages.Quest + k) == 1 then
			table.insert(tmp, k)
		end
	end
	return tmp
end

local function getTaskRankStorage(minLevel)
	if minLevel == 6 then return FrizzlyStorages.RankGoblin
	elseif minLevel == 50 then return FrizzlyStorages.RankDragon
	elseif minLevel == 100 then return FrizzlyStorages.RankDragonLord
	elseif minLevel == 200 then return FrizzlyStorages.RankBehemoth
	elseif minLevel == 600 then return FrizzlyStorages.RankJuggernaut
	end
	return nil
end

keywordHandler:addKeyword({ "podium of vigour" }, StdModule.say, { npcHandler = npcHandler, text = "O podium of vigour eh um local para exibir seus trofeus dentro de sua {house}." })
keywordHandler:addKeyword({ "house" }, StdModule.say, { npcHandler = npcHandler, text = "House eh 'casa' em ingles, dumbass." })
keywordHandler:addKeyword({ "reward boxes" }, StdModule.say, { npcHandler = npcHandler, text = "A reward box fornece um item {aleatorio}... na verdade eu nao lembro mais o que coloquei em cada uma, ta uma bagunca aqui e minha memoria eh uma merda." })
keywordHandler:addKeyword({ "aleatorio" }, StdModule.say, { npcHandler = npcHandler, text = "Sim, voce recebera armaduras e armas gerais de forca baixa, porem uteis... pra falar a verdade, acho que coloquei basicamente pocoes naquelas caixas." })


local function greetCallback(npc, creature)
	local player = Player(creature)
	if not player then return false end
	
	local playerId = player:getId()
	npcHandler:setTopic(playerId, 0)
	choose[playerId] = nil
	cancel[playerId] = nil

	npc:setDirection(npc:getPosition():getDirectionTo(creature:getPosition()))
	npcHandler:setMessage(MESSAGE_GREET, "E ai, |PLAYERNAME|! Eu tenho {tasks} de caca para voce, as recompensas podem ser: experiencia, gold e {reward boxes}. Pode me entregar um {report}, checar o {status}, ver o seu {rank} ou {cancelar} alguma task. Tambem vendo {podium of vigour}!!")
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
	if not npcHandler:checkInteraction(npc, creature) then return false end
	
	local msgLower = message:lower()
	local function checkMessage(msg, keyword)
		return msg:find(keyword) ~= nil
	end

	if checkMessage(msgLower, "report") or checkMessage(msgLower, "entregar") then
		local started = getPlayerStartedTasks(player)
		local finished = 0

		if started and #started > 0 then
			for _, id in ipairs(started) do
				local task = FrizzlyTasks[id]
				local kills = math.max(0, player:getStorageValue(FrizzlyStorages.Kills + id))
				
				if kills >= task.killsRequired then
					finished = finished + 1
					
					if task.rewards then
						for _, reward in ipairs(task.rewards) do
							if reward.type == "exp" then
								player:addExperience(reward.value, true)
							elseif reward.type == "money" then
								player:addMoney(reward.value)
							elseif reward.type == "item" then
								player:addItem(reward.id, reward.count)
							end
						end
					end
					
					local rankStorage = getTaskRankStorage(task.level[1])
					if rankStorage then
						local currentRankPoints = math.max(0, player:getStorageValue(rankStorage))
						player:setStorageValue(rankStorage, currentRankPoints + 1)
					end

					player:setStorageValue(FrizzlyStorages.Quest + id, 0)
					player:setStorageValue(FrizzlyStorages.Kills + id, 0)
				end
			end
		end

		if finished > 0 then
			npcHandler:say("Trabalho formidavel! Voce concluiu " .. finished .. " task(s) e recebeu suas recompensas. Peca uma nova {task} se tiver coragem ou cheque o seu {rank}.", npc, creature)
		else
			npcHandler:say("Voce nao terminou nenhuma task ainda. Continue cacando ou diga {status} para checar.", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)

	elseif checkMessage(msgLower, "rank") then
		local gob = math.max(0, player:getStorageValue(FrizzlyStorages.RankGoblin))
		local dra = math.max(0, player:getStorageValue(FrizzlyStorages.RankDragon))
		local dl = math.max(0, player:getStorageValue(FrizzlyStorages.RankDragonLord))
		local beh = math.max(0, player:getStorageValue(FrizzlyStorages.RankBehemoth))
		local jug = math.max(0, player:getStorageValue(FrizzlyStorages.RankJuggernaut))

		local rankMsg = "Aqui esta o seu relatorio de servico:\n"
		rankMsg = rankMsg .. "- Rank Goblin (Nv 6-49): " .. gob .. " tasks completas.\n"
		rankMsg = rankMsg .. "- Rank Dragon (Nv 50-99): " .. dra .. " tasks completas.\n"
		rankMsg = rankMsg .. "- Rank Dragon Lord (Nv 100-199): " .. dl .. " tasks completas.\n"
		rankMsg = rankMsg .. "- Rank Behemoth (Nv 200-499): " .. beh .. " tasks completas.\n"
		rankMsg = rankMsg .. "- Rank Juggernaut (Nv 500-999): " .. jug .. " tasks completas.\n"
		rankMsg = rankMsg .. "- Rank  (Nv 600-999): " .. jug .. " tasks completas."
		
		npcHandler:say(rankMsg, npc, creature)
		npcHandler:setTopic(playerId, 0)

	elseif checkMessage(msgLower, "task") then
		local available = getAvailableTasks(player)
		if #available > 0 then
			local txt = "Para o seu level, voce pode cacar: "
			for i, t in ipairs(available) do
				txt = txt .. "{" .. t.name .. "}" .. (i < #available and ", " or ".")
			end
			npcHandler:say(txt .. " Qual voce quer iniciar?", npc, creature)
			npcHandler:setTopic(playerId, 1)
		else
			npcHandler:say("Desculpe, nao tenho tarefas para o seu level atual.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end

	elseif npcHandler:getTopic(playerId) == 1 then
		local taskID = getTaskByName(msgLower)
		if taskID then
			local task = FrizzlyTasks[taskID]
			if player:getLevel() >= task.level[1] and player:getLevel() <= task.level[2] then
				if player:getStorageValue(FrizzlyStorages.Quest + taskID) > 0 then
					npcHandler:say("Voce ja esta com esta task ativa no momento! Va termina-la ou diga {cancelar}.", npc, creature)
					npcHandler:setTopic(playerId, 0)
				else
					npcHandler:say("Nesta missao voce precisa derrotar " .. task.killsRequired .. " " .. task.raceName .. ". Tem certeza que quer comecar? {yes}", npc, creature)
					choose[playerId] = taskID
					npcHandler:setTopic(playerId, 2)
				end
			else
				npcHandler:say("Essa task nao e apropriada para o seu level. Fale {task} para ver sua lista.", npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		else
			npcHandler:say("Nao reconheco esse monstro. Escolha e diga uma das opcoes exatas da lista.", npc, creature)
		end

	elseif checkMessage(msgLower, "yes") and npcHandler:getTopic(playerId) == 2 then
		local id = choose[playerId]
		if id then
			player:setStorageValue(FrizzlyStorages.Quest + id, 1)
			player:setStorageValue(FrizzlyStorages.Kills + id, 0)
			npcHandler:say("Feito! Boa caca! Quando terminar os " .. FrizzlyTasks[id].raceName .. ", volte aqui e diga {report}. Voce tambem pode solicitar mais {tasks}, se achar que tens o que eh necessario!", npc, creature)
		end
		choose[playerId] = nil
		npcHandler:setTopic(playerId, 0)

	elseif checkMessage(msgLower, "status") then
		local started = getPlayerStartedTasks(player)
		if started and #started > 0 then
			local text = "Seu progresso atual:\n"
			for _, id in ipairs(started) do
				local kills = math.max(0, player:getStorageValue(FrizzlyStorages.Kills + id))
				text = text .. "- " .. FrizzlyTasks[id].raceName .. ": " .. kills .. "/" .. FrizzlyTasks[id].killsRequired .. " abates.\n"
			end
			npcHandler:say(text, npc, creature)
		else
			npcHandler:say("Voce nao esta fazendo nenhuma missao no momento.", npc, creature)
		end

	elseif checkMessage(msgLower, "cancelar") or checkMessage(msgLower, "cancel") then
		local started = getPlayerStartedTasks(player)
		if started and #started > 0 then
			local txt = "Qual task voce quer desistir e zerar o progresso? "
			for i, id in ipairs(started) do
				txt = txt .. "{" .. FrizzlyTasks[id].name .. "}" .. (i < #started and ", " or "?")
			end
			npcHandler:say(txt, npc, creature)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say("Voce nao esta fazendo nenhuma missao para poder cancelar.", npc, creature)
		end

	elseif npcHandler:getTopic(playerId) == 3 then
		local taskID = getTaskByName(msgLower)
		if taskID and player:getStorageValue(FrizzlyStorages.Quest + taskID) == 1 then
			npcHandler:say("Isso vai zerar totalmente a sua contagem de " .. FrizzlyTasks[taskID].raceName .. ". Tem certeza? {yes}", npc, creature)
			cancel[playerId] = taskID
			npcHandler:setTopic(playerId, 4)
		else
			npcHandler:say("Diga o nome exato de uma das tasks ativas que voce tem para cancelar.", npc, creature)
		end

	elseif checkMessage(msgLower, "yes") and npcHandler:getTopic(playerId) == 4 then
		local id = cancel[playerId]
		if id then
			player:setStorageValue(FrizzlyStorages.Quest + id, 0)
			player:setStorageValue(FrizzlyStorages.Kills + id, 0)
			npcHandler:say("Task cancelada e zerada. Peca uma nova {task} quando quiser.", npc, creature)
		end
		cancel[playerId] = nil
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Boa cagada!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Eh falta de uma boa cagada...")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)

-- =================================================================
-- SISTEMA DE MORTES (CREATURE EVENT - 100% SEGURO)
-- =================================================================
local function isTargetInList(targetName, creatureList)
	for _, name in ipairs(creatureList) do
		if name:lower() == targetName then return true end
	end
	return false
end

-- 1. Cria o evento de Kill nativo
local frizzlyKill = CreatureEvent("FrizzlyTasksKill")

function frizzlyKill.onKill(player, creature)
	if not creature:isMonster() or creature:getMaster() then return true end
	
	local targetName = creature:getName():lower()
	
	for id, task in pairs(FrizzlyTasks) do
		if player:getStorageValue(FrizzlyStorages.Quest + id) == 1 then
			if isTargetInList(targetName, task.creatures) then
				local currentKills = math.max(0, player:getStorageValue(FrizzlyStorages.Kills + id))
				
				if currentKills < task.killsRequired then
					player:setStorageValue(FrizzlyStorages.Kills + id, currentKills + 1)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Frizzly Task: " .. (currentKills + 1) .. "/" .. task.killsRequired .. " " .. task.raceName .. " abatidos.")
				end
			end
		end
	end
	return true
end
frizzlyKill:register()

-- 2. Registra o evento de Kill no personagem toda vez que ele loga
local frizzlyLogin = CreatureEvent("FrizzlyTasksLogin")

function frizzlyLogin.onLogin(player)
	player:registerEvent("FrizzlyTasksKill")
	return true
end
frizzlyLogin:register()
