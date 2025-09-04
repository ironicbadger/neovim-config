return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "zane-/cder.nvim",
    },
    keys = {
      {
        "<leader>tc",
        ":Telescope cder<cr>",
        desc = "Change Working Directory",
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }}) end, {})
      vim.keymap.set("n", "<leader>fg", function() builtin.live_grep({ vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '-g', '!.git'} }) end, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "zane-/cder.nvim",
    config = function()
      require('telescope').load_extension('cder')
    end
  }
}
