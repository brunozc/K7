# This file contains key bindings for K7 zsh theme

# Enable emacs-like key bindings
bindkey -e

# Home, End and delete keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# Control+Arrow keys for word navigation
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Ctrl+Left/Right for backward and forward word, cross-terminal compatibility
bindkey "^[OD" backward-word
bindkey "^[OC" forward-word

# History search with Up/Down arrows
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Ctrl+Delete/Backspace to delete word
bindkey "^H" backward-kill-word      # Ctrl+Backspace
bindkey "^[[3;5~" kill-word          # Ctrl+Delete

# Ctrl+U to clear line
bindkey "^U" kill-whole-line

