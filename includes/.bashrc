# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

if command -v bat>/dev/null; then
    alias cat='bat'
fi

if command -v kubectl>/dev/null; then
    source <(kubectl completion bash)
fi

