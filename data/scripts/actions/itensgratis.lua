local rewardChest = Action()

-- =================================================================
-- CONFIGURAÇÃO GERAL DE TODAS AS QUESTS DE ESCOLHA DO SERVIDOR
-- =================================================================
local questsConfig = {
    
    ["100"] = {
        storage = 55000,
        chests = {
            -- [Unique ID do Mapa] = {itemId = ID do Item, count = Quantidade}
            [55001] = {itemId = 7390, count = 1}, -- the justice seeker
            [55002] = {itemId = 7434, count = 1}, -- royal axe
            [55003] = {itemId = 7429, count = 1}, -- blessed spectre
            [55004] = {itemId = 8028, count = 1}, -- yol's Bow
            [55005] = {itemId = 50273, count = 1}, -- Nunchaku of Enlightenment
            [55006] = {itemId = 16118, count = 1}, -- glacial rod
            [55007] = {itemId = 16096, count = 1}, -- wand of defiance
        }
    },

    ["200"] = {
        storage = 55001, 
        chests = {
            [55010] = {itemId = 17828, count = 1}, -- pair of iron fists
            [55011] = {itemId = 16162, count = 1}, -- mycological mace
            [55012] = {itemId = 16161, count = 1}, -- crystalline axe
            [55013] = {itemId = 16175, count = 1}, -- shiny blade
            [55014] = {itemId = 16162, count = 1}, -- micological bow
            [55015] = {itemId = 45640, count = 1}, -- creamy grimoire
            [55016] = {itemId = 45639, count = 1}, -- cocoa grimoire
        }
    },

    ["300"] = {
        storage = 55002, 
        chests = {
            [55019] = {itemId = 31633, count = 1}, -- supreme cube
        }
    },

    ["400"] = {
        storage = 55004, 
        chests = {
            [55020] = {itemId = 60000, count = 1}, -- red magic bag
        }
    },

    ["500"] = { 
        storage = 55005, 
        chests = {
            [55022] = {itemId = 44067, count = 1, charges = 18000}, -- shield
            [55023] = {itemId = 50295, count = 1, charges = 18000}, -- wraps
            [55024] = {itemId = 35287, count = 1, charges = 18000}, -- club
            [55025] = {itemId = 35286, count = 1, charges = 18000}, -- axe
            [55026] = {itemId = 35285, count = 1, charges = 18000}, -- sword
            [55027] = {itemId = 35288, count = 1, charges = 18000}, --bow
            [55028] = {itemId = 35290, count = 1, charges = 18000}, --wand
        }
    }
}

local uidConfig = {}
local uidsToRegister = {}

-- Prepara a configuração e coleta todos os UIDs
for questName, questData in pairs(questsConfig) do
    for uid, reward in pairs(questData.chests) do
        uidConfig[uid] = {
            storage = questData.storage,
            itemId = reward.itemId,
            count = reward.count or 1,
            charges = reward.charges
        }
        table.insert(uidsToRegister, uid)
    end
end

-- CORREÇÃO AQUI: Usando apenas 'unpack' (padrão do LuaJIT/Lua 5.1)
rewardChest:uid(unpack(uidsToRegister))

function rewardChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Identifica qual baú o jogador clicou
    local config = uidConfig[item:getUniqueId()]
    if not config then return false end

    -- 1. Verifica se já pegou a recompensa DESTA quest específica
    if player:getStorageValue(config.storage) > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja coletou a sua recompensa. Lucas 12:15")
        return true
    end

    local itemType = ItemType(config.itemId)
    local totalWeight = itemType:getWeight(config.count)
    local article = (config.count > 1) and (config.count .. "x ") or "um(a) "

    -- 2. Verifica se o player tem capacidade na mochila
    if player:getFreeCapacity() < totalWeight then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce encontrou " .. article .. itemType:getName() .. ", mas nao tem capacidade para carrega-lo.")
        return true
    end

    -- 3. Entrega o item e aplica as cargas, se houver
    local addedItem = player:addItem(config.itemId, config.count)
    
    if addedItem then
        -- Se o item foi criado com sucesso e a tabela exige cargas, aplica as cargas
        if config.charges then
            addedItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, config.charges)
        end
        
        -- Salva a informação que ele já fez a quest
        player:setStorageValue(config.storage, 1)
        
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce encontrou " .. article .. itemType:getName() .. ".")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    else
        -- Prevenção de segurança caso o inventário esteja cheio de uma forma que a checagem de peso não pegou
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce nao tem espaco suficiente na mochila.")
    end

    return true
end

rewardChest:register()