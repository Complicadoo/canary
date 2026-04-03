local config = {
    storage = 54999,
    
    -- IDs das vocacoes customizadas
    monkBaseId = 9,
    monkPromoId = 10,
    
    -- IDs dos Itens
    items = {
        sorcerer = 35290,
        druid = 35289,
        paladin = 35288,
        monk = 50295,
        knight_sword = 35285,
        knight_axe = 35286,
        knight_club = 35287
    }
}

local talkAction = TalkAction("!skullot")
talkAction:groupType("normal")

function talkAction.onSay(player, words, param)
    -- Trava de Storage
    if player:getStorageValue(config.storage) >= 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "Voce ja resgatou sua arma de treino.")
        return false
    end

    -- Pega a vocacao com seguranca
    local vocation = player:getVocation()
    local vocationId = vocation:getId()
    
    local demotion = vocation:getDemotion()
    if demotion and demotion:getId() > 0 then
        vocationId = demotion:getId()
    end

    if vocationId == config.monkPromoId then
        vocationId = config.monkBaseId
    end

    local itemId = 0

    if vocationId == 1 then
        itemId = config.items.sorcerer
    elseif vocationId == 2 then
        itemId = config.items.druid
    elseif vocationId == 3 then
        itemId = config.items.paladin
    elseif vocationId == config.monkBaseId then
        itemId = config.items.monk
    elseif vocationId == 4 then
        local sword = player:getSkillLevel(SKILL_SWORD)
        local axe = player:getSkillLevel(SKILL_AXE)
        local club = player:getSkillLevel(SKILL_CLUB)

        if sword >= axe and sword >= club then
            itemId = config.items.knight_sword
        elseif axe >= sword and axe >= club then
            itemId = config.items.knight_axe
        else
            itemId = config.items.knight_club
        end
    end

    -- Entrega do item direto no Store Inbox
    if itemId > 0 then
        -- Busca o Store Inbox do jogador (Slot 11)
        local storeInbox = player:getStoreInbox()
        
        if not storeInbox then
            player:sendTextMessage(MESSAGE_FAILURE, "Erro: Voce precisa ter um Store Inbox para receber este item.")
            return false
        end

        -- Cria o item DENTRO do Store Inbox
        local item = storeInbox:addItem(itemId, 1)
        
        if item then
            item:setAttribute(ITEM_ATTRIBUTE_CHARGES, 5000)
            
            -- Adiciona o atributo nativo de Store (impede trade, drop e movimentacao indevida)
            item:setAttribute(ITEM_ATTRIBUTE_STORE, true) 
            
            player:setStorageValue(config.storage, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce recebeu sua arma de treino! Verifique o seu Store Inbox.")
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        else
            player:sendTextMessage(MESSAGE_FAILURE, "Erro: Nao foi possivel entregar o item. Verifique se o seu Store Inbox esta cheio.")
        end
    else
        player:sendTextMessage(MESSAGE_FAILURE, "Erro: Vocacao nao suportada. O ID da sua vocacao atual e: " .. vocationId)
    end

    return false
end

talkAction:separator(" ")
talkAction:register()