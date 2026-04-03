local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMOKE)

combat:setArea(createCombatArea(CrossBeamArea3X3))

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:name("Generic T Shape Smoke")
spell:words("###generic_t_shape_smoke###")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(true) 
spell:register()