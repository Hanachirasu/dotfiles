for i in /etc/profile.d/*.sh ; do
  [ -r $i ] && source $i
done

[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

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

if [[ ! -h $HOME/.xsession-errors ]]; then
  rm $HOME/.xsession-errors
  ln -s /dev/null $HOME/.xsession-errors
fi

if [[ ! -h $HOME/.xsession-errors.old ]]; then
  rm $HOME/.xsession-errors.old
  ln -s /dev/null $HOME/.xsession-errors.old
fi

# エミュレータの警告を抑制する
rm -rf /run/user/1000/snap.android-studio && mkdir -m 0700 /run/user/1000/snap.android-studio

# google-chrome のキャッシュディレクトリをRAMディスクへ移動する
mkdir -p /dev/shm/cache/chrome
if [[ ! -h $HOME/.cache/google-chrome ]]; then
  rm -rf $HOME/.cache/google-chrome/Default
  ln -s /dev/shm/cache/chrome $HOME/.cache/google-chrome/Default
fi
