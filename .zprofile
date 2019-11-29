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

# local java_version=$(java -version 2>&1 | head -n 1 | cut -d '"' -f 2 | cut -d '.' -f 1)
# if [[ $java_version -ge 9 ]]; then
#   JAVA_OPTS="$JAVA_OPTS \
# --add-opens=java.base/java.lang=ALL-UNNAMED \
# --add-opens=java.base/java.nio=ALL-UNNAMED \
# --add-opens=java.base/java.lang.invoke=ALL-UNNAMED \
# --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED"
# fi

export WINEARCH=win32

if [[ ! -h $HOME/.xsession-errors ]]; then
  rm $HOME/.xsession-errors
  ln -s /dev/null $HOME/.xsession-errors
fi

if [[ ! -h $HOME/.xsession-errors.old ]]; then
  rm $HOME/.xsession-errors.old
  ln -s /dev/null $HOME/.xsession-errors.old
fi

# rm -rf /run/user/1000/snap.android-studio && mkdir -m 0700 /run/user/1000/snap.android-studio
