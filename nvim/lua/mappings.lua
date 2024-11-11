local map = vim.keymap.set

-- windows navigations
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- file operations
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- cheatsheet
map("n", ",ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- buffer navigations and controls
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", ",x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- comments
map("n", ",/", "gcc", { desc = "toggle comment", remap = true })
map("v", ",/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", ",e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", ",fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", ",fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", ",fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", ",ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", ",fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", ",fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", ",cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", ",gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", ",pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", ",th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", ",ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  ",fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
