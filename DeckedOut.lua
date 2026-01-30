DeckedOut = SMODS.current_mod

local files = NFS.getDirectoryItems(SMODS.current_mod.path.."items")

SMODS.load_file("localization/en-us.lua")
for i,file in ipairs(files) do
    SMODS.load_file("items/"..file)()
end

local old_gcp = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append) 
    local rarity
    if G.GAME.selected_back.effect.center.key == "b_do_heavenly" then
        rarity = _rarity or math.sqrt(pseudorandom('rarity'..G.GAME.round_resets.ante..(_append or ''))) -- incrase rare and uncommon odds if deck is heavenly
    elseif G.GAME.selected_back.effect.center.key == "b_do_feature_length" then
        local baserarity = pseudorandom('rarity'..G.GAME.round_resets.ante..(_append or ''))
        rarity = _rarity or (baserarity > 0.9 and 1 or baserarity) -- increase rare odds if deck is feature-length
    end
    return old_gcp(_type, rarity or _rarity, _legendary, _append)
end