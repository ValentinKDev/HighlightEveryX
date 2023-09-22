--vim.cmd("highlight MyBackgroundHighlight guibg=#RRGGBB")

vim.api.nvim_set_hl(0, "testred", {fg='#aa0000',bg='#202020'})
vim.api.nvim_set_hl(0, "testgreen", {fg='#00aa00',bg='#202020'})
vim.api.nvim_set_hl(0, "testblue", {fg='#0000aa',bg='#202020'})
-- Get the buffer number of the current buffer
local bufnr = vim.api.nvim_get_current_buf()

-- Specify the start and end lines where you want to apply the highlight
local start_line = 3
local end_line = 5

-- Specify the column range (optional)
local start_col = 0
local end_col = -1  -- -1 means to the end of the line

-- Apply the background highlight to the specified lines
--vim.api.nvim_buf_add_highlight(bufnr, -1, "testred", start_line - 1, start_col, end_col)
--vim.api.nvim_buf_add_highlight(bufnr, -1, "testgreen", 7 - 1, start_col, end_col)
--vim.api.nvim_buf_add_highlight(bufnr, -1, "testblue", 9 - 1, start_col, end_col)

vim.api.nvim_set_hl(0, "testHLminus5", {bg='#353530'})
vim.api.nvim_set_hl(0, "testNormalBackground", {bg='#505050'})
_PREVIOUS_CURRENT_LINE = 0
function onCurrentLineChange()
	local currentLine = vim.fn.line('.')

--	vim.api.nvim_buf_add_highlight(bufnr, -1, "testHLminus5", _PREVIOUS_CURRENT_LINE + 5, start_col, end_col)
--	vim.api.nvim_buf_add_highlight(bufnr, -1, "testHLminus5", _PREVIOUS_CURRENT_LINE - 5, start_col, end_col)
--	_PREVIOUS_CURRENT_LINE = currentLine
	vim.api.nvim_buf_add_highlight(bufnr, -1, "testHLminus5", currentLine + 5, start_col, end_col)
	vim.api.nvim_buf_add_highlight(bufnr, -1, "testHLminus5", currentLine - 5, start_col, end_col)
end
onCurrentLineChange()


vim.api.nvim_exec([[
  augroup CurrentLineChange
    autocmd!
    autocmd CursorMoved,CursorMovedI * source /home/vkdev/.config/nvim/lua/vkdev/HighlightEveryX/test2.lua
  augroup END
]], false)

--    autocmd CursorMoved,CursorMovedI * source /home/vkdev/.config/nvim/lua/vkdev/HighlightEveryX/lua.lua
--
--vim.cmd [[augroup cursor_moved]]
--vim.cmd [[autocmd!]]
--vim.cmd [[autocmd CursorMoved FileName source /home/vkdev/.config/nvim/lua/vkdev/HighlightEveryX/lua.lua]]
--vim.cmd [[autogroup END]]


