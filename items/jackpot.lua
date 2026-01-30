local function getrarity(num) -- takes number between 0 and 4 and outputs rarity
    if num == 0 then return "do_basic"
    elseif num == 1 then return 0.3
    elseif num == 2 then return 0.8
    elseif num == 3 then return 1
    elseif num == 4 then return false 
    else return "do_mythic" end
end

SMODS.Back {
    key = "jackpot",
    unlocked = true,
    config = {odds = 2},

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.odds } }
    end,

    calculate = function(self, back, context)
        if context.card_added then
            if context.card.ability.set == "Joker" and not context.card.jackpotted and pseudorandom("jackpot") < 1/self.config.odds then
                local rarities = {getrarity(context.card.config.center.rarity-1),getrarity(context.card.config.center.rarity+1)}
                if type(context.card.config.center.rarity) == "number" then
                    SMODS.destroy_cards(context.card, true, true, true)
                    local rarity = pseudorandom_element(rarities, "jackerpot")
                    local newcard = SMODS.create_card({
                        set = "Joker", 
                        area = G.jokers, 
                        rarity = rarity or nil,
                        legendary = not rarity
                    })
                    G.jokers:emplace(newcard)
                end
            end
        end
    end,
}

SMODS.Rarity {
    key = "basic",
    loc_txt = {name="Basic"},
    pools = {
        ["Joker"] = {weight = 0}
    },
    badge_colour = HEX("636363")
}

SMODS.Rarity {
    key = "mythic",
    loc_txt = {name="Mythic"},
    pools = {
        ["Joker"] = {weight = 0}
    },
    badge_colour = HEX("d63838")
}

SMODS.Joker {
    key = "badjoker",
    rarity = "do_basic",
    config = {
        extra = {
            money = -1,
            mult = 3
        }
    },
    cost = 0,   

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.money,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {dollars = card.ability.extra.money, mult = card.ability.extra.mult}
        end
    end
}

SMODS.Joker {
    key = "exchange",
    rarity = "do_basic",
    config = {
        extra = {
            chips = 15,
            mult = -1
        }
    },
    cost = 0,   

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = card.ability.extra.chips, mult = card.ability.extra.mult}
        end
    end
}

SMODS.Joker {
    key = "loweredfist",
    rarity = "do_basic",
    cost = 0,   

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = G.hand.cards[#G.hand.cards].base.nominal}
        end
    end
}

SMODS.Joker {
    key = "trade",
    rarity = "do_basic",
    config = {
        extra = {
            chips = -10,
            mult = -1,
            money = 2
        }
    },
    cost = 0,   

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.money
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {chips = card.ability.extra.chips, mult = card.ability.extra.mult, dollars = card.ability.extra.money}
        end
    end
}

SMODS.Joker {
    key = "weak_legs",
    rarity = "do_basic",
    config = {
        extra = {
            chips = 0,
            gain = 4
        }
    },
    cost = 0,   

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.chips,
                card.ability.extra.gain
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            SMODS.destroy_cards(G.hand.cards[#G.hand.cards])
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain
            return {chips = card.ability.extra.chips}
        end
    end
}

SMODS.Joker {
    key = "rattlesnake",
    rarity = "do_basic",
    config = {
        extra = {
            chips1 = 10,
            chips2 = -6,
            target = 0,
        }
    },
    cost = 0,   

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.chips1,
                card.ability.extra.chips2,
            }
        }
    end,

    calculate = function(self,card,context)
        if context.cardarea == G.play and context.individual then
            card.ability.extra.target = 1 - card.ability.extra.target
            if card.ability.extra.target == 1 then
                return {chips = card.ability.extra.chips1}
            else
                return {chips = card.ability.extra.chips2}
            end
        end
    end
}

SMODS.Joker {
    key = "broken_clock",
    rarity = "do_basic",
    config = {
        extra = {
            odds = 24,
            chips = 40,
        }
    },
    cost = 0,   

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.odds,
                card.ability.extra.chips,
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            if G.GAME.probabilities.normal / card.ability.extra.odds < pseudorandom("brokenclock") then
                return card.ability.extra.chips
            end
        end
    end
}

SMODS.Joker {
    key = "spectralium",
    rarity = "do_mythic",
    cost = 50,   
    config = {
        extra = {
            powmult = 1.5
        }
    },

    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                math.floor(G.GAME.round_resets.ante^card.ability.extra.powmult*10)/10,
                card.ability.extra.powmult
            }
        }
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {xmult = math.floor(G.GAME.round_resets.ante^card.ability.extra.powmult*10)/10}
        end
    end
}

SMODS.Joker {
    key = "consumablim",
    rarity = "do_mythic",
    cost = 50,

    calculate = function(self,card,context)
        if context.using_consumeable and (context.consumeable.ability.chaincopies or 0) < 10 then
            local newcard = SMODS.create_card({
                set = context.consumeable.ability.set, 
                area = G.consumeables, 
            })
            newcard.ability.chaincopies = (context.consumeable.ability.chaincopies or 0) + 1
            G.consumeables:emplace(newcard)
            return {
                message = newcard.ability.chaincopies.."!",
            }
        end
    end
}