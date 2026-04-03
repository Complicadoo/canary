local internalNpcName = "Anay"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 3

npcConfig.outfit = {
	lookType = 132,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

-- Nesse NPC se compra utilizando platinum tokens.
npcConfig.currency = 22723

npcConfig.voices = {
	interval = 15000,
	chance = 30,
	{ text = "Tah fedendo a mofo isso aqui!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval) npcHandler:onThink(npc, interval) end
npcType.onAppear = function(npc, creature) npcHandler:onAppear(npc, creature) end
npcType.onDisappear = function(npc, creature) npcHandler:onDisappear(npc, creature) end
npcType.onMove = function(npc, creature, fromPosition, toPosition) npcHandler:onMove(npc, creature, fromPosition, toPosition) end
npcType.onSay = function(npc, creature, type, message) npcHandler:onSay(npc, creature, type, message) end
npcType.onCloseChannel = function(npc, creature) npcHandler:onCloseChannel(npc, creature) end


npcHandler:setMessage(MESSAGE_GREET, "Faaala, |PLAYERNAME|! Veio buscar equipamentos? Me mostre seus tokens, que faremos um {trade} .")
npcHandler:setMessage(MESSAGE_FAREWELL, "Falou!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Maluco esquisitão...")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Basta escolher! Se tiver alguma duvida sobre os equipamentos, olha na wiki, porque eu nao sou seu escravo nao, carai!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
-------------------------------------------------------------------------------
{ itemName = "terra helmet(KNIGHT)", clientId = 31577, buy = 4 },
{ itemName = "bear skin(DRUID)", clientId = 31578, buy = 4 },
{ itemName = "embrace of nature(DRUID)", clientId = 31579, buy = 4 },

-------------------------------------------------------------------------------
{ itemName = "cobra sword(KNIGHT)", clientId = 30398, buy = 4 },
{ itemName = "cobra axe(KNIGHT)", clientId = 30396, buy = 5 },
{ itemName = "cobra club(KNIGHT)", clientId = 30395, buy = 5 },
{ itemName = "cobra wand(SORCERER)", clientId = 30399, buy = 2 },
{ itemName = "cobra rod(DRUID)", clientId = 30400, buy = 2 },
{ itemName = "cobra crossbow(PALADIN)", clientId = 30393, buy = 6 },
{ itemName = "cobra bo(MONK)", clientId = 50167, buy = 6 },
{ itemName = "cobra hood(KNIGHT)", clientId = 30397, buy = 14 },
{ itemName = "cobra boots(KNIGHT)", clientId = 30394, buy = 14 },
{ itemName = "cobra amulet(TODOS)", clientId = 31631, buy = 14 },

	-------------------------------------------------------------------------------
	{ itemName = "naga sword(KNIGHT)", clientId = 39155, buy = 4 },
	{ itemName = "naga axe(KNIGHT)", clientId = 39156, buy = 4 },
	{ itemName = "naga club(KNIGHT)", clientId = 39157, buy = 4 },
	{ itemName = "naga wand(SORCERER)", clientId = 39162, buy = 3 },
	{ itemName = "naga rod(DRUID)", clientId = 39163, buy = 3 },
	{ itemName = "naga crossbow(PALADIN)", clientId = 39159, buy = 10 },
	{ itemName = "naga katar(MONK)", clientId = 50160, buy = 25 },
	{ itemName = "dawnfire sherwani(SORCERER)", clientId = 39164, buy = 20 },
	{ itemName = "midnight tunic(DRUID)", clientId = 39165, buy = 20 },
	{ itemName = "naga tanko(MONK)", clientId = 50262, buy = 20 },
	{ itemName = "dawnfire pantaloons(SORCERER)", clientId = 39166, buy = 20 },
	{ itemName = "midnight sarong(DRUID)", clientId = 39167, buy = 20 },
	{ itemName = "frostflower boots(KNIGHT)", clientId = 39158, buy = 12 },
	{ itemName = "feverbloom boots(PALADIN)", clientId = 39161, buy = 12 },
	{ itemName = "naga quiver(PALADIN)", clientId = 39160, buy = 10 },
	{ itemName = "turtle amulet(KNIGHT)", clientId = 39235, buy = 30 },

-------------------------------------------------------------------------------
{ itemName = "gnome sword(KNIGHT)", clientId = 27651, buy = 4 },
{ itemName = "winterblade(KNIGHT)", clientId = 29422, buy = 2 },
{ itemName = "summerblade(KNIGHT)", clientId = 29421, buy = 2 },
{ itemName = "mortal mace(KNIGHT)", clientId = 31580, buy = 3 },
{ itemName = "tagralt blade(KNIGHT)", clientId = 31614, buy = 10 },
{ itemName = "resizer(KNIGHT)", clientId = 29419, buy = 10 },
{ itemName = "phantasmal axe(KNIGHT)", clientId = 32616, buy = 10 },
{ itemName = "deepling ceremonial dagger(SORCERER, DRUID)", clientId = 28825, buy = 1 },
{ itemName = "deepling fork(SORCERER, DRUID)", clientId = 28826, buy = 1 },
{ itemName = "bow of cataclysm(PALADIN)", clientId = 31581, buy = 14 },
{ itemName = "drachaku(MONK)", clientId = 10391, buy = 4 },
{ itemName = "sai of enlightenment(MONK)", clientId = 50272, buy = 2 },
{ itemName = "depth claws(MONK)", clientId = 50176, buy = 10 },
{ itemName = "bambus jo(MONK)", clientId = 50270, buy = 10 },
{ itemName = "galea mortis(SORCERER)", clientId = 31582, buy = 10 },
{ itemName = "toga mortis(SORCERER)", clientId = 31583, buy = 10 },
{ itemName = "death oyoroi(MONK)", clientId = 50260, buy = 14 },

	-------------------------------------------------------------------------------
{ itemName = "umbral masterblade(KNIGHT)", clientId = 20066, buy = 3 },
{ itemName = "umbral master axe(KNIGHT)", clientId = 20072, buy = 3 },
{ itemName = "umbral master mace(KNIGHT)", clientId = 20078, buy = 3 },
{ itemName = "umbral master slayer(KNIGHT)", clientId = 20069, buy = 6 },
{ itemName = "umbral master chopper(KNIGHT)", clientId = 20075, buy = 6 },
{ itemName = "umbral master hammer(KNIGHT)", clientId = 20081, buy = 6 },
{ itemName = "umbral master bow(PALADIN)", clientId = 20084, buy = 15 },
{ itemName = "umbral master crossbow(PALADIN)", clientId = 20087, buy = 6 },
{ itemName = "umbral master katar(MONK)", clientId = 50165, buy = 6 },
{ itemName = "umbral master spellbook(DRUID, SORCERER)", clientId = 20090, buy = 6 },

	-------------------------------------------------------------------------------
{ itemName = "blade of destruction(KNIGHT)", clientId = 27449, buy = 3 },
{ itemName = "axe of destruction(KNIGHT)", clientId = 27451, buy = 3 },
{ itemName = "mace of destruction(KNIGHT)", clientId = 27453, buy = 3 },
{ itemName = "slayer of destruction(KNIGHT)", clientId = 27450, buy = 6 },
{ itemName = "chopper of destruction(KNIGHT)", clientId = 27452, buy = 6 },
{ itemName = "hammer of destruction(KNIGHT)", clientId = 27454, buy = 6 },
{ itemName = "wand of destruction(SORCERER)", clientId = 27457, buy = 4 },
{ itemName = "rod of destruction(DRUID)", clientId = 27458, buy = 4 },
{ itemName = "bow of destruction(PALADIN)", clientId = 27455, buy = 10 },
{ itemName = "crossbow of destruction(PALADIN)", clientId = 27456, buy = 6 },
{ itemName = "nunchaku of destruction(MONK)", clientId = 50168, buy = 6 },

	-------------------------------------------------------------------------------
{ itemName = "amber sabre(KNIGHT)", clientId = 47374, buy = 5 },
{ itemName = "amber axe(KNIGHT)", clientId = 47375, buy = 5 },
{ itemName = "amber cudgel(KNIGHT)", clientId = 47376, buy = 5 },
{ itemName = "amber slayer(KNIGHT)", clientId = 47368, buy = 10 },
{ itemName = "amber greataxe(KNIGHT)", clientId = 47369, buy = 10 },
{ itemName = "amber bludgeon(KNIGHT)", clientId = 47370, buy = 10 },
{ itemName = "amber wand(SORCERER)", clientId = 47372, buy = 8 },
{ itemName = "amber rod(DRUID)", clientId = 47373, buy = 8 },
{ itemName = "amber bow(PALADIN)", clientId = 47371, buy = 35 },
{ itemName = "amber crossbow(PALADIN)", clientId = 47377, buy = 15 },
{ itemName = "amber kusarigama(MONK)", clientId = 50239, buy = 10 },

	-------------------------------------------------------------------------------
{ itemName = "lion longsword(KNIGHT)", clientId = 34155, buy = 10 },
{ itemName = "lion axe(KNIGHT)", clientId = 34253, buy = 10 },
{ itemName = "lion hammer(KNIGHT)", clientId = 34254, buy = 10 },
{ itemName = "lion wand(SORCERER)", clientId = 34152, buy = 8 },
{ itemName = "lion rod(DRUID)", clientId = 34151, buy = 8 },
{ itemName = "lion longbow(PALADIN)", clientId = 34150, buy = 35 },
{ itemName = "lion claws(MONK)", clientId = 50162, buy = 20},
{ itemName = "lion shield(KNIGHT)", clientId = 34154, buy = 10 },
{ itemName = "lion spellbook(DRUID, SORCERER)", clientId = 34153, buy = 10 },
{ itemName = "lion spangenhelm(PALADIN)", clientId = 34156, buy = 30 },
{ itemName = "lion plate(KNIGHT)", clientId = 34157, buy = 25 },
{ itemName = "lion amulet(TODOS)", clientId = 34158, buy = 10 },

	-------------------------------------------------------------------------------
{ itemName = "eldritch claymore(KNIGHT)", clientId = 36657, buy = 25 },
{ itemName = "eldritch greataxe(KNIGHT)", clientId = 36661, buy = 25 },
{ itemName = "eldritch warmace(KNIGHT)", clientId = 36659, buy = 25 },
{ itemName = "eldritch wand(SORCERER)", clientId = 36668, buy = 20 },
{ itemName = "eldritch rod(DRUID)", clientId = 36674, buy = 20 },
{ itemName = "eldritch bow(PALADIN)", clientId = 36664, buy = 40 },
{ itemName = "eldritch crescent moon spade(MONK)", clientId = 50169, buy = 25 },
{ itemName = "eldritch shield(KNIGHT)", clientId = 36656, buy = 40 },
{ itemName = "eldritch folio(SORCERER)", clientId = 36672, buy = 25 },
{ itemName = "eldritch tome(DRUID)", clientId = 36673, buy = 25 },
{ itemName = "eldritch cowl(SORCERER)", clientId = 36670, buy = 30 },
{ itemName = "eldritch hood(DRUID)", clientId = 36671, buy = 30 },
{ itemName = "eldritch cuirass(KNIGHT)", clientId = 36663, buy = 40 },
{ itemName = "eldritch breeches(PALADIN)", clientId = 36667, buy = 50 },
{ itemName = "eldritch monk boots(MONK)", clientId = 50266, buy = 15 },
{ itemName = "eldritch quiver(PALADIN)", clientId = 36666, buy = 15 },
{ itemName = "gilded eldritch claymore(KNIGHT)", clientId = 36658, buy = 35 },
{ itemName = "gilded eldritch greataxe(KNIGHT)", clientId = 36662, buy = 35 },
{ itemName = "gilded eldritch warmace(KNIGHT)", clientId = 36660, buy = 35 },
{ itemName = "gilded eldritch wand(SORCERER)", clientId = 36669, buy = 30 },
{ itemName = "gilded eldritch rod(DRUID)", clientId = 36675, buy = 30 },
{ itemName = "gilded eldritch bow(PALADIN)", clientId = 36665, buy = 50 },
{ itemName = "gilded eldritch crescent moon spade(MONK)", clientId = 50170, buy = 35 },

	-------------------------------------------------------------------------------
{ itemName = "inferniarch blade(KNIGHT)", clientId = 49527, buy = 20 },
{ itemName = "inferniarch battleaxe(KNIGHT)", clientId = 49523, buy = 20 },
{ itemName = "inferniarch flail(KNIGHT)", clientId = 49525, buy = 20 },
{ itemName = "inferniarch slayer(KNIGHT)", clientId = 49530, buy = 25 },
{ itemName = "inferniarch greataxe(KNIGHT)", clientId = 49524, buy = 25 },
{ itemName = "inferniarch warhammer(KNIGHT)", clientId = 49526, buy = 25 },
{ itemName = "inferniarch wand(SORCERER)", clientId = 49528, buy = 15 },
{ itemName = "inferniarch rod(DRUID)", clientId = 49529, buy = 15 },
{ itemName = "inferniarch bow(PALADIN)", clientId = 49520, buy = 30 },
{ itemName = "inferniarch arbalest(PALADIN)", clientId = 49522, buy = 20 },
{ itemName = "inferniarch claws(MONK)", clientId = 50250, buy = 18 },
{ itemName = "rending inferniarch blade(KNIGHT)", clientId = 49876, buy = 40 },
{ itemName = "rending inferniarch battleaxe(KNIGHT)", clientId = 49864, buy = 40 },
{ itemName = "rending inferniarch flail(KNIGHT)", clientId = 49870, buy = 40 },
{ itemName = "rending inferniarch slayer(KNIGHT)", clientId = 49879, buy = 50 },
{ itemName = "rending inferniarch greataxe(KNIGHT)", clientId = 49867, buy = 50 },
{ itemName = "rending inferniarch warhammer(KNIGHT)", clientId = 49873, buy = 50 },
{ itemName = "rending inferniarch wand(SORCERER)", clientId = 49882, buy = 30 },
{ itemName = "rending inferniarch rod(DRUID)", clientId = 49885, buy = 30 },
{ itemName = "rending inferniarch bow(PALADIN)", clientId = 49858, buy = 60 },
{ itemName = "rending inferniarch arbalest(PALADIN)", clientId = 49861, buy = 40 },
{ itemName = "rending inferniarch claws(MONK)", clientId = 50251, buy = 40 },
{ itemName = "siphoning inferniarch blade(KNIGHT)", clientId = 49878, buy = 40 },
{ itemName = "siphoning inferniarch battleaxe(KNIGHT)", clientId = 49866, buy = 40 },
{ itemName = "siphoning inferniarch flail(KNIGHT)", clientId = 49872, buy = 40 },
{ itemName = "siphoning inferniarch slayer(KNIGHT)", clientId = 49881, buy = 50 },
{ itemName = "siphoning inferniarch greataxe(KNIGHT)", clientId = 49869, buy = 50 },
{ itemName = "siphoning inferniarch warhammer(KNIGHT)", clientId = 49875, buy = 50 },
{ itemName = "siphoning inferniarch wand(SORCERER)", clientId = 49884, buy = 30 },
{ itemName = "siphoning inferniarch rod(DRUID)", clientId = 49887, buy = 30 },
{ itemName = "siphoning inferniarch bow(PALADIN)", clientId = 49860, buy = 60 },
{ itemName = "siphoning inferniarch arbalest(PALADIN)", clientId = 49863, buy = 40 },
{ itemName = "siphoning inferniarch claws(MONK)", clientId = 50253, buy = 40 },
{ itemName = "draining inferniarch blade(KNIGHT)", clientId = 49877, buy = 40 },
{ itemName = "draining inferniarch greataxe(KNIGHT)", clientId = 49868, buy = 40 },
{ itemName = "draining inferniarch flail(KNIGHT)", clientId = 49871, buy = 40 },
{ itemName = "draining inferniarch slayer(KNIGHT)", clientId = 49880, buy = 50 },
{ itemName = "draining inferniarch battleaxe(KNIGHT)", clientId = 49865, buy = 50 },
{ itemName = "draining inferniarch warhammer(KNIGHT)", clientId = 49874, buy = 50 },
{ itemName = "draining inferniarch wand(SORCERER)", clientId = 49883, buy = 30 },
{ itemName = "draining inferniarch rod(DRUID)", clientId = 49886, buy = 30 },
{ itemName = "draining inferniarch bow(PALADIN)", clientId = 49859, buy = 60 },
{ itemName = "draining inferniarch arbalest(PALADIN)", clientId = 49862, buy = 40 },
{ itemName = "draining inferniarch claws(MONK)", clientId = 50252, buy = 40 },

	-------------------------------------------------------------------------------
{ itemName = "falcon longsword(KNIGHT)", clientId = 28723, buy = 30 },
{ itemName = "falcon battleaxe(KNIGHT)", clientId = 28724, buy = 45 },
{ itemName = "falcon mace(KNIGHT)", clientId = 28725, buy = 30 },
{ itemName = "falcon wand(SORCERER)", clientId = 28717, buy = 20 },
{ itemName = "falcon rod(DRUID)", clientId = 28716, buy = 20 },
{ itemName = "falcon bow(PALADIN)", clientId = 28718, buy = 50 },
{ itemName = "falcon sai(MONK)", clientId = 50161, buy = 30 },
{ itemName = "falcon shield(KNIGHT)", clientId = 28721, buy = 20 },
{ itemName = "falcon escutcheon(KNIGHT)", clientId = 28722, buy = 40 },
{ itemName = "falcon coif(KNIGHT, PALADIN)", clientId = 28715, buy = 40 },
{ itemName = "falcon circlet(DRUID, SORCERER)", clientId = 28714, buy = 20 },
{ itemName = "falcon plate(KNIGHT)", clientId = 28719, buy = 80 },
{ itemName = "falcon greaves(KNIGHT, PALADIN)", clientId = 28720, buy = 110 },

	-------------------------------------------------------------------------------
{ itemName = "soulcutter(KNIGHT)", clientId = 34082, buy = 100 },
{ itemName = "soulbiter(KNIGHT)", clientId = 34084, buy = 80 },
{ itemName = "soulcrusher(KNIGHT)", clientId = 34086, buy = 60 },
{ itemName = "soulshredder(KNIGHT)", clientId = 34083, buy = 270 },
{ itemName = "souleater(KNIGHT)", clientId = 34085, buy = 240 },
{ itemName = "soulmaimer(KNIGHT)", clientId = 34087, buy = 120 },
{ itemName = "soultainter(SORCERER)", clientId = 34090, buy = 80 },
{ itemName = "soulhexer(DRUID)", clientId = 34091, buy = 70 },
{ itemName = "soulbleeder(PALADIN)", clientId = 34088, buy = 400 },
{ itemName = "soulpiercer(PALADIN)", clientId = 34089, buy = 180 },
{ itemName = "soulkamas(MONK)", clientId = 50159, buy = 160 },
{ itemName = "soulbastion(KNIGHT)", clientId = 34099, buy = 80 },
{ itemName = "soulmantle(SORCERER)", clientId = 34095, buy = 90 },
{ itemName = "soulshroud(DRUID)", clientId = 34096, buy = 80 },
{ itemName = "soulshanks(SORCERER)", clientId = 34092, buy = 60 },
{ itemName = "soulstrider(DRUID)", clientId = 34093, buy = 50 },
{ itemName = "soulshell(PALADIN)", clientId = 34094, buy = 220 },
{ itemName = "pair of soulwalkers(KNIGHT)", clientId = 34097, buy = 250 },
{ itemName = "pair of soulstalkers(PALADIN)", clientId = 34098, buy = 200 },

	-------------------------------------------------------------------------------
{ itemName = "spiritthorn helmet(KNIGHT)", clientId = 39148, buy = 250 },
{ itemName = "spiritthorn armor(KNIGHT)", clientId = 39147, buy = 400 },
{ itemName = "spiritthorn ring(KNIGHT)", clientId = 39179, buy = 150 },

	-------------------------------------------------------------------------------
{ itemName = "sanguine blade(KNIGHT)", clientId = 43864, buy = 150 },
{ itemName = "sanguine hatchet(KNIGHT)", clientId = 43868, buy = 140 },
{ itemName = "sanguine cudgel(KNIGHT)", clientId = 43866, buy = 100 },	
{ itemName = "sanguine razor(KNIGHT)", clientId = 43870, buy = 450 },
{ itemName = "sanguine battleaxe(KNIGHT)", clientId = 43874, buy = 280 },
{ itemName = "sanguine bludgeon(KNIGHT)", clientId = 43872, buy = 350 },
{ itemName = "sanguine coil(SORCERER)", clientId = 43882, buy = 100 },
{ itemName = "sanguine rod(DRUID)", clientId = 43885, buy = 120 },
{ itemName = "sanguine bow(PALADIN)", clientId = 43877, buy = 550 },
{ itemName = "sanguine crossbow(PALADIN)", clientId = 43879, buy = 350 },
{ itemName = "sanguine claws(MONK)", clientId = 50157, buy = 300 },
{ itemName = "sanguine legs(KNIGHT)", clientId = 43876, buy = 350 },
{ itemName = "sanguine greaves(PALADIN)", clientId = 43881, buy = 450 },
{ itemName = "sanguine boots(DRUID, SORCERER)", clientId = 43884, buy = 150 },
{ itemName = "sanguine galoshes(DRUID, SORCERER)", clientId = 43887, buy = 150 },
{ itemName = "sanguine trousers(MONK)", clientId = 50146, buy = 350 },
{ itemName = "grand sanguine blade(KNIGHT)", clientId = 43865, buy = 300},
{ itemName = "grand sanguine hatchet(KNIGHT)", clientId = 43869, buy = 280 },
{ itemName = "grand sanguine cudgel(KNIGHT)", clientId = 43867, buy = 200 },
{ itemName = "grand sanguine battleaxe(KNIGHT)", clientId = 43875, buy = 560 },
{ itemName = "grand sanguine razor(KNIGHT)", clientId = 43871, buy = 900 },
{ itemName = "grand sanguine bludgeon(KNIGHT)", clientId = 43873, buy = 700 },
{ itemName = "grand sanguine coil(SORCERER)", clientId = 43883, buy = 200 },
{ itemName = "grand sanguine rod(DRUID)", clientId = 43886, buy = 240 },
{ itemName = "grand sanguine bow(PALADIN)", clientId = 43878, buy = 1100 },
{ itemName = "grand sanguine crossbow(PALADIN)", clientId = 43880, buy = 700 },
{ itemName = "grand sanguine claws(MONK)", clientId = 50158, buy = 600 },
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
end

npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
