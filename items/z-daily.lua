local day = os.date("%j")+0-- gets current day as a number (1-366)
local hands = math.floor(math.sin(day) + 0.5) % 3 - 1
local discards = math.floor(day * (math.sqrt(5) + 1)) % 3 - 1
local jokers = math.floor(day * (math.sqrt(3) + 2)) % 3 - 1
local hand_bonus = math.floor(1.7 * math.cos(math.pi * day)) % 4
local discard_bonus = math.floor(4 * math.sin(2.7182 * day)) % 4
local no_interest = math.floor(day * (math.sqrt(5) - 1)) % 2 == 1

local numberformat = function(num)
    if num >= 0 then return "+"..num else return num end
end

SMODS.Back {
    key = "daily",
    config = {
        hands = hands,
        discards = discards,
        joker_slot = jokers,
        extra_hand_bonus = hand_bonus,
        extra_discard_bonus = discard_bonus,
        no_interest = no_interest
    },

    loc_vars = function(self, info_queue, back)
        return { vars = { 
            numberformat(self.config.hands),
            numberformat(self.config.discards),
            numberformat(self.config.joker_slot),
            numberformat(self.config.extra_hand_bonus),
            numberformat(self.config.extra_discard_bonus),
            self.config.no_interest and "gain" or "gain no"
        }}
    end,

}