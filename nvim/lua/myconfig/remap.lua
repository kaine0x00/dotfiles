--keymap. Space as mapleader
vim.g.mapleader = " "
-- more time for mapleader
vim.cmd [[:set timeoutlen=7000]]
-- move selected text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Join current line with line below it
vim.keymap.set("n", "J", "mzJ`z")
-- Half page move (down-up)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Just upgraded formatting for search patterns
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Paste on top of highlighted text without losing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Copy to System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Deletes a whole code block
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Dont use Q apparently
vim.keymap.set("n", "Q", "<nop>")
-- formats the code properly
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- Rename all occurrances with the same name (Ex: rename all variables)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Makes script executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Open the terminal
vim.keymap.set("n", "<leader>tt", vim.cmd.terminal)
