-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local default_opts = { noremap = true, silent = true }

local keymap = function(mode, from, to, opts)
	if not opts then
		opts = default_opts
	end
	vim.keymap.set(mode, from, to, opts)
end

local nkeymap = function(from, to, opts)
	keymap("n", from, to, opts)
end

local ikeymap = function(from, to, opts)
	keymap("i", from, to, opts)
end

nkeymap("zs", ":lua require'telescope.builtin'.spell_suggest()<cr>")
-- nkeymap("<leader><leader>", "%")
ikeymap("jj", "<esc>")

-- these are totally unnecessary (except the last one)
ikeymap("<C-o>l", "<C-k>->")
ikeymap("<C-o>h", "<C-k><-")
ikeymap("<C-o>k", "<C-k>-!")
ikeymap("<C-o>j", "<C-k>-v")
ikeymap("<C-o>H", "<C-k>cH")
ikeymap("<C-o>s", "<C-k>*2")
ikeymap("<C-o>c", "<C-k>Co")
ikeymap("<C-o>ok", "<C-k>OK")
ikeymap("<C-o>r", "🚀")

local hop_ok, hop = pcall(require, "hop")
if hop_ok then
	local directions = require("hop.hint").HintDirection
	local modes = { "n", "o", "x" }
	local opts = { remap = true, silent = true }
	keymap(modes, "f", function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
	end, opts)

	keymap(modes, "F", function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
	end, opts)

	keymap(modes, "t", function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
	end, opts)

	keymap(modes, "T", function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1, current_line_only = true })
	end, opts)

	nkeymap("s", function()
		hop.hint_char2({ direction = directions.AFTER_CURSOR })
	end, opts)

	nkeymap("S", function()
		hop.hint_char2({ direction = directions.BEFORE_CURSOR })
	end, opts)
end

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	}),
})
