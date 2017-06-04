export LANG=ja_JP.UTF-8

# zplug
# https://github.com/zplug/zplug/blob/master/doc/guide/ja/README.md
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "mollifier/cd-gitroot"
zplug "soimort/translate-shell"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# コマンドをリンクして、PATH に追加し、プラグインを読み込む
zplug load --verbose

# PROMPT
PROMPT="%B%F{red}%n@%m%f:%F{blue}%~%f%b
%# "
PROMPT2="> "

# export LS_COLORS
eval "$(dircolors ~/.dircolors)"

setopt correct                      # もしかして機能、コマンドのスペルミスを指摘
setopt numeric_glob_sort            # 辞書順ではなく数字順に並べる
setopt no_beep                      # ビープ音を鳴らさない
setopt prompt_subst                 # PROMPT変数内で変数参照する
# setopt interactive_comments       # コマンドラインで # 以降をコメントと見なす

# 補完
autoload -Uz compinit; compinit     # 補完機能を有効
setopt complete_in_word             # カーソル位置で補完する
setopt always_last_prompt           # 補完のときプロンプトの位置を変えない
setopt auto_cd                      # ディレクトリ名の入力だけで移動できる
setopt auto_pushd                   # cd -[TAB] で以前移動したディレクトリの候補を提示する
setopt pushd_ignore_dups            # auto_pushdのディレクトリスタックで重複は記録しない
setopt auto_list                    # 補完候補を一覧で表示する
setopt list_packed                  # 補完候補を詰めて表示する
setopt list_types                   # 補完候補でファイルの種類を表示する
setopt auto_menu                    # 補完キー（Tab, Ctrl+I) 連打で補完候補を順に表示する
bindkey "^[[Z" reverse-menu-complete # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
setopt magic_equal_subst            # --prefix=以降でもパス名を補完する

setopt brace_ccl                    # {a-c} を a b c に展開する
# setopt extended_glob              # 拡張glob # ~ ^ の3文字を正規表現として扱う
setopt noautoremoveslash            # パスの最後に付くスラッシュを自動的に削除しない
setopt chase_links                  # シンボリックリンクは実体のパスに変換する

# sudoの後ろでも補完できるようにする
zstyle ":completion:*:sudo:*" command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# 大文字・小文字を区別しないで補完するが、大文字を入力した場合は区別する
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
## 補完侯補をメニューから選択する
## select=2: 補完候補を一覧から選択する
## ただし、補完候補が2つ以上なければすぐに補完する
zstyle ":completion:*:default" menu select=2
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01"
zstyle ":completion:*:*:*:*:processes" command "ps -u `whoami` -o pid,user,comm -w -w"
## 補完関数の表示を強化
zstyle ":completion:*" verbose yes
# zstyle ":completion:*" completer _expand _complete _match _prefix _approximate _list _history
zstyle ":completion:*:messages" format "%F{YELLOW}%d"
zstyle ":completion:*:warnings" format "%F{RED}No matches for:""%F{YELLOW} %d"
zstyle ":completion:*:descriptions" format "%F{YELLOW}completing %B%d%b"
zstyle ":completion:*:options" description "yes"
zstyle ":completion:*:descriptions" format "%F{yellow}Completing %B%d%b%f"
# manの補完をセクション番号別に表示させる
zstyle ":completion:*:manuals" separate-sections true
# セパレータを指定する
zstyle ":completion:*" list-separator "-->"
# zshの補完にもlsコマンドと同じ色を設定
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}

# 履歴
HISTFILE=~/.zsh_history     # ヒストリーファイルの場所
HISTSIZE=100000             # メモリ上に保存される件数
SAVEHIST=1000000            # ファイルに保存される件数
setopt share_history        # 履歴を複数端末間で共有
setopt append_history       # 複数のzshを同時に使う時などhistoryファイルに上書きせず追加
setopt hist_reduce_blanks   # 余分な空白を削除
setopt hist_ignore_dups     # 直前と重複するコマンドを記録しない
setopt hist_no_store        # historyコマンドは記録しない

# alias
alias ls="ls -F --color=auto"
alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -alh"
alias grep="grep --color=auto"
alias -g L="| $PAGER"
alias -g G="| grep"
alias -g V="| vim -R -"
alias diff="diff -u"
alias gdiff="git diff --no-index --color-words"
alias cdu="cd-gitroot"
alias aptup="sudo apt-get update"
alias aptug="sudo apt-get upgrade"
alias apti="sudo apt-get install"
alias pandoc="pandoc -s"
alias open="xdg-open"
alias -s {png,jpg,bmp,PNG,JPG,BMP}="open"

# unarコマンドの代わり
function extract() {
  case $1 in
    *.tar) tar xvf $1;;
    *.tar.gz|*.tgz) tar zxvf $1;;
    *.tar.Z|*.taz) tar Zxvf $1;;
    *.tar.bz2|*.tbz) tar jxvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.arj) unarj $1;;
  esac
}

alias -s {tar,gz,tgz,Z,taz,bz2,tbz,xz,zip,lzh,arj}=extract

# fuck
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"

# SDKMAN
export SDKMAN_DIR=~/.sdkman
[[ -s ~/.sdkman/bin/sdkman-init.sh ]] && source ~/.sdkman/bin/sdkman-init.sh

# AWS Command Completion
[[ -s /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then
  source ~/google-cloud-sdk/path.zsh.inc
fi
# The next line enables shell command completion for gcloud.
if [ -f ~/google-cloud-sdk/completion.zsh.inc ]; then
  source ~/google-cloud-sdk/completion.zsh.inc
fi

clear
