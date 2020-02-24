for f (/etc/profile.d/*.sh) { [[ -r $f ]] && source $f } 2> /dev/null

for f (~/.xsession-errors*) { [[ -f $f ]] && ln -sf /dev/null $f } 2> /dev/null

path+=(
  ~/bin
  ~/.local/bin
)

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx

export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export KOTLIN_HOME="$HOME/.sdkman/candidates/kotlin/current"
export GRADLE_HOME="$HOME/.sdkman/candidates/gradle/current"

# Firefox でタッチスクリーンを使ってスクロールするための設定
export MOZ_USE_XINPUT2=1

export WINEARCH=win32

# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# エミュレータの警告を抑制する
if [[ -d /run/user/1000/snap.android-studio ]]; then
  rm -rf /run/user/1000/snap.android-studio
  mkdir -m 0700 /run/user/1000/snap.android-studio
fi

# google-chrome のキャッシュディレクトリをRAMディスクへ移動する
if [[ -d $HOME/.cache/google-chrome ]]; then
  mkdir -p /dev/shm/cache/chrome
  rm -rf $HOME/.cache/google-chrome/Default
  ln -s /dev/shm/cache/chrome $HOME/.cache/google-chrome/Default
fi

# パス配列の重複を削除
typeset -gU cdpath fpath mailpath path
