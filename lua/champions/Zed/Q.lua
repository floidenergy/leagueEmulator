Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = (Vector2:new(getSpellToX(), getSpellToY()) - current):normalize()
    local range = to * 900
    trueCoords = current + range

    addProjectile(trueCoords.x, trueCoords.y)
end

function applyEffects()
    dealPhysicalDamage(getEffectValue(100)+getOwner():getStats():getTotalAd()+(0*getOwner():getStats():getTotalAp()))
    -- TODO this can be fetched from projectile inibin "HitEffectName"
    addMovementSpeedBuff(getOwner(), 50, 10)
    -- addParticleTarget("Zed_Q_tar.troybin", getTarget())
    -- addProjectile(getOwnerX(), getOwnerY())
    -- addProjectileCuston("Zed_Q_tar.troybin", 50, trueCoords.x, trueCoords.y)

    destroyProjectile()
end