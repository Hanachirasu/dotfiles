# 環境変数「日本語を使用」
LANG=ja_JP.UTF-8


##################################################
# 色 設定
# for c in {016..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($((c-16))%6)) -eq 5 ] && echo;done;echo

# カラーの読み込み
autoload -Uz colors; colors
# 色の定義
local DEFAULT=$'%{e[m%}'$
local RED=$'%{e[1;31m%}'$
local GREEN=$'%{e[1;32m%}'$
local YELLOW=$'%{e[1;33m%}'$
local BLUE=$'%{e[1;34m%}'$
local PURPLE=$'%{e[1;35m%}'$
local LIGHT_BLUE=$'%{e[1;36m%}'$
local WHITE=$'%{e[1;37m%}'$

# export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"
# 補完候補もLS_COLORSに合わせて色づけ
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

##################################################
# 基本 設定
# 左プロンプト
PROMPT='%B%F{red}%n@%m%f:%F{blue}%~%f%b
%# '
# ２行以上のコマンドの続きで表示。パイプとか
PROMPT2='%#'

# 右プロントに時間表示
#RPROMPT='[%F{WHITE}%*%f]'
# 時刻自動更新
#TRAPALRM () { zle reset-prompt }
#TMOUT=1
# コマンドを実行するときに右プロンプトを消す。他の端末等にコピペするときに便利
#setopt transient_rprompt

# もしかして機能、コマンドのスペルミスを指摘
setopt correct
# 辞書順ではなく数字順に並べる
setopt numeric_glob_sort
# ビープ音を鳴らさない
setopt no_beep
# エスケープシーケンスを通す
setopt prompt_subst
# コマンドラインで # 以降をコメントと見なす
setopt interactive_comments


##################################################
# 自動補完 設定
# 補完機能を有効
autoload -Uz compinit; compinit
# カーソル位置で補完する
setopt complete_in_word
# 補完のときプロンプトの位置を変えない
setopt always_last_prompt
# ディレクトリ名の入力だけで移動できる
setopt auto_cd
# cd -[TAB] で以前移動したディレクトリの候補を提示
setopt auto_pushd
# auto_pushdのディレクトリスタックで重複は記録しない
setopt pushd_ignore_dups
# 補完候補を詰めて表示
setopt list_packed
# 補完候補が複数ある時に、一覧表示する
setopt auto_list
#  auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types
# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完する
setopt magic_equal_subst
# 複数リダイレクト有効
setopt multios
# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
# 自動補完される余分なカンマなどを適宜削除してスムーズに入力できるようにする
setopt auto_param_keys
# 拡張glob # ~ ^ の3文字を正規表現として扱う
setopt extended_glob
# ディレクトリの最後のスラッシュを自動で削除する
setopt autoremoveslash

# シンボリックリンクは実体を追うようになる
# setopt chase_links
#  rm * などの際、確認を求める機能を無効化する
# setopt rm_star_silent

# sudoの後ろでも補完できるようにする
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# 大文字・小文字を区別しないで補完するが、大文字を入力した場合は区別する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## zstyle ':completion:*:*:*:*:*' menu select
## 補完侯補をメニューから選択する
## select=2: 補完候補を一覧から選択する
## ただし、補完候補が2つ以上なければすぐに補完する
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
## 補完関数の表示を強化
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true
# セパレータを指定する
zstyle ':completion:*' list-separator '-->'


##################################################
# history 設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# rootは履歴を保存しない
if [ $UID = 0 ]; then
unset HISTFILE
SAVEHIST=0
fi
# スペースで始まるコマンド行は追加しない
setopt hist_ignore_space
# 開始時刻と実行時間を記録
setopt extended_history
# 履歴を複数端末間で共有
setopt share_history
# 複数のzshを同時に使う時などhistoryファイルに上書きせず追加
setopt append_history
# 余分な空白を削除
setopt hist_reduce_blanks
# 直前と重複するコマンドを記録しない
setopt hist_ignore_dups
# historyコマンドは記録しない
setopt hist_no_store


##################################################
# alias 設定
alias ls='ls -F --color=auto'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -alh'
#alias rm='rm -i'
#alias mv='mv -i'
alias grep='grep --color=auto'
alias -g L='| $PAGER'
alias -g G='| grep'
alias -g V='| vim -R -'
alias diff='diff -u'
alias gdiff='git diff --no-index --color-words'
alias dc='cd ~/Documents'
alias dl='cd ~/Downloads'

##################################################
## インストーラーによって追加された行
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kai/.sdkman"
[[ -s "/home/kai/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kai/.sdkman/bin/sdkman-init.sh"
