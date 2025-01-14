-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 1024, lines = 30000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        spelllang = { "en_us", "fr" },
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]],
        grepformat = "%f:%l:%c:%m",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- esc mapping
        ["<esc>"] = { "<cmd>noh<return>", desc = "No highlight" },

        -- Undotree
        ["<leader><F5>"] = { "<cmd>UndotreeToggle<cr>", desc = "UndotreeToggle" },

        -- hop mappings
        ["²w"] = { function() require("hop").hint_words { multi_windows = true } end, desc = "HopWordMW" },
        ["²c"] = { function() require("hop").hint_char1 { multi_windows = true } end, desc = "HopChar1MW" },
        ["²l"] = { function() require("hop").hint_lines { multi_windows = true } end, desc = "HopLineMW" },
        ["²p"] = { function() require("hop").hint_patterns { multi_windows = true } end, desc = "HopPatternMW" },

        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        ["<leader>r"] = { name = "Refactor" },

        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },

      v = {
        -- hop mappings
        ["²w"] = { function() require("hop").hint_words {} end, desc = "HopWord" },
        ["²c"] = { function() require("hop").hint_char1 {} end, desc = "HopChar1" },
        ["²l"] = { function() require("hop").hint_lines {} end, desc = "HopLine" },
        ["²p"] = { function() require("hop").hint_patterns {} end, desc = "HopPattern" },

        -- Black macchiato
        ["<leader>lb"] = { ":!black-macchiato -l 80<CR><CR>", desc = "Black macchiato" },
      },

      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
