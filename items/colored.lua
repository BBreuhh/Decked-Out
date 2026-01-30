SMODS.Atlas {
    key = "do_colored",
    path = "Colored.png",
    px = 71, py = 95
}

SMODS.Back {
    key = "orange",
    config = { hands = -1, money = 0, reqmoney = 3 },
    atlas = "do_colored",
    pos = { x = 0, y = 0},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.reqmoney } }
    end,

    calculate = function(self, back, context)
        if context.money_altered and context.from_shop then
            if context.amount < 0 then
                self.config.money = self.config.money + math.abs(context.amount)
                local give = math.floor(self.config.money/self.config.reqmoney)
                self.config.money = math.mod(self.config.money,self.config.reqmoney)
                return { dollars = give }
            end
        end
    end
}

SMODS.Back {
    key = "pink",
    config = { extra_hand_bonus = 0, extra_discard_bonus = 2 },
    atlas = "do_colored",
    pos = { x = 1, y = 0},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra_discard_bonus } }
    end,
}

SMODS.Back {
    key = "cyan",
    config = { size = 1 },
    atlas = "do_colored",
    pos = { x = 2, y = 0},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.size } }
    end,

    apply = function(self, back)
        SMODS.change_voucher_limit(self.config.size)
        SMODS.change_booster_limit(self.config.size)
        change_shop_size(self.config.size)
        G.GAME.inflation = 1
    end
}

SMODS.Back { -- THE PATCH THAT MADE THIS POSSIBLE WAS NOT MADE BY ME, BUT INSTEAD CTEH. CHECK OUT THEIR MOD "CTEH_mod" PLEASE (im credited there :D)
    key = "purple",
    config = { extra_hand_bonus = 0, interest_rate = 3 },
    atlas = "do_colored",
    pos = { x = 0, y = 1},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.interest_rate } }
    end,

    apply = function(self, back)
        G.GAME.interest_rate = self.config.interest_rate
    end
}

SMODS.Back {
    key = "white",
    config = { joker_slot = -1, hands = 1, discards = 1 },
    atlas = "do_colored",
    pos = { x = 1, y = 1},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.size } }
    end,
}

SMODS.Back {
    key = "grey",
    config = { joker_slot = -1, earn = 2 },
    atlas = "do_colored",
    pos = { x = 2, y = 1},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.earn } }
    end,

    calculate = function(self, back, context)
        if context.setting_blind then
            G.GAME.blind.dollars = G.GAME.blind.dollars + self.config.earn
        end
    end
}

SMODS.Back {
    key = "brown",
    config = { joker_slot = 2, no_interest = true, dollars = -16 },
    atlas = "do_colored",
    pos = { x = 0, y = 2},
    unlocked = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars+4 } }
    end,
}