local colorscheme = "catppuccin"

local is_ok, _ = pcall(function() vim.cmd("colorscheme " .. colorscheme) end)
if not is_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found!")
    return
end
