" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off

" syntaxを有効に
syntax on
" vi互換無効
set nocompatible
"新しい行のインデントを現在行と同じにする
set autoindent
"クリップボードをWindowsと連携
set clipboard=unnamed
"タブの代わりに空白文字を挿入する
set expandtab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"インクリメンタルサーチを行う
set incsearch
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 検索文字をハイライト
set hlsearch
" 括弧の対応をハイライト
set showmatch
" 入力中のコマンドを表示
set showcmd
" 行送り
set scrolloff=5
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set softtabstop=0
" ステータスライン関連
set laststatus=2
" 折りたたみをマーカーで
set fdm=marker
" Tabを可視化する
set list
set listchars=tab:>.,trail:_
" カーソルライン
set cursorline
"encoding
set encoding=utf-8
set fileencodings=utf-8
"php文法チェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 

" 引用符, 括弧の設定
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap <> <><Left>

" php文法オプション
" 関数で折りたたみ可能
let php_folding=1
" SQLをハイライト
let php_sql_query=1
" htmlをハイライト
let php_htmlInStrings=1

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" 下のbarにカラー付きで情報を出してくれる
NeoBundle 'itchyny/lightline.vim'
" window sizeを簡単に変える (C-eがデフォルト)
NeoBundle 'jimsei/winresizer'
" vimからgitが使える
NeoBundle 'tpope/vim-fugitive'
" %で括弧だけじゃなく、if end なども行き来できるようになる
NeoBundle 'ruby-matchit'
" 特定の文字列を+で切り替える事ができる。
NeoBundle 'AndrewRadev/switch.vim'
" ペーストするさいに、自動でset pasteする
NeoBundle 'ConradIrwin/vim-bracketed-paste'

" ------------------------------------
" lightline.vim
" ------------------------------------
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \   'filename': expand('%'),
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" ------------------------------------
" switch.vim
" ------------------------------------
nnoremap ! :Switch<CR>

if filereadable(expand($HOME.'/.vimrc_local'))
  source $HOME/.vimrc_local
endif

" ファイルタイプ関連を有効にする
filetype plugin indent on
