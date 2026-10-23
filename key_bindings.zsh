# This file contains key bindings for K7 zsh theme
#
# Set K7_KEYMAP=vi before sourcing the theme to use vi mode instead of emacs mode.

zmodload zsh/terminfo 2>/dev/null

# Pick the line editing mode; motion keys go to every keymap, editing keys only to insert ones
if [[ $K7_KEYMAP == vi ]]; then
  bindkey -v
  _k7_motion_keymaps=(viins vicmd)
  _k7_edit_keymaps=(viins)
else
  bindkey -e
  _k7_motion_keymaps=(emacs)
  _k7_edit_keymaps=(emacs)
fi

# Bind a widget to several key sequences in the given keymaps, skipping empty ones
_k7_bind() {
  local widget=$1 keymaps=$2 keymap seq
  shift 2
  for keymap in ${(P)keymaps}; do
    for seq in "$@"; do
      [[ -n $seq ]] && bindkey -M $keymap "$seq" $widget
    done
  done
}

# terminals send different codes depending on cursor mode (normal: ^[[, application: ^[O)
# and terminal family (rxvt, linux console), so bind every known variant plus terminfo

# Home, End and Delete keys
_k7_bind beginning-of-line _k7_motion_keymaps "^[[H" "^[OH" "^[[1~" "^[[7~" "$terminfo[khome]"
_k7_bind end-of-line _k7_motion_keymaps "^[[F" "^[OF" "^[[4~" "^[[8~" "$terminfo[kend]"
_k7_bind delete-char _k7_motion_keymaps "^[[3~" "$terminfo[kdch1]"

# Ctrl+Left/Right for word navigation (xterm-like, rxvt, older xterm)
_k7_bind backward-word _k7_motion_keymaps "^[[1;5D" "^[Od" "^[[5D"
_k7_bind forward-word _k7_motion_keymaps "^[[1;5C" "^[Oc" "^[[5C"

# History search with Up/Down arrows
_k7_bind history-beginning-search-backward _k7_motion_keymaps "^[[A" "^[OA" "$terminfo[kcuu1]"
_k7_bind history-beginning-search-forward _k7_motion_keymaps "^[[B" "^[OB" "$terminfo[kcud1]"

# Ctrl+Backspace/Delete to delete word
_k7_bind backward-kill-word _k7_edit_keymaps "^H"
_k7_bind kill-word _k7_edit_keymaps "^[[3;5~" "^[[3^"

# Ctrl+U to clear line
_k7_bind kill-whole-line _k7_edit_keymaps "^U"

unset _k7_motion_keymaps _k7_edit_keymaps
unfunction _k7_bind
