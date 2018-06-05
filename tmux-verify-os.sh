if [[ "$OSTYPE" == "darwin"* ]]; then
    tmux source-file /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    tmux source-file /usr/share/powerline/bindings/tmux/powerline.conf
fi

