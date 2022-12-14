Vector2 = require 'Vector2' -- include 2d vector lib 

function finishCasting()
    local current = Vector2:new(getOwnerX(), getOwnerY())
    local to = Vector2:new(getSpellToX(), getSpellToY()) - current
    local trueCoords
	
    local maxRang = 450

    if to:length() > maxRang then
        to = to:normalize()
        local range = to * maxRang
        trueCoords = current:copy() + range
    else
        trueCoords = Vector2:new(getSpellToX(), getSpellToY())
    end
	-- addParticle("Zed_ShadowSink.troybin", getOwnerX(), getOwnerY())
	addParticle("global_ss_flash.troy", getOwnerX(), getOwnerY())
	trueCoords.x, trueCoords.y = getClosestTerrainExit(getOwner(), trueCoords.x, trueCoords.y, false)
    teleportTo(trueCoords.x, trueCoords.y)
	addParticleTarget("global_ss_flash_02.troy", getOwner())
    -- addParticleTarget("Zed_ShadowSink.troybin", getOwner())
end

function applyEffects()
end