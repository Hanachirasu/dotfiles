export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx

#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export JAVA_HOME=~/.sdkman/candidates/java/current
export IDEA_JDK=/usr/lib/jvm/default-java
export KOTLIN_HOME=~/.sdkman/candidates/kotlin/current/bin

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
