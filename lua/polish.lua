-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Set key bindings
vim.keymap.set("n", "<C-s>", ":w!<CR>")

vim.keymap.set("n", "<esc>", ":noh<return>")

vim.keymap.set("n", "²w", ":lua require'hop'.hint_words({ multi_windows = true })<CR>", { desc = "HopWordMW" })
vim.keymap.set("n", "²c", ":lua require'hop'.hint_char1({ multi_windows = true })<CR>", { desc = "HopChar1MW" })
vim.keymap.set("n", "²l", ":lua require'hop'.hint_lines({ multi_windows = true })<CR>", { desc = "HopLineMW" })
vim.keymap.set("n", "²p", ":lua require'hop'.hint_patterns({ multi_windows = true })<CR>", { desc = "HopPatternMW" })
vim.keymap.set("v", "²w", "<cmd>lua require'hop'.hint_words()<CR>", { desc = "HopWord" })
vim.keymap.set("v", "²c", "<cmd>lua require'hop'.hint_char1()<CR>", { desc = "HopChar1" })
vim.keymap.set("v", "²l", "<cmd>lua require'hop'.hint_lines()<CR>", { desc = "HopLine" })
vim.keymap.set("v", "²p", "<cmd>lua require'hop'.hint_patterns()<CR>", { desc = "HopPattern" })

vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })

vim.keymap.set("v", "<leader>lb", ":!black-macchiato<CR><CR>", { desc = "Black macchiato" })

vim.api.nvim_create_augroup("columns-python", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Add colorcolums at 79",
  group = "columns-python",
  pattern = { "python", "rst" },
  command = "setlocal colorcolumn=79",
})

vim.api.nvim_create_augroup("remember-cursor-position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Remember cursor position",
  group = "remember-cursor-position",
  pattern = "*",
  command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

vim.g["grammalecte_cli_py"] = "/usr/bin/grammalecte-cli.py"

-- Remap terminal <esc>
vim.cmd ":tnoremap <Esc> <C-\\><C-n>"

-- selene: allow(unused_variable)
-- selene: allow(unscoped_variables)
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Disable auto_hlsearch
vim.on_key(function() end, vim.api.nvim_create_namespace "auto_hlsearch")
