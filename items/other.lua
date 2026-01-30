SMODS.Atlas {
    key = "do_other",
    path = "Other.png",
    px = 71, py = 95
}

SMODS.Back {
    key = "euchre",
    atlas = "do_other",
    pos = { x = 1, y = 0},
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v.base.id < 9 then
                        SMODS.destroy_cards(v)
                    end
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = "perfect",
    unlocked = true,
    calculate = function(self, back, context)
        if context.before and G.GAME.round_resets.ante > 1 then
            local upgrade = false
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            for k, v in pairs(G.GAME.hands) do
                if k ~= context.scoring_name and v.played >= play_more_than and v.visible then
                    upgrade = true
                end
            end
            if upgrade then
                SMODS.destroy_cards(context.full_hand)
                SMODS.smart_level_up_hand(false, G.GAME.current_round.most_played_poker_hand, false, 1)
            end
        end
    end,
}

SMODS.Back {
    key = "heavenly",
    atlas = "do_other",
    pos = { x = 1, y = 1},
    unlocked = true,
}

SMODS.Back {
    key = "honed",
    unlocked = true,
    config = {joker_slot = -2},
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot } }
    end,
    apply = function(self, back)
        G.GAME.modifiers.scaling = G.GAME.modifiers.scaling*0.4
    end,
}

SMODS.Back {
    key = "piss",
    unlocked = true,
    config = {reciprocal = 50},
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.reciprocal } }
    end,
    calculate = function(self, back, context)
        if context.cardarea == G.play and context.individual then
            local left,right
            for i,v in ipairs(G.play.cards) do
                if v == context.other_card then
                    left = (G.play.cards[i-1] or nil)
                    right = (G.play.cards[i+1] or nil)
                end
            end

            if left then
                left.ability.perma_bonus = left.ability.perma_bonus + context.other_card.base.nominal/self.config.reciprocal
            end
            if right then
                right.ability.perma_bonus = right.ability.perma_bonus + context.other_card.base.nominal/self.config.reciprocal
            end
        end
    end
}