local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.add({
    { "<leader>f", group = "telescope" },
    { "<leader>ff", builtin.find_files, desc = "find files" },
    { "<leader>fg", builtin.live_grep, desc = "live grep" }
})
