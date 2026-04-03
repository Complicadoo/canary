local supremeCube = Action()

-- Configurações
local cooldownStorage = 987654 -- Um número de storage vazio para salvar o tempo
local cooldownTime = 1 * 60 * 60 -- 1 hora em segundos

function supremeCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o jogador ainda está em cooldown
    if player:getStorageValue(cooldownStorage) > os.time() then
        local timeMins = math.ceil((player:getStorageValue(cooldownStorage) - os.time()) / 60)
        player:sendTextMessage(MESSAGE_FAILURE, string.format("O Supreme Cube esta recarregando. Voce precisa esperar mais %d minuto(s).", timeMins))
        return true
    end

    -- Busca a cidade (hometown) do jogador e a posição do templo
    local playerTown = player:getTown()
    if not playerTown then
        player:sendTextMessage(MESSAGE_FAILURE, "O cube energizou-se, porem nada aconteceu. Voce sente instintivamente que um destino nao foi encontrado.")
        return true
    end
    
    local templePosition = playerTown:getTemplePosition()

    -- Solta um efeito na posição antiga antes de sumir
    player:getPosition():sendMagicEffect(CONST_ME_POFF)

    -- Teleporta o jogador para o templo
    player:teleportTo(templePosition)

    -- Solta um efeito na nova posição (templo)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    
    -- CORREÇÃO AQUI: Trocado de MESSAGE_INFO_DESCR para MESSAGE_EVENT_ADVANCE
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce usou o Cubo Supremo e teleportou-se para o templo!")

    -- Aplica o cooldown de 1 hora
    player:setStorageValue(cooldownStorage, os.time() + cooldownTime)

    return true
end

supremeCube:id(31633)
supremeCube:register()