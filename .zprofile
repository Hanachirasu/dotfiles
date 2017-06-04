export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

export PATH=$PATH:~/bin
export JAVA_HOME=~/.sdkman/candidates/java/current
export KOTLIN_HOME=~/.sdkman/candidates/kotlin/current/bin
export WINEARCH=win32

if [ ! -h $HOME/.xsession-errors ]
then
  /bin/rm $HOME/.xsession-errors
  ln -s /dev/null $HOME/.xsession-errors
fi

if [ ! -h $HOME/.xsession-errors.old ]
then
  /bin/rm $HOME/.xsession-errors.old
  ln -s /dev/null $HOME/.xsession-errors.old
fi
