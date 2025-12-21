DeckedOut = SMODS.current_mod

SMODS.Atlas {
    key = "do_colored",
    path = "Colored.png",
    px = 71, py = 95
}

NFS.load(DeckedOut.path.."localization/en-us.lua")()
NFS.load(DeckedOut.path.."items/colored.lua")()