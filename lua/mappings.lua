local nkey = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

-- basic keymaps
nkey("n", "<space>w", ":w<CR>", opts)
nkey("n", "<space>q", ":x<CR>", opts)
nkey("n", "<space>d", ":bd<CR>", opts)
nkey("n", "<space>c", ":clo<CR>", opts)

-- theprimeagen greatest keymaps
nkey("v", "J", ":m '>+1<CR>gv=gv'")
nkey("v", "K", ":m '<-2<CR>gv=gv'")
nkey("x", "<space>p", '"_dP')

nkey("n", "<space>r", ":%s/\\<<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")

-- asbjornHaland greatest keymaps
nkey("v", "<space>y", '"+y') -- copy things system's clipboard wide

-- telescope
nkey("n", "ff", ":Telescope find_files hidden=true<CR>", opts)
nkey("n", "fb", ":Telescope buffers<CR>", opts)
nkey("n", "fg", ":Telescope live_grep<CR>", opts)

-- native lsp
nkey("n", "gd", function()
	vim.lsp.buf.definition()
end, opts)
nkey("n", "gh", function()
	vim.lsp.buf.hover()
end, opts)
nkey("n", "gr", function()
	vim.lsp.buf.references()
end, opts)
nkey("n", "ga", function()
	vim.lsp.buf.code_action()
end, opts)
nkey("n", "R", function()
	vim.lsp.buf.rename()
end, opts)
nkey("n", "[", function()
	vim.diagnostic.goto_prev()
end, opts)
nkey("n", "]", function()
	vim.diagnostic.goto_next()
end, opts)

-- Lspsaga
nkey("n", "gl", ":Lspsaga show_line_diagnostics<CR>", opts)
