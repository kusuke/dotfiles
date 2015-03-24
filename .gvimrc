"カラースキーマ
highlight Visual guibg=#0077B2
:colorscheme hybrid

"初期ディレクトリ
:cd ~

"透過
gui
set transparency=224

" ウィンドウサイズの変更キーを簡易化する
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')


" Rictyフォントできたら
set guifont=Inconsolata_for_Powerline:h12:cANSI

" フォント
"set guifont=Ricty:h12