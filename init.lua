-----------------------------
-- 表示
-----------------------------
-- 行番号
vim.opt.number = true
-- カーソル位置
vim.opt.ruler = true
-- カーソルのある行を強調
vim.opt.cursorline = true
-- カーソルのある列を強調
vim.opt.cursorcolumn = true
-- 画面端で行を折り返さない
vim.opt.wrap = false
-- 可視化
vim.opt.list = true
vim.opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'}

-----------------------------
-- インデント
-----------------------------
-- タブ文字を複数の空白入力に置き換え
vim.opt.expandtab = true
-- タブ文字が画面上で占める幅
vim.opt.tabstop = 2
-- タブキーやバックスペースキーを押したときのスペース挿入/削除数
vim.opt.softtabstop = 2
-- 自動でインデントが挿入されるときの幅
vim.opt.shiftwidth = 2
-- 改行時に前の行のインデントを継続
vim.opt.autoindent = true
-- 改行時に入力された行の末尾に合わせて次の行のインデントを増減
vim.opt.smartindent = true

-----------------------------
-- スクロール
-----------------------------
-- 8行余裕があるうちに上下スクロール
vim.opt.scrolloff = 8
-- 16文字余裕があるうちに左右スクロール
vim.opt.sidescrolloff = 16
-- 左右スクロールの単位
vim.opt.sidescroll = 1
-- C-d, C-uでスクロールする行数を指定
vim.opt.scroll = 10

-----------------------------
-- remap
-----------------------------
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', [[']], ';')
vim.keymap.set('v', ';', ':')
vim.keymap.set('v', [[']], ';')
vim.keymap.set('n', '<C-k>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>bnext<CR>')

-----------------------------
-- コメント行で改行したときにコメントを引き継ぐ機能をoff
-----------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end,
})

-----------------------------
-- package manager (https://github.com/folke/lazy.nvim)
-----------------------------
require("config.lazy")
