# TODO: 整理する。

# for f (/etc/profile.d/*.sh) { [[ -r $f ]] && source $f } 2> /dev/null

# for f (~/.xsession-errors*) { [[ -f $f ]] && ln -sf /dev/null $f } 2> /dev/null

# export SDKMAN_DIR="$HOME/.sdkman"
# export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
# export KOTLIN_HOME="$SDKMAN_DIR/candidates/kotlin/current"
# export GRADLE_HOME="$SDKMAN_DIR/candidates/gradle/current"
# export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

# Firefox でタッチスクリーンを使ってスクロールするための設定
# export MOZ_USE_XINPUT2=1

# wine
# export WINEARCH=win32

# Added by n-install (see http://git.io/n-install-repo).
# export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# エミュレータの警告を抑制する
# if [[ -d /run/user/1000/snap.android-studio ]]; then
#   rm -rf /run/user/1000/snap.android-studio
#   mkdir -m 0700 /run/user/1000/snap.android-studio
# fi

# google-chrome のキャッシュディレクトリをRAMへ移動する
# if [[ -d ~/.cache/google-chrome ]]; then
#   mkdir -p /dev/shm/cache/chrome
#   rm -rf ~/.cache/google-chrome/Default
#   ln -s /dev/shm/cache/chrome ~/.cache/google-chrome/Default
# fi

path+=(
  ~/bin
  ~/.local/bin
  # $ANDROID_SDK_ROOT/platform-tools/adb
)

# パス配列の重複を削除
typeset -gU cdpath fpath mailpath path
