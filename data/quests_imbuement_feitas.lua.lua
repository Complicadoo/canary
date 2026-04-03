local accessImbuements = CreatureEvent("AccessImbuementsLogin")

function accessImbuements.onLogin(player)
    -- Storage de controle para rodar apenas 1x por personagem
    local controlStorage = 900001 
    
    if player:getStorageValue(controlStorage) < 1 then
        
        -- ==========================================
        -- 1. FORGOTTEN KNOWLEDGE (Intricate e Powerful Base)
        -- ==========================================
        -- As storages exatas de cada portal/boss da quest
        player:setStorageValue(Storage.ForgottenKnowledge.LadyTenebris, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.Lloyd, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.ThornKnight, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.DragonkingZyrtarch, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.MeltingFrozenHorror, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.TimeGuardian, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.LastLoreReader, 1)
        
        -- O acesso principal ao templo
        player:setStorageValue(Storage.ForgottenKnowledge.Tomes, 1)
        player:setStorageValue(Storage.ForgottenKnowledge.AstralShaperRune, 1)


        -- ==========================================
        -- 2. HEART OF DESTRUCTION (Powerful: Strike, Void, Vampirism)
        -- ==========================================
        -- As storages de cada anomalia/boss
        player:setStorageValue(Storage.HeartOfDestruction.Anomaly, 1)
        player:setStorageValue(Storage.HeartOfDestruction.Eradicator, 1)
        player:setStorageValue(Storage.HeartOfDestruction.Outburst, 1)
        player:setStorageValue(Storage.HeartOfDestruction.RealityQuake, 1)
        player:setStorageValue(Storage.HeartOfDestruction.Rupture, 1)
        player:setStorageValue(Storage.HeartOfDestruction.WorldDevourer, 1)
        
        -- A storage final de quest concluída
        player:setStorageValue(Storage.HeartOfDestruction.Status, 14)


        -- ==========================================
        -- 3. SECRET LIBRARY (Powerful: Proteções Elementais)
        -- ==========================================
        -- Storages de conclusão das linhas de quest dos livros
        player:setStorageValue(Storage.SecretLibrary.LiquidDeath.Questline, 1)
        player:setStorageValue(Storage.SecretLibrary.TheOrderOfTheLion.Questline, 1)
        player:setStorageValue(Storage.SecretLibrary.AsuraPalace.Questline, 1)
        player:setStorageValue(Storage.SecretLibrary.TheMoTAExtension.Questline, 1)

        
        -- Marca que o jogador já recebeu os acessos
        player:setStorageValue(controlStorage, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Imbuements Powerful!")
    end
    
    return true
end

accessImbuements:register()
