local FrizzlyStorages = { Quest = 85000, Kills = 86000 }

local FrizzlyTasks = {
	[1] = { killsRequired = 150, raceName = "Crocodiles", creatures = { "crocodile" } },
	[2] = { killsRequired = 100, raceName = "Tarantulas", creatures = { "tarantula" } },
	[3] = { killsRequired = 125, raceName = "Mammoths", creatures = { "mammoth" } },
	[4] = { killsRequired = 250, raceName = "Mutated Rats", creatures = { "mutated rat" } },
	[5] = { killsRequired = 200, raceName = "Ancient Scarabs", creatures = { "ancient scarab" } },
	[6] = { killsRequired = 150, raceName = "Crystal Spiders", creatures = { "crystal spider" } },
	[7] = { killsRequired = 200, raceName = "Giant Spiders", creatures = { "giant spider" } },
	[8] = { killsRequired = 250, raceName = "Hellspawns", creatures = { "hellspawn" } },
	[9] = { killsRequired = 400, raceName = "High Class Lizards", creatures = { "lizard chosen", "lizard dragon priest", "lizard high guard", "lizard legionnaire", "lizard zaogun" } },
	[10] = { killsRequired = 700, raceName = "Hydras", creatures = { "hydra" } },
	[11] = { killsRequired = 600, raceName = "Serpent Spawns", creatures = { "serpent spawn" } },
	[12] = { killsRequired = 500, raceName = "Medusae", creatures = { "medusa" } },
	[13] = { killsRequired = 1200, raceName = "Drakens", creatures = { "draken abomination", "draken elite", "draken spellweaver", "draken warmaster" } },
	[14] = { killsRequired = 300, raceName = "Undead Dragons (easy)", creatures = { "undead dragon" } },
	[15] = { killsRequired = 800, raceName = "Undead Dragons (normal)", creatures = { "undead dragon" } },
	[16] = { killsRequired = 700, raceName = "Hellflayers", creatures = { "hellflayer" } },
	[17] = { killsRequired = 1000, raceName = "Vexclaws", creatures = { "vexclaw" } },
	[18] = { killsRequired = 700, raceName = "Demons", creatures = { "demon" } },
	[19] = { killsRequired = 1000, raceName = "Grimeleeches", creatures = { "grimeleech" } },
	[20] = { killsRequired = 900, raceName = "Bashmus", creatures = { "bashmu" } },
	[21] = { killsRequired = 1100, raceName = "Midnight Asuras", creatures = { "midnight asura" } },
	[22] = { killsRequired = 1100, raceName = "Dawnfire Asuras", creatures = { "dawnfire asura" } }
}

-- =======================================================
-- EVENTO DE MORTE (CREATURESCRIPTS)
-- =======================================================
local taskKillEvent = CreatureEvent("FrizzlyTaskKill")

function taskKillEvent.onKill(player, target)
	-- Ignora se não for monstro ou se for um summon morrendo
	if not target:isMonster() or target:getMaster() then return true end

	local targetName = target:getName():lower()
	local playersToReward = {}
	local party = player:getParty()

	-- Lógica da Party: Adiciona todo mundo da PT que estiver a até 15 sqm do bicho morto
	if party then
		local leader = party:getLeader()
		if leader and leader:getPosition():getDistance(target:getPosition()) <= 15 then
			table.insert(playersToReward, leader)
		end
		
		for _, member in ipairs(party:getMembers()) do
			if member:getPosition():getDistance(target:getPosition()) <= 15 then
				table.insert(playersToReward, member)
			end
		end
	else
		-- Se não estiver em party, conta só pro killer
		table.insert(playersToReward, player)
	end

	-- Distribui a contagem da task
	for _, p in ipairs(playersToReward) do
		for id, task in pairs(FrizzlyTasks) do
			if p:getStorageValue(FrizzlyStorages.Quest + id) == 1 then
				for _, name in ipairs(task.creatures) do
					if name:lower() == targetName then
						local currentKills = math.max(0, p:getStorageValue(FrizzlyStorages.Kills + id))
						if currentKills < task.killsRequired then
							p:setStorageValue(FrizzlyStorages.Kills + id, currentKills + 1)
							p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Frizzly Task: " .. (currentKills + 1) .. "/" .. task.killsRequired .. " " .. task.raceName .. " abatidos.")
						end
						break
					end
				end
			end
		end
	end
	return true
end

taskKillEvent:register()

-- =======================================================
-- EVENTO DE LOGIN (REGISTRA O ONKILL NO JOGADOR)
-- =======================================================
local taskLoginEvent = CreatureEvent("FrizzlyTaskLogin")

function taskLoginEvent.onLogin(player)
	player:registerEvent("FrizzlyTaskKill")
	return true
end

taskLoginEvent:register()
