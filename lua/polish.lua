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
  desc = "Add colorcolums at 80",
  group = "columns-python",
  pattern = { "python", "rst" },
  command = "setlocal colorcolumn=80",
})

vim.api.nvim_create_augroup("columns-gitcommit", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Add colorcolums at 72",
  group = "columns-python",
  pattern = { "gitcommit" },
  command = "setlocal colorcolumn=72",
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

-- Rebind keys for conflict marker temporary fixing a bug
vim.keymap.set("n", "<leader>xo", ":ConflictMarkerOurselves<CR>)")
vim.keymap.set("n", "<leader>xt", ":ConflictMarkerThemselves<CR>)")
vim.keymap.set("n", "<leader>xb", ":ConflictMarkerBoth<CR>")
vim.keymap.set("n", "<leader>x0", ":ConflictMarkerNone<CR>)")
