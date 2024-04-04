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

vim.keymap.set("n", "<leader>lt", ":lua require('lsp-inlayhints').toggle()<CR>", { desc = "Toggle inlayhints" })

vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })

vim.keymap.set(
  "x",
  "<leader>re",
  function() require("refactoring").refactor "Extract Function" end,
  { desc = "Extract function" }
)
vim.keymap.set(
  "x",
  "<leader>rf",
  function() require("refactoring").refactor "Extract Function To File" end,
  { desc = "Extract function to file" }
)
-- Extract function supports only visual mode
vim.keymap.set(
  "x",
  "<leader>rv",
  function() require("refactoring").refactor "Extract Variable" end,
  { desc = "Extract variable" }
)
-- Extract variable supports only visual mode
vim.keymap.set(
  "n",
  "<leader>rI",
  function() require("refactoring").refactor "Inline Function" end,
  { desc = "Inline function" }
)
-- Inline func supports only normal
vim.keymap.set(
  { "n", "x" },
  "<leader>ri",
  function() require("refactoring").refactor "Inline Variable" end,
  { desc = "Inline variable" }
)
-- Inline var supports both normal and visual mode
vim.keymap.set(
  "n",
  "<leader>rb",
  function() require("refactoring").refactor "Extract Block" end,
  { desc = "Extract block" }
)
vim.keymap.set(
  "n",
  "<leader>rbf",
  function() require("refactoring").refactor "Extract Block To File" end,
  { desc = "Extract block to file" }
)
-- Extract block supports only normal mode

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

P = function(v)
  print(vim.inspect(v))
  return v
end

-- Disable auto_hlsearch
vim.on_key(function() end, vim.api.nvim_create_namespace "auto_hlsearch")
