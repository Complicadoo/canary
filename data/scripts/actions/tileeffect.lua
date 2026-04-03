local effects = {
	  --CIDADES
    {position = Position(1101, 1056, 7), text = 'AB DENDRIEL', oneEffect = true},
		{position = Position(1105, 1056, 7), text = 'ANKRAHMUN', oneEffect = true},
		{position = Position(1101, 1054, 7), text = 'CARLIN', oneEffect = true},
		{position = Position(1105, 1054, 7), text = 'DARASHIA', oneEffect = true},
		{position = Position(1101, 1052, 7), text = 'EDRON', oneEffect = true},
		{position = Position(1105, 1052, 7), text = 'FARMINE', oneEffect = true},
		{position = Position(1105, 1050, 7), text = 'ISSAVI', oneEffect = true},
		{position = Position(1101, 1050, 7), text = 'KAZORDOON', oneEffect = true},
		{position = Position(1105, 1048, 7), text = 'LIBERTY BAY', oneEffect = true},
		{position = Position(1101, 1048, 7), text = 'PORT HOPE', oneEffect = true},
		{position = Position(1105, 1046, 7), text = 'ROSHAMUUL', oneEffect = true},
		{position = Position(1101, 1046, 7), text = 'SVARGROND', oneEffect = true},
		{position = Position(1105, 1044, 7), text = 'THAIS', oneEffect = true},
		{position = Position(1101, 1044, 7), text = 'VENORE', oneEffect = true},
		{position = Position(1101, 1042, 7), text = 'YALAHAR', oneEffect = true},
		------
		{position = Position(1103, 1058, 7), text = 'OTHERWORLD', oneEffect = true},
    {position = Position(1094, 1064, 7), text = 'CITIES', oneEffect = true},
		{position = Position(1088, 1061, 7), text = 'CITIZEN', oneEffect = true},
}

local tileeffect = GlobalEvent("Tile Effect")

function tileeffect.onThink(interval)
    for _, tileeffects in pairs(effects) do
        local spectators = Game.getSpectators(tileeffects.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            for i = 1, #spectators do
                spectators[i]:say(tileeffects.text, TALKTYPE_MONSTER_SAY, false, spectators[i], tileeffects.position)
            end
        end
       
    end
    return true
end

tileeffect:interval(2400)
tileeffect:register()

