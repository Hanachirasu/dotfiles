export LANG=ja_JP.UTF-8

: "zinit" && {
  # https://github.com/zdharma-continuum/zinit

  ### Added by Zinit's installer
  if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
      print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
      command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
      command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
          print -P "%F{33} %F{34}Installation successful.%f%b" || \
          print -P "%F{160} The clone has failed.%f%b"
  fi

  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # Load a few important annexes, without Turbo
  # (this is currently required for annexes)
  zinit light-mode for \
      zdharma-continuum/zinit-annex-as-monitor \
      zdharma-continuum/zinit-annex-bin-gem-node \
      zdharma-continuum/zinit-annex-patch-dl \
      zdharma-continuum/zinit-annex-rust

  ### End of Zinit's installer chunk

  # 入力中のコマンドを履歴ベースで補完する。
  zinit light zsh-users/zsh-autosuggestions

  # 追加のコマンド補完
  zinit light zsh-users/zsh-completions

  # コマンド履歴の検索機能の強化版
  zinit light zdharma-continuum/history-search-multi-word

  # シンタックスハイライト
  zinit light zdharma-continuum/fast-syntax-highlighting

  # Escを2回押すと、現在または以前のコマンドの先頭にsudoを付ける。
  zinit ice wait lucid for snippet OMZ::plugins/sudo/sudo.plugin.zsh

  # 様々な形式のアーカイブファイルを解凍できるextract関数
  zinit ice wait lucid for snippet OMZ::plugins/extract/extract.plugin.zsh

  # Angular CLI snippet
  zinit ice wait lucid for snippet OMZ::plugins/ng/ng.plugin.zsh

  # trans 翻訳コマンド
  zinit ice wait lucid for light soimort/translate-shell

  # docker-compose
  # zinit ice wait lucid from"gh-r" as"program" mv"docker* -> docker-compose"
  # zinit light docker/compose
  # alias dco='docker-compose'
  # zinit ice wait lucid; zinit snippet OMZ::plugins/docker-compose/_docker-compose
}

: "Starship" && {
  which starship > /dev/null || curl -sS https://starship.rs/install.sh | sh
  which starship > /dev/null && eval "$(starship init zsh)"
}

: "zsh ドキュメントURL" && {
  # https://zsh.sourceforge.io/Doc/Release/Parameters.html
  # https://zsh.sourceforge.io/Doc/Release/Options.html
}

: " zsh Parameters" && {
  # 単語の一部と見なす文字（区切り文字にしない文字）
  WORDCHARS="*?.[]~&!#$%^(){}<>"
}

: "zsh Changing Directories" && {
  setopt AUTO_CD                 # ディレクトリ名だけでcdコマンドを実行する
  setopt AUTO_PUSHD              # cd -[TAB] で以前移動したディレクトリの候補を表示する
  setopt PUSHD_IGNORE_DUPS       # AUTO_PUSHD で重複したディレクトリを記録しない
  setopt CHASE_LINKS             # ディレクトリを変更したとき、シンボリックリンクを実体パスに変換する
}

: "zsh Input/Output" && {
  setopt CORRECT                 # コマンドのスペルミスを指摘し修正するか尋ねる
  setopt INTERACTIVE_COMMENTS    # 対話型シェルで'#'コメントを使えるようにする
}

: "zsh Expansion and Globbing" && {
  setopt BRACE_CCL               # ブレース展開機能
  setopt NUMERIC_GLOB_SORT       # ファイル名を辞書順ではなく数字順にソート
  setopt MAGIC_EQUAL_SUBST       # 引数の'='以降でも補完する
}

: "zsh Prompting" && {
  setopt PROMPT_SUBST            # プロンプトでパラメータ展開、コマンド置換、算術展開をする
  setopt TRANSIENT_RPROMPT       # コマンド実行後に右プロンプトを削除する
}

: "zsh Completion" && {
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
}

: "zsh History" && {
  HISTFILE=~/.zsh_history         # 履歴ファイルの保存先
  HISTSIZE=100000                 # メモリに保存される履歴の件数
  SAVEHIST=$HISTSIZE              # 履歴ファイルに保存される履歴の件数
  setopt APPEND_HISTORY           # ヒストリーファイルを上書きせず追加する
  setopt HIST_FIND_NO_DUPS        # 履歴エントリ検索中一度見つけたコマンドを表示しない
  setopt HIST_IGNORE_ALL_DUPS     # 重複するコマンドの古い方を削除する
  setopt HIST_IGNORE_DUPS         # 直前と重複するコマンドを記録しない
  setopt HIST_IGNORE_SPACE        # 先頭がスペースのコマンドを記録しない
  setopt HIST_NO_FUNCTIONS        # 関数定義を記録しない
  setopt HIST_NO_STORE            # history (fc -l) コマンドは記録しない
  setopt HIST_REDUCE_BLANKS       # 余分な空白を削除
  # setopt EXTENDED_HISTORY       # タイムスタンプ機能 ': <開始時間>:<経過秒数>;<コマンド>' の形式で記録される
  # 下記3つの設定は排他的に機能する
  # setopt INC_APPEND_HISTORY       # シェルの終了を待たず, コマンド実行時に記録する
  # setopt INC_APPEND_HISTORY_TIME  # シェルの終了を待たず, コマンド終了時に EXTENDED_HISTORY 形式で記録する
  setopt SHARE_HISTORY            # 履歴を複数端末間で共有, EXTENDED_HISTORY 形式で記録する
}

: "キーバインド" && {
  bindkey ';5D'     backward-word              # Ctrl+Leftで単語区切りで後方移動
  bindkey ';5C'     forward-word               # Ctrl+Right単語区切りで前方移動
  bindkey '^[[Z'    reverse-menu-complete      # Shift+Tabで補完候補を逆順する

  # カーソル位置までの入力から履歴を検索し、カーソル位置を行末に移動する
  autoload -Uz history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey '^p' history-beginning-search-backward-end
  bindkey '^n' history-beginning-search-forward-end
}

: "alias" && {
  alias rm='rm -i'
  alias diff='diff -u'
  alias gdiff='git diff --color-words'
  alias grep='grep --color=auto'

  # apt
  alias apti='sudo apt install'
  alias aptud='sudo apt update'
  alias aptug='sudo apt upgrade'
  alias aptudgy='sudo apt update && sudo apt upgrade -y'

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
  which xclip > /dev/null \
    && alias pbcopy='xclip -selection clipboard' \
    && alias pbpaste='xclip -selection c -o'

  # xmllint
  which xmllint > /dev/null && alias xpath='xmllint --html --xpath 2>/dev/null'

  # thefuck https://github.com/nvbn/thefuck
  # WSLでは、WindowsのPath設定が$PATH変数に追加される影響で動作が遅くなる。
  # そのため、`/etc/wsl.conf`で`[interop] appendWindowsPath = false`の設定をすると良い。
  which thefuck > /dev/null && eval $(thefuck --alias)

  # python
  alias pipug='pip list -o | tail -n +3 | cut -d " " -f 1 | xargs pip install -U'
}

# Wi-Fiでadb接続をする
function adbw {
  ipAddr=$(adb shell "ip addr show wlan0 | grep 'inet ' | sed -e 's/^.*inet //g' -e 's/\/.*$//g'")
  adb tcpip 5555
  adb connect $ipAddr:5555
}

if [[ -d /usr/lib/wsl/lib ]]; then
  # https://github.com/microsoft/WSL/issues/8587#issuecomment-1229170859
  export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH
fi
