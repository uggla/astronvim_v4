-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "html",
      "json",
      "lua",
      "python",
      "rust",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
