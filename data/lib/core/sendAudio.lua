-- IMPORTANTE: Para utiliza??o basta chamar a fun??o doSendSound no script desejado. Seja Spell, Di?logo com NPC ou qualquer outro momento
-- Constante do Extended OpCode. Deve ser o mesmo valor do Client
-- EXEMPLOS DE USO:
-- doSendSound(cid, "itemEff/radar.ogg")
-- doSendSound(cid, "spell/fireball.mp3", 0.5, 0, 1, false, SoundChannels.TargetSpell)
-- PS.: O ?udio deve estar na pasta /data/sounds/ do client
GameAudioServer = 150

-- Constantes que identificam os canais de ?udio. Devem estar presentes no client tamb?m
SoundChannels = {
    Music = 1,
    Ambient = 2,
    Effect = 3,
    TargetSpell = 4,
    AreaSpell = 5,
    BeamSpell = 6,
    SpecialSpell = 7
}

-- audioPath Enviar audioPath = " " para parar efeito
-- Se notSendSpectator for true, n?o enviar? para os players Proximos
-- O Volume deve ser um valor entre 0 e 1
-- O valor de Channel esta na constante SoundChannels. Caso nenhum valor seja passado, o padr?o ser? SoundChannels.Effect
function doSendSound(cid, audioPath, volume, fadeTime, pitch, notSendSpectator, channel)
    local player = Player(cid)
    if (not player) then
        return false
    end

    if (audioPath == nil or #audioPath == 0 or audioPath == '') then
        return false
    end

    -- O Volume deve ser um valor entre 0 e 1
    if (volume == nil or volume < 0) then
        volume = 0.5
    end

    if (fadeTime == nil or fadeTime < 0) then
        fadeTime = 0
    end

    if (pitch == nil or pitch < 0) then
        pitch = 0
    end

	if (channel == nil or channel <= 0) then
		channel = SoundChannels.Effect
	end

    local buffer = audioPath .. "|" .. volume .. "|" .. fadeTime .. "|" .. pitch .. "|" .. channel

    player:sendExtendedOpcode(GameAudioServer, buffer)

    local spectators = Game.getSpectators(player:getPosition(), false, true, 3, 3, 3, 3)

    if (notSendSpectator) then
        return true
    end

	-- Envia o ?udio para players pr?ximos
    for _, spectator in ipairs(spectators) do
        if (isPlayer(spectator) and spectator ~= player) then
            spectator:sendExtendedOpcode(GameAudioServer, buffer)
        end
    end

end
