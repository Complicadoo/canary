local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local arr = {
    { 0, 0, 0, 1, 1, 1, 0, 0, 0 },
    { 0, 0, 1, 1, 1, 1, 1, 0, 0 },
    { 0, 1, 1, 1, 1, 1, 1, 1, 0 },
    { 0, 1, 1, 1, 3, 1, 1, 1, 0 },
    { 0, 1, 1, 1, 1, 1, 1, 1, 0 },
    { 0, 0, 1, 1, 1, 1, 1, 0, 0 },
    { 0, 0, 0, 1, 1, 1, 0, 0, 0 },
}

local area = createCombatArea(arr)
combat:setArea(area)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:name("werelionfireexplosion")
spell:words("###474") -- Você pode alterar para as palavras mágicas desejadas
spell:needLearn(true)
spell:needDirection(false)
spell:cooldown("2000")
spell:register()