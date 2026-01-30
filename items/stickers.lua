SMODS.Atlas {
    key = "do_stickers",
    path = "Stickers.png",
    px = 71,
    py = 95
}

SMODS.Sticker({
	key = "sticker_decked",
    atlas = "do_stickers",
    pos = {x = 0, y = 0},
	badge_colour = HEX("f7a44a"),
	default_compat = false,
	needs_enable_flag = true,
})

SMODS.Sticker({
	key = "sticker_crabus",
    atlas = "do_stickers",
    pos = {x = 1, y = 0},
	badge_colour = HEX("5b728f"),
	default_compat = false,
	needs_enable_flag = true,
})

SMODS.DrawStep({ -- Code referenced from Multiplayer
	key = "back_decked_out",
	order = 11,
	func = function(self)
		if G.GAME.viewed_back and G.GAME.viewed_back.effect and G.GAME.viewed_back.effect.center.mod then
			if G.GAME.viewed_back.effect.center.mod.id == "DeckedOut" and G.STAGE == G.STAGES.MAIN_MENU then
				G.shared_stickers["do_sticker_decked"].role.draw_major = self
				local sticker_offset = self.sticker_offset or {}
				G.shared_stickers["do_sticker_decked"]:draw_shader(
					"dissolve",
					nil,
					nil,
					true,
					self.children.center,
					nil,
					self.sticker_rotation,
					sticker_offset.x,
					sticker_offset.y
				)
				G.shared_stickers["do_sticker_decked"]:draw_shader(
					"voucher",
					nil,
					self.ARGS.send_to_shader,
					true,
					self.children.center,
					nil,
					self.sticker_rotation,
					sticker_offset.x,
					sticker_offset.y
				)
			end
		end
	end,
	conditions = { vortex = false, facing = "back" },
})

SMODS.DrawStep({
	key = "back_crabus_ideas",
	order = 12,
	func = function(self)
		if G.GAME.viewed_back and G.GAME.viewed_back.effect and G.GAME.viewed_back.effect.center.mod then
			if G.GAME.viewed_back.effect.center.crabus and G.STAGE == G.STAGES.MAIN_MENU then
				G.shared_stickers["do_sticker_crabus"].role.draw_major = self
				local sticker_offset = self.sticker_offset or {}
				G.shared_stickers["do_sticker_crabus"]:draw_shader(
					"dissolve",
					nil,
					nil,
					true,
					self.children.center,
					nil,
					self.sticker_rotation,
					sticker_offset.x,
					sticker_offset.y
				)
				G.shared_stickers["do_sticker_crabus"]:draw_shader(
					"voucher",
					nil,
					self.ARGS.send_to_shader,
					true,
					self.children.center,
					nil,
					self.sticker_rotation,
					sticker_offset.x,
					sticker_offset.y
				)
			end
		end
	end,
	conditions = { vortex = false, facing = "back" },
})