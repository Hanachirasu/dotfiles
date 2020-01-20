export LANG=ja_JP.UTF-8

# set $LS_COLORS
eval "$(dircolors $HOME/.dircolors)"

################################################################################
#            _             _
#  _____ __ | |_   _  __ _(_)_ __
# |_  / '_ \| | | | |/ _` | | '_ \
#  / /| |_) | | |_| | (_| | | | | |
# /___| .__/|_|\__,_|\__, |_|_| |_|
#     |_|            |___/
#
# https://github.com/zdharma/zinit

if [[ ! -d "$HOME/.zinit" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait blockf lucid
zinit light zsh-users/zsh-completions

zinit ice wait atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait atinit"zpcompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

# trans 翻訳コマンド
zinit ice wait lucid; zinit light soimort/translate-shell

# extract 様々な形式のアーカイブファイルを解凍できる関数
zinit ice wait lucid; zinit snippet OMZ::plugins/extract/extract.plugin.zsh

# Escを2回押すと、現在または以前のコマンドの前にsudoを付ける
zinit ice wait lucid; zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# git のエイリアスと便利関数
# zinit ice wait lucid; zinit snippet OMZ::plugins/git/git.plugin.zsh

# docker-compose のエイリアスと自動補完
if which docker-compose > /dev/null; then
  alias dco='docker-compose'
  zinit ice wait as"completion" lucid
  zinit snippet OMZ::plugins/docker-compose/_docker-compose
fi

################################################################################
#          _                   _   _
#  _______| |__     ___  _ __ | |_(_) ___  _ __  ___
# |_  / __| '_ \   / _ \| '_ \| __| |/ _ \| '_ \/ __|
#  / /\__ \ | | | | (_) | |_) | |_| | (_) | | | \__ \
# /___|___/_| |_|  \___/| .__/ \__|_|\___/|_| |_|___/
#                       |_|

# フォーマットの記法
# %F{color}..%f : 色
# %B..%b        : 太字
# %U..%u        : 下線
# %d            : 説明

# 単語の一部と見なす文字（区切り文字と見なさない文字）
# デフォルト *?_-.[]~=/&;!#$%^(){}<>
WORDCHARS="*?_-.[]~&!#$%^(){}<>"

# Changing Directories
setopt AUTO_CD                 # ディレクトリ名だけでcdコマンドを実行する
setopt AUTO_PUSHD              # cd -[TAB] で以前移動したディレクトリの候補を表示する
setopt PUSHD_IGNORE_DUPS       # AUTO_PUSHD で重複したディレクトリを記録しない
setopt CHASE_LINKS             # ディレクトリを変更したとき、シンボリックリンクを実体パスに変換する

# Input/Output
setopt CORRECT                 # コマンドのスペルミスを指摘し修正するか尋ねる
setopt INTERACTIVE_COMMENTS    # 対話型シェルで'#'コメントを使えるようにする

# Expansion and Globbing
setopt BRACE_CCL               # ブレース展開機能
setopt NUMERIC_GLOB_SORT       # ファイル名を辞書順ではなく数字順にソート
setopt MAGIC_EQUAL_SUBST       # 引数の'='以降でも補完する

# Prompting
setopt PROMPT_SUBST            # プロンプトでパラメータ展開、コマンド置換、算術展開をする
setopt TRANSIENT_RPROMPT       # コマンド実行後に右プロンプトを削除する

# Completion
setopt ALWAYS_LAST_PROMPT      # 補完候補を表示した後でもプロンプトの位置を変えない
setopt AUTO_LIST               # 補完候補のリストを表示する
setopt AUTO_MENU               # TAB連打で候補を選択する
setopt AUTO_PARAM_SLASH        # 補完したディレクトリの末尾にスラッシュを追加する
setopt COMPLETE_IN_WORD        # カーソル位置で補完する
setopt LIST_PACKED             # 補完候補を詰めて表示する
setopt LIST_TYPES              # 補完候補でファイルの種類を表示する

zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' list-separator '-->'

# 補完候補
# zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' completer _complete

# マッチするものがなければ、大文字小文字を無視して再マッチング
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# 大文字小文字を無視してマッチング
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 補完候補リストのグループ化とそのグループの説明を表示する
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group true
zstyle ':completion:*:options' description true
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*'              format '%F{yellow}-- %d --%f'
zstyle ':completion:*:corrections'  format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages'     format '%F{purple} -- %d --%f'
zstyle ':completion:*:warnings'     format '%F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# sudoコマンドの後で補完するためのパス
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# History
HISTFILE=~/.zsh_history         # 履歴ファイルの保存先
HISTSIZE=100000                 # メモリに保存される履歴の件数
SAVEHIST=100000                 # 履歴ファイルに保存される履歴の件数
setopt APPEND_HISTORY           # ヒストリーファイルを上書きせず追加する
setopt HIST_FIND_NO_DUPS        # 履歴エントリ検索中一度見つけたコマンドを表示しない
setopt HIST_IGNORE_ALL_DUPS     # 重複するコマンドの記録時に古い方を削除する
setopt HIST_IGNORE_DUPS         # 直前と重複するコマンドを記録しない
setopt HIST_IGNORE_SPACE        # 先頭がスペースのコマンドを記録しない
setopt HIST_NO_FUNCTIONS        # 関数定義を記録しない
setopt HIST_NO_STORE            # history (fc -l) コマンドは記録しない
setopt HIST_REDUCE_BLANKS       # 余分な空白を削除
unsetopt EXTENDED_HISTORY       # タイムスタンプ機能 ': <開始時間>:<経過秒数>;<コマンド>' の形式で記録される
# 下記3つの設定は排他的に機能する
setopt INC_APPEND_HISTORY         # シェルの終了を待たず, コマンド実行時に記録する
unsetopt INC_APPEND_HISTORY_TIME  # シェルの終了を待たず, コマンド終了時に EXTENDED_HISTORY 形式で記録する
unsetopt SHARE_HISTORY            # 履歴を複数端末間で共有, EXTENDED_HISTORY 形式で記録する

# キーバインドの設定
bindkey ';5D'     backward-word              # 単語区切りで後方移動
bindkey ';5C'     forward-word               # 単語区切りで前方移動
bindkey '^[[Z'    reverse-menu-complete      # Shift+Tabで補完候補を逆順する

# カーソル位置までの入力から履歴を検索し、カーソル位置を行末に移動する
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end

################################################################################
#        _ _
#   __ _| (_) __ _ ___
#  / _` | | |/ _` / __|
# | (_| | | | (_| \__ \
#  \__,_|_|_|\__,_|___/

alias rm="rm -i"
alias diff='diff -u'
alias gdiff='git diff --color-words'
alias grep='grep --color=auto'

# apt
alias apti='sudo apt install'
alias aptug='sudo apt upgrade'
alias aptugy='sudo apt update && sudo apt upgrade -y'
alias aptup='sudo apt update'

# cd
alias ..='cd ..'
alias ....='cd ../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# ls
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -A'
alias la1='ls -A1'
alias ll='ls -hl'
alias lla='ls -Ahl'

# xdg-open
alias open='xdg-open'
alias -s {png,jpg,bmp,PNG,JPG,BMP}='open'

# xclip
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection c -o'

# python
alias python=python3
alias pip=pip3

# global alias
# alias -g C='| pbcopy'
# alias -g G='| grep'
# alias -g H='| head'
# alias -g L='| less -R'
# alias -g T='| tail'

# xmllint
alias xpath='xmllint --html --xpath 2>/dev/null'

# adb
alias adb="$HOME/Android/Sdk/platform-tools/adb"

# Wi-Fiでadb接続をする
function adbw {
  ipAddr=$(adb shell "ip addr show wlan0 | grep 'inet ' | sed -e 's/^.*inet //g' -e 's/\/.*$//g'")
  adb tcpip 5555
  adb connect $ipAddr:5555
}

# thefuck https://github.com/nvbn/thefuck
which thefuck > /dev/null && eval $(thefuck --alias fuck)

# SDKMAN https://sdkman.io/install
export SDKMAN_DIR="$HOME/.sdkman"
[[ ! -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && curl -s "https://get.sdkman.io" | bash
source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# Starship https://github.com/starship/starship
which starship > /dev/null || curl -fsSL https://starship.rs/install.sh | bash -s -- -b "$HOME/bin"
which starship > /dev/null && eval "$(starship init zsh)"
