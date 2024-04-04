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
