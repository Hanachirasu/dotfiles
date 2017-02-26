" エンコード
" ------------------------------------------------------------------------
set encoding=utf-8            " vim内部のエンコーディグ
scriptencoding utf-8          " .vimrcのエンコーディング
set fileformat=unix           " 改行コード
set fileformats=unix,dos,mac  " 読み込み時の改行コード
set fileencoding=utf-8        " ファイル保存時の文字コード
" 読み込み時の文字コード
set fileencodings=utf-8,iso-2022-jp-3,euc-jisx0213,cp932,euc-jp,sjis,jis,latin,iso-2022-jp
set ambiwidth=double          " 全角記号の表示が崩れる問題を解決

" ファイル
" ------------------------------------------------------------------------
set nobackup    " バックアップを作成しない
set noswapfile  " スワップファイルを作らない
set hidden      " 保存せずに他のファイルを表示出来るようにする

" 外観
" ------------------------------------------------------------------------
syntax on             " シンタックスハイライト
set ruler             " カーソル位置を表示
set cursorline        " カーソル行を強調
"set cursorcolumn      " カーソル列を強調
set number            " 行番号表示
set wrap              " 行を折り返す
set display=lastline  " 一行が長くても正しく描画するオプション
" 不可視文字を表示
set list listchars=tab:›\ ,extends:>,trail:-,precedes:<,eol:↲
set showmatch         " 対応する括弧をハイライト表示
set matchtime=1       " 対応する括弧のペアをハイライト表示する時間
" 対応する括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
" 長い行を省略しない、印字不可能文字を16進数で表示
set display=lastline,uhex
set title           " ウィンドウタイトルを表示

" ステータスライン
" ------------------------------------------------------------------------
set laststatus=2  " 常に表示
" 左側の表示
set statusline=%F%m%r%h%w
" 右側の表示
set statusline+=%=%l,%L\ [%{&fileformat}][%{&fileencoding!=''?&fileencoding:&encoding}]%y[ASCII=%B]

" インデント
" ------------------------------------------------------------------------
" タブ幅の設定
set expandtab       " タブ入力を空白に置き換える
set tabstop=4       " タブ幅
" 自動インデント
set autoindent smartindent
set shiftround      " インデントをオプション 'shiftwidth' の値の倍数に丸める
set shiftwidth=4    " 自動インデントで増減する幅

" 検索
" ------------------------------------------------------------------------
set ignorecase        " 大文字と小文字を区別しない
set smartcase         " 大文字のみの場合は区別する
set incsearch         " 1文字入力ごとに検索
set wrapscan          " 行末まで検索したら行頭に戻る
set hlsearch          " 検索結果をハイライト
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>|  " Esc 連打でハイライト無効
nnoremap <C-c><C-c> :<C-u>nohlsearch<CR><Esc>|  " C-c 連打でハイライト無効

" 編集
" ------------------------------------------------------------------------
set backspace=indent,eol,start  " バックスペースで何でも消せるようにする

" 補完
" ------------------------------------------------------------------------
set infercase       " 大文字と小文字を区別しない
set pumheight=10    " 補完メニューの高さ

" コマンド
" ------------------------------------------------------------------------
set history=1000    " コマンドを記録する数
set wildmenu        " コマンドの候補を表示

" キーマッピング
" ------------------------------------------------------------------------
" カーソルを表示行単位で移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" 逆の操作
nnoremap gj j
nnoremap gk k

" クリップボードからコピペする際のインデントのズレを防ぐ
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
      set paste
      return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
