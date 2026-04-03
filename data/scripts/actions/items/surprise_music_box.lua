local prize = {
	-- Itens originais
	{ chance = 1, id = 16244, amount = 1 }, -- music box 
	{ chance = 30, id = 12547, amount = 1 }, -- diapason crystal wolf
	{ chance = 30, id = 12548, amount = 1 }, -- bag of apple donkey
	{ chance = 5, id = ITEM_CRYSTAL_COIN, amount = 14 },
	{ chance = 5, id = 3587, amount = 1 }, -- banana

	-- Equipamentos
	{ chance = 4, id = 6529, amount = 1 }, -- soft boots
	{ chance = 4, id = 6527, amount = 1 }, -- the avenger
	{ chance = 4, id = 3341, amount = 1 }, -- arcane staff
	{ chance = 4, id = 5803, amount = 1 }, -- arbalest
	{ chance = 4, id = 8102, amount = 1 }, -- emerald blade
	{ chance = 4, id = 8096, amount = 1 }, -- hellforged axe
	{ chance = 4, id = 8100, amount = 1 }, -- obsidian truncheon
	{ chance = 4, id = 8026, amount = 1 }, -- warsinger bow
	{ chance = 4, id = 8023, amount = 1 }, -- royal crossbow
	{ chance = 4, id = 8090, amount = 1 }, -- spellbook of dark mysteries
	{ chance = 4, id = 8053, amount = 1 }, -- fireborn giant armor
	{ chance = 4, id = 8054, amount = 1 }, -- earthborn titan armor
	{ chance = 4, id = 8055, amount = 1 }, -- windborn colossus armor
	{ chance = 4, id = 8056, amount = 1 }, -- oceanborn leviathan armor
	{ chance = 4, id = 8062, amount = 1 }, -- robe of the underworld
	{ chance = 4, id = 8060, amount = 1 }, -- master archer's armor
	{ chance = 3, id = 35516, amount = 1 }, -- exotic legs
	{ chance = 3, id = 35517, amount = 1 }, -- bast legs
	{ chance = 3, id = 50186, amount = 1 }, -- jungle survivor legs
	{ chance = 3, id = 16106, amount = 1 }, -- gill legs
	{ chance = 2, id = 13999, amount = 1 }, -- ornate legs
	{ chance = 2, id = 16109, amount = 1 }, -- prismatic helmet
	{ chance = 2, id = 16110, amount = 1 }, -- prismatic armor
	{ chance = 2, id = 16111, amount = 1 }, -- prismatic legs
	{ chance = 2, id = 16112, amount = 1 }, -- prismatic boots
	{ chance = 5, id = 16113, amount = 1 }, -- prismatic necklace
	{ chance = 2, id = 16114, amount = 1 }, -- prismatic ring
	{ chance = 3, id = 16116, amount = 1 }, -- prismatic shield
	
	-- Novos Equipamentos (Armaduras)
	{ chance = 1, id = 50263, amount = 1 }, -- merudri scale mail
	{ chance = 1, id = 50261, amount = 1 }, -- merudri nanbando
	{ chance = 1, id = 11686, amount = 1 }, -- royal draken mail
	{ chance = 1, id = 11687, amount = 1 }, -- royal scale robe

	-- Novos Equipamentos (Pernas)
	{ chance = 1, id = 32617, amount = 1 }, -- fabulous legs
	{ chance = 1, id = 32618, amount = 1 }, -- soulful legs
	{ chance = 1, id = 50185, amount = 1 }, -- jade legs
	{ chance = 1, id = 27649, amount = 1 }, -- gnome legs

	-- Tokens
	{ chance = 2, id = 16129, amount = 10 }, -- major crystalline token

	-- Poções (Normais: chance 70 / quant 100)
	{ chance = 30, id = 266, amount = 50 }, -- health potion
	{ chance = 30, id = 268, amount = 50 }, -- mana potion

	-- Poções (Strong: chance 50 / quant 100)
	{ chance = 30, id = 236, amount = 50 }, -- strong health potion
	{ chance = 30, id = 237, amount = 50 }, -- strong mana potion

	-- Poções (Great: chance 30 / quant 100)
	{ chance = 30, id = 239, amount = 50 }, -- great health potion
	{ chance = 30, id = 238, amount = 50 }, -- great mana potion
	{ chance = 30, id = 7642, amount = 50 }, -- great spirit potion

	-- Poções (Ultimate: chance 20 / quant 70)
	{ chance = 20, id = 7643, amount = 50 }, -- ultimate health potion
	{ chance = 20, id = 23373, amount = 50 }, -- ultimate mana potion
	{ chance = 20, id = 23374, amount = 50 }, -- ultimate spirit potion

	-- Poções (Supreme: chance 10 / quant 30)
	{ chance = 10, id = 23375, amount = 30 }, -- supreme health potion
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local surpriseBox = Action()

function surpriseBox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local totalWeight = 0
	for _, prizeEntry in ipairs(prize) do
		totalWeight = totalWeight + prizeEntry.chance
	end

	local roll = math.random() * totalWeight
	local cumulativeChance = 0

	for _, prizeEntry in ipairs(prize) do
		cumulativeChance = cumulativeChance + prizeEntry.chance
		if roll <= cumulativeChance then
			
			-- Pega o tipo do item
			local itemType = ItemType(prizeEntry.id)
			-- Verifica se é mais de 1 para usar o nome no plural (ex: 100x mana potions)
			local itemName = prizeEntry.amount > 1 and itemType:getPluralName() or itemType:getName()
			
			-- Texto da mensagem
			local text = string.format("Voce abriu a reward box e recebeu %dx %s.", prizeEntry.amount, itemName)
			
			-- Envia a mensagem em branco para o Server Log do jogador
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, text)

			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:addItem(prizeEntry.id, prizeEntry.amount)
			item:remove(1)
			break
		end
	end
	
	return true
end

surpriseBox:id(12045)
surpriseBox:register()
