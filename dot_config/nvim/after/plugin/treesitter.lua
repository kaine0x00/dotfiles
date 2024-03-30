vim.filetype.add({
  extension = {
    mdx = 'mdx'
  }
})

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.mdx = "markdown"

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "python", "cpp", "c_sharp", "rust", "lua", "vim", "vimdoc", "query", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
