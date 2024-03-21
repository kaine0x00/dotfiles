require('tokyonight').setup({
	style = "night",
	transparent = true,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
})

function ColorMyPencils(color) 
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
