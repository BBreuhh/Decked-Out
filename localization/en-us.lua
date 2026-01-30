return {
    misc = {
        labels = {
            do_sticker_decked = "Decked Out Deck",
            do_sticker_crabus = "Crabus Helped!"
        }
    },

    descriptions = {
        Other = {
            do_sticker_decked = {
                name = "Decked Out Deck",
                text = {
                    "This {C:attention}Deck{} comes from",
                    'the {C:attention}"Decked Out"{} mod'
                }
            },

            do_sticker_crabus = {
                name = "Crabus helped!",
                text = {
                    "{C:chips}Crabus{} either helped with",
                    "the {E:1}sprite{} or the {E:1}idea{} for",
                    "this {C:attention}deck"
                }
            },
        },

        Joker = {
            j_do_badjoker = {
                name = "Bad Joker",
                text = {
                    "{C:mult}+#2#{} Mult",
                    "{C:money}#1#$"
                }
            },

            j_do_exchange = {
                name = "Exchange",
                text = {
                    "{C:chips}+#2#{} Chips",
                    "{C:mult}#1#{} Mult"
                }
            },

            j_do_loweredfist = {
                name = "Lowered Fist",
                text = {
                    "Gives {C:chips}Chips{} equal to the",
                    "{C:chips}Chips{} of the {C:attention}leftmost",
                    "card in {C:attention}hand"
                }
            },

            j_do_trade = {
                name = "Trade",
                text = {
                    "{C:chips}#1#{} Chips",
                    "{C:mult}#2#{} Mult",
                    "{C:money}#3#$"
                }
            },

            j_do_weak_legs = {
                name = "Weak Legs",
                text = {
                    "{C:red}Destroys{} the {C:attention}righmost{} card",
                    "in hand, Gain {C:chips}+#2#{} Chips",
                    "{C:inactive}(currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },

            j_do_rattlesnake = {
                name = "Rattlesnake",
                text = {
                    "Alternates between giving",
                    "{C:chips}+#1#{} and {C:chips}#2#{} Chips for",
                    "every scored {C:attention}card"
                }
            },

            j_do_broken_clock = {
                name = "Broken Clock",
                text = {
                    "{C:green,E:1}1 in #1#{} chance to",
                    "give {C:chips}+#2#{} Chips"
                }
            },

            j_do_spectralium = {
                name = "Spectralium",
                text = {
                    "Gives {X:mult,C:white}XMult{} equal to",
                    "the current {C:attention}Ante{} to the",
                    "power of {C:attention}#2#{} {C:inactive}(Ante^{C:attention}#2#{C:inactive})",
                    "{C:inactive}(currently {X:mult,C:white}X#1#{C:inactive})"
                }
            },

            j_do_consumablim = {
                name = "Consumablim",
                text = {
                    "Whenever a {C:attention}consumable{} is used:",
                    "Create a {C:attention}consumable",
                    "of the same {C:attention}type",
                    "{C:inactive}(Works down to 10 layers)"
                }
            }
        },
        Back = {
            b_do_daily = {
                name = "Daily Deck",
                text = {
                    "Changes effect every day:",
                    "{C:blue}#1#{} Hands and {C:red}#2#{} Discards",
                    "{C:attention}#3#{} Joker slots",
                    "{C:attention}#4#${} per extra {C:blue}Hand",
                    "{C:attention}#5#${} per extra {C:red}Discard",
                    "#6# {C:attention}Interest"
                }
            },

            b_do_jackpot = {
                name = "Jackpot Deck",
                text = {
                    "When obtained, {C:attention}Jokers{} have",
                    "a {C:green,E:1}1 in #1#{} chance into becoming",
                    "a {C:attention}Joker{} of one",
                    "{C:edition,E:1}rarity{} higher or lower"
                }
            },

            b_do_orange = {
                name = "Orange Deck",
                text = {
                    "{C:blue}#1#{} Hand every round",
                    "Earn {C:money}$1{} for every {C:money}$3",
                    "spent in the {C:attention}Shop"
                }
            },

            b_do_pink = {
                name = "Pink Deck",
                text = {
                    "Earn {C:money}$#1#{} per {C:red}Discard",
                    "at the end of round",
                    "Earn no {C:money}money{} from",
                    "extra {C:blue}Hands"
                }
            },

            b_do_cyan = {
                name = "Cyan Deck",
                text = {
                    "+#1# {C:green}Booster{}, {C:green}Voucher{} and",
                    "{C:green}Joker{} slot available",
                    "in the {C:attention}Shop",
                    "{C:attention}All{} Shop items are {C:money}$1",
                    "more {C:attention}expensive"
                }
            },

            b_do_purple = {
                name = "Purple Deck",
                text = {
                    "{C:attention}Interest{} is set",
                    "to {C:money}$1{} per {C:money}$#1#",
                    "Extra {C:blue}Hands{} gives",
                    "no {C:money}money"
                }
            },

            b_do_white = {
                name = "White Deck",
                text = {
                    "{C:attention}-1{} Joker slot",
                    "{C:attention}+1 {C:blue}Hands{} and {C:red}Discards",
                    "every round"
                }
            },

            b_do_grey = {
                name = "Grey Deck",
                text = {
                    "{C:attention}-1{} Joker slot",
                    "Earn an extra",
                    "{C:money}$#1#{} when beating",
                    "a {C:attention}blind"
                }
            },

            b_do_brown = {
                name = "Brown Deck",
                text = {
                    "{C:attention}+2{} Joker slots",
                    "Earn no {C:attention}Interest",
                    "Start with {C:money}#1#$"
                }
            },

            b_do_euchre = {
                name = "Euchre Deck",
                text = {
                    "Start with {E:1}only",
                    "{C:attention}9{} through {C:attention}Ace"
                }
            },

            b_do_perfect = {
                name = "Perfectionist Deck",
                text = {
                    "If played hand isn't",
                    "your {C:attention}most played hand{}:",
                    "{C:red}Destroy{} played cards",
                    "and {C:attention}upgrade{} most",
                    "played hand"
                }
            },

            b_do_heavenly = {
                name = "Heavenly Deck",
                text = {
                    "{C:uncommon}Uncommon{} and {C:rare}Rare",
                    "{C:attention}Jokers{} appears more {C:attention}often"
                }
            },

            b_do_honed = {
                name = "Honed Deck",
                text = {
                    "required score {C:attention}scales slower",
                    "for each {C:attention}Ante",
                    "{C:attention}#1#{} Joker slots"
                }
            },

            b_do_piss = {
                name = "Piss Deck",
                text = {
                    "Scored {C:attention}cards{} give adjacent",
                    "cards a {C:attention}#1#th{} of its base {C:chips}+Chips"
                }
            },

            b_do_feature_length = {
                name = "Feature Length Deck",
                text = {
                    "{C:rare}Rare{} Jokers appear more {C:attention}often",
                    "{C:dark_edition}Negative{} is {X:attention,C:white}X5{} as likely to appear",
                    "Ante scaling is {C:attention}faster",
                    "Beat Ante {C:attention}10{} to {C:edition}win",
                    "{C:attention}-3{} Joker slots, gain {C:attention}+1{} Joker",
                    "slot when {C:red}Boss Blind{} is defeated",
                    "Start with {C:green}Reroll Glut{} and {C:money}Seed Money"
                }
            },

            b_do_scaling = {
                name = "Scaling Deck",
                text = {
                    "When {C:red}Boss Blind{} is defeated:",
                    "{C:attention}All{} playing cards in deck",
                    "gains {C:chips}+5{} Chips {C:attention}permanently"
                }
            },

            b_do_short = {
                name = "Short Deck",
                text = {
                    "Beat Ante {C:attention}6{} to {C:edition}win",
                    "Ante scaling is {C:attention}faster",
                    "Start with {C:common}Popcorn"
                }
            },

            b_do_loathing = {
                name = "Loathing Deck",
                text = {
                    "Start with {C:attention}2 {C:spectral}Ethereal{} tags",
                    "Gain an {C:spectral}Ethereal{} tag upon",
                    "beating a {C:red}boss blind"
                }
            },

            b_do_copycat = {
                name = "Copycat Deck",
                text = {
                    "When obtaining a {C:attention}Joker{}:",
                    "{C:attention}Replace{} every {C:attention}Joker{} with",
                    "the obtained one"
                }
            },
        },
    }
}