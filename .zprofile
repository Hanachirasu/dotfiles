export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx
fcitx &

export JAVA_HOME=/usr/lib/jvm/default-java
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export IDEA_JDK=$JAVA_HOME
export KOTLIN_HOME=/opt/idea/plugins/Kotlin/kotlinc
path=(
    $KOTLIN_HOME/bin
    $path
)

# .xsession-errors can grow huge... remove it
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
