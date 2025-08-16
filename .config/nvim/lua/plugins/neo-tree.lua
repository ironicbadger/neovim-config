return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    never_show = { ".git" },
                },
            },
            window = {
                mappings = {
                    ["Z"] = "expand_all_nodes",
                },
                width = 30,
            },
        })
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
        vim.keymap.set("n", "<leader>rv", ":Neotree reveal<CR>", {})
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
    end,
}
