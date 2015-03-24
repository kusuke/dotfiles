set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" bundleで管理するディレクトリを指定
set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグイン郡
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'grep.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomasr/molokai'
NeoBundle 'kana/vim-submode'
NeoBundle 'vcscommand.vim'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Lokaltog/powerline', {'rtp' : 'powerline/bindings/vim'}

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

let g:vimfiler_enable_auto_cd = 1

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
"" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"powerlineの設定
""""""""""""""""""""""""""""""
" UTF-8 環境でないとうまく表示されない
"set encoding=utf-8
" `fancy' テーマに切り替え
"let g:Powerline_symbols = 'fancy'
""""""""""""""""""""""""""""""

" 入力補完
""""""""""""""""""""""""""""""
" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
""""""""""""""""""""""""""""""

" 表示関連
""""""""""""""""""""""""""""""
" メニューバーを非表示にする
set guioptions-=m
" ツールバーを非表示にする
set guioptions-=T
" 左右のスクロールバーを非表示にする
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
" 水平スクロールバーを非表示にする
set guioptions-=b
"タイトルをバッファ名に変更しない
set notitle
set shortmess+=I
"内容が変更されたら自動的に再読み込み
set autoread

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

"タブ、空白、改行の可視化
set list
set lcs=tab:>_,trail:_,extends:>,precedes:<,nbsp:%

syntax on

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

""""""""""""""""""""""""""""""

" タブ分割関連のキーマップ
""""""""""""""""""""""""""""""
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
""""""""""""""""""""""""""""""

"ここから

let s:is_windows =  has('win16') || has('win32') || has('win64')
let s:is_cygwin  =  has('win32unix')
let s:is_cui     = !has('gui_running')

if s:is_cygwin
  if &term =~# '^xterm' && &t_Co < 256
    set t_Co=256  " Extend terminal color of xterm
  endif
  if &term !=# 'cygwin'  " not in command prompt
    " Change cursor shape depending on mode
    let &t_ti .= "\e[1 q"
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[1 q"
    let &t_te .= "\e[0 q"
  endif
endif

if &t_Co >= 16
  NeoBundle 'bling/vim-airline'
elseif
  set laststatus=2
  set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  NeoBundle 'molok/vim-smartusline'
endif

if !s:is_windows && s:is_cui
  for s:ch in map(
        \   range(char2nr('a'), char2nr('z'))
        \ + range(char2nr('A'), char2nr('N'))
        \ + range(char2nr('P'), char2nr('Z'))
        \ + range(char2nr('0'), char2nr('9'))
        \ , 'nr2char(v:val)')
    exec 'nmap <ESC>' . s:ch '<M-' . s:ch . '>'
  endfor
  unlet s:ch
  map  <NUL>  <C-Space>
  map! <NUL>  <C-Space>
endif

"ここまで

set modifiable
set write

"画面上でタブ文字が占める幅
set tabstop=2
"自動インデントでずれる幅
set shiftwidth=2
"自動インデントを有効化する
set smartindent
set autoindent
"括弧の対応をハイライト
set showmatch

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

"常にカレントディレクトリを同期
au BufEnter * execute ":lcd " . expand("%:p:h")

let g:user_emmet_leader_key='<TAB>'

call neobundle#end()

" Required:
filetype plugin indent on

set guifont=Inconsolata_for_Powerline:h12:cANSI

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck