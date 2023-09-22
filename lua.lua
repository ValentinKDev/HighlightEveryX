local ns = vim.api.nvim_create_namespace('evenoddlines')
local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1

--print("cursor_line " .. cursor_line)

--vim.api.nvim_set_hl(0, "testHLminus5", {bg='#34302C'})
--vim.api.nvim_set_hl(0, "testHLminus5", {bg='#2D2926'})
--vim.api.nvim_set_hl(0, "testHLminus5", {bg='#2D2926'})
vim.api.nvim_set_hl(0, "testHLborder5", {bg='#322E2B'})
vim.api.nvim_set_hl(0, "testHLminus10", {bg='#2B2724'})
vim.api.nvim_set_hl(0, "testHLborder10", {bg='#2D2825'})
--vim.api.nvim_set_hl(0, "testHLborder10", {bg='#292522'})
function onCurrentLineChange()
	local currentLine = vim.fn.line('.')
	local currentBuf = vim.fn.bufnr('%')
  
	-- Check if the line has changed
	if currentLine ~= lastLine then
		-- Your action here
		print("Current line changed to: " .. currentLine .. " / " .. currentBuf)

--	local currentBuf = vim.api.nvim_get_current_buf()
	vim.api.nvim_set_decoration_provider(ns, {
		on_win = function()
		end,
		on_line = function(_, _, currentBuf, row)
--			if (row == cursor_line) then
			if (row <= cursor_line + 4 and row >= cursor_line - 4 and row ~= cursor_line ) then
				vim.api.nvim_buf_set_extmark(currentBuf, ns, row, 0, {
					end_row = row + 1,
					hl_group = 'testHLminus5',
					hl_eol = true,
					ephemeral = true
				})
			elseif (row == cursor_line - 5 or row == cursor_line + 5) then
				vim.api.nvim_buf_set_extmark(currentBuf, ns, row, 0, {
					end_row = row + 1,
					hl_group = 'testHLborder5',
					hl_eol = true,
					ephemeral = true
				})
			elseif (row >= cursor_line - 9 and row <= cursor_line + 9 and row ~= cursor_line ) then
				vim.api.nvim_buf_set_extmark(currentBuf, ns, row, 0, {
					end_row = row + 1,
					hl_group = 'testHLminus10',
					hl_eol = true,
					ephemeral = true
				})
			elseif (row == cursor_line - 10 or row == cursor_line + 10) then
				vim.api.nvim_buf_set_extmark(currentBuf, ns, row, 0, {
					end_row = row + 1,
					hl_group = 'testHLborder10',
					hl_eol = true,
					ephemeral = true
				})
			end
		end,
	})
		-- Update the last known line number
		lastLine = currentLine
	end
end
onCurrentLineChange()

--vim.cmd[[
--  augroup cursor_moved
--    autocmd!
--    autocmd CursorMoved FileName source /home/vkdev/.config/nvim/lua/vkdev/HighlightEveryX/lua.lua 
--  augroup end
--]]

--vim.api.nvim_exec([[
--  augroup CurrentLineChange
--    autocmd!
--    autocmd CursorMoved,CursorMovedI * lua onCurrentLineChange()
--  augroup END
--]], false)

vim.api.nvim_exec([[
  augroup CurrentLineChange
    autocmd!
    autocmd CursorMoved,CursorMovedI * source /home/vkdev/.config/nvim/lua/vkdev/HighlightEveryX/lua.lua
  augroup END
]], false)


--vim.cmd [[augroup cursor_moved]]
--vim.cmd [[autocmd!]]
--vim.cmd [[autocmd CursorMoved FileName source /home/vkdev/.config/nvim/lua/vkdev/HighlightEveryX/lua.lua]]
--vim.cmd [[autogroup END]]


























































