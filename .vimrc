"vim起動時中に
":source .vimrc　で即時適用

" ====================================================================
set nocompatible				" vi 非互換(宣言)
scriptencoding utf-8			" vimrcのエンコーディング
set encoding=utf-8				" vim 内部のエンコーディグ
set fileencoding=utf-8			" 既定のファイル保存エンコーディング
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,euc-jisx0213,euc-jp,cp932
" ====================================================================



" ====================================================================
" 基本機能設定
" ====================================================================
"set mouse=a		"マウス操作有効
set history=100		"検索パターンを100保存
set nobackup		"バックアップを作成しない

" ---------------------------------------------------------------------
" カラースキーマ設定
" ---------------------------------------------------------------------
set t_Co=256
colorscheme molokai
let g:molokai_original=1
set background=dark

" ====================================================================
" 表示設定
" ====================================================================
syntax on				" 構文ハイライト
set ruler				" カーソル位置表示
set cursorline			" カーソル行をハイライトする
set number				" 行番号表示
set wrap				" 行折り返し しない時はnowrap
set display=lastline	" 一行が長くても正しく描画するオプション
set list				"不可視文字表示
" set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:%,eol:↲ " 不可視文字の表示形式
set listchars=tab:›\ ,extends:>,trail:-,precedes:<,eol:↲

set showmatch						" 対応する括弧をハイライト表示
set matchpairs& matchpairs+=<:>		" 対応する括弧に<>を追加
set matchtime=1						" 対応括弧のハイライト表示を1秒にする

set scrolloff=4			" スクロール時に上下4行を見える様にする
set display=uhex      	" 印字不可能文字を16進数で表示
set title    		 	" ウィンドウタイトルを表示
set cursorline			" カーソル行をハイライトする
set pumheight=10		" 補完メニューの高さ

" ---------------------------------------------------------------------
" インデント
" ---------------------------------------------------------------------
set tabstop=4		" タブの幅4文字分
set softtabstop=4
set shiftwidth=4
"自動インデントを有効
set smartindent
set autoindent

" ====================================================================
" 検索設定
" ====================================================================
set ignorecase					" 大文字/小文字を区別しない
set smartcase					" 大文字があるときだけ区別
set incsearch					" インクリメンタルサーチ
set wrapscan					" ファイルの先頭へループする
set hlsearch					" 検索文字をハイライトする
set wrapscan					" 行末まで検索したら行頭に戻る
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>|	" Esc 連打でハイライト無効
nnoremap <C-c><C-c> :<C-u>nohlsearch<CR><Esc>|	" C-c 連打でハイライト無効

" ====================================================================
" 編集
" ====================================================================
set shiftround						" インデント時にshiftwidth倍に丸める
set infercase						" 補完で大文字小文字を区別しない
set hidden							" バッファを閉じずに隠す(Undo履歴を残す)
set switchbuf=useopen				" 新しく開く代わりに既存バッファを開く
set backspace=indent,eol,start		" バックスペースで何でも消せるようにする
set textwidth=0						" 自動的に改行が入るのを無効化
set formatoptions=q					" (textwidthが設定されても)自動改行しない

" ====================================================================
" ステータスライン表示設定
" ====================================================================
set laststatus=2		" ステータスライン2行表示
" ステータス行の表示設定
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}





