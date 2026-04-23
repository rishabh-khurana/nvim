-- Blink.cmp
return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			menu = {
				border = "single",
				scrollbar = true,
				draw = {
					columns = {
						{ "kind_icon", "kind",              gap = 1 },
						{ "label",     "label_description", gap = 1 },
					},
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "single",
					scrollbar = true,
				},
			},
		},
		sources = {
			default = { "lsp", "path", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		snippets = {},
		fuzzy = { implementation = "lua" },
		signature = { enabled = true },
	},
}
