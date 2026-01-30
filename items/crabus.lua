SMODS.Atlas {
    key = "do_crabus",
    path = "Crabus.png",
    px = 71, py = 95
}

SMODS.Back {
    crabus = true,
    key = "feature_length",
    config = { 
        vouchers = {"v_seed_money", "v_reroll_glut"}, 
        joker_slot = -3, 
        win_ante = 10 
    },
    atlas = "do_crabus",
    pos = { x = 2, y = 0},
    unlocked = true,

    apply = function(self, back)
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1)*1.2
		SMODS.Edition:take_ownership("negative", {
			get_weight = function(self)
				return self.weight * 5
			end,
		}, true)
    end,

    calculate = function(self, back, context)
        if context.ante_change and context.ante_end then
            G.jokers.config.card_limit = G.jokers.config.card_limit+1
        end
    end
}

SMODS.Back {
    crabus = true,
    key = "short",
    config = {
        win_ante = 6, 
    },
    unlocked = true,

    apply = function(self, back)
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1)*1.4
    	G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
                    SMODS.add_card({key = "j_popcorn", no_edition = true, area = G.jokers})
					return true
				end
			end,
		}))
    end,

    calculate = function(self, back, context)
        if context.ante_change and context.ante_end then
            G.jokers.config.card_limit = G.jokers.config.card_limit+1
        end
    end
}

SMODS.Back {
    crabus = true,
    key = "scaling",
    config = {
        chips = 5
    },
    unlocked = true,
    atlas = "do_crabus",
    pos = { x = 1, y = 0},

    calculate = function(self, back, context)
        if context.ante_change and context.ante_end then
            for i,v in ipairs(G.deck.cards) do
                v.ability.perma_bonus = (v.ability.perma_bonus or 0) + self.config.chips
            end
        end
    end
}

SMODS.Back {
    crabus = true,
    key = "loathing",
    unlocked = true,
    atlas = "do_crabus",
    pos = { x = 0, y = 0},

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                add_tag(Tag('tag_ethereal'))
                add_tag(Tag('tag_ethereal'))
                return true
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.ante_change and context.ante_end then
            add_tag(Tag('tag_ethereal'))
        end
    end
}

SMODS.Back {
    crabus = true,
    key = "copycat",
    unlocked = true,

    calculate = function(self, back, context)
        if context.card_added then
            if context.card.ability.set == "Joker" then
                local cards, key = #G.jokers.cards, context.card.config.center.key
                SMODS.destroy_cards(G.jokers.cards)
                for i=1, cards do
                    local newcard = SMODS.create_card({
                        key = key
                    })
                    G.jokers:emplace(newcard)
                end
            end
        end
    end,
}