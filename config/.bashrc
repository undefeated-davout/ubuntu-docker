
# 日本語設定
export LANG=ja_JP.UTF-8

# ctrl + rの逆方向用設定
stty stop undef
stty start undef

# tmux設定
if ! [ "$TMUX" = "" ]; then
    tmux set-option status-bg $(perl -MList::Util=sum -e'print+(red,green,blue,yellow,cyan,magenta,white)[sum(unpack"C*",shift)%7]' $(hostname)) | cat > /dev/null
fi
