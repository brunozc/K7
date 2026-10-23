# Zsh configuration for K7 theme

# Allows for command substitution in prompts
setopt PROMPT_SUBST

# Disable default virtual environment prompt modification
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Load the key bindings
source "${0:A:h}/key_bindings.zsh"

# Function to get git branch (if in repo)
git_branch() {
  emulate -L zsh
  local branch
  # fall back to the short commit hash on a detached HEAD
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null) || return
  # escape % so the branch name is not read as prompt formatting
  print -r -- $'\uF418'" ${branch//\%/%%}"$'\u007C'
}

# Function to get python venv (if exists)
python_venv() {
  emulate -L zsh
  [[ -n $VIRTUAL_ENV ]] || return
  # Get the project folder name (parent of venv folder)
  local project_name=${VIRTUAL_ENV:h:t}
  # read the version from pyvenv.cfg, which avoids starting python on every prompt
  local line python_version
  if [[ -r $VIRTUAL_ENV/pyvenv.cfg ]]; then
    while IFS= read -r line; do
      if [[ $line =~ '^version(_info)?[[:space:]]*=[[:space:]]*([0-9]+\.[0-9]+\.[0-9]+)' ]]; then
        python_version=$match[2]
        break
      fi
    done < $VIRTUAL_ENV/pyvenv.cfg
  fi
  if [[ -z $python_version && $(python --version 2>/dev/null) =~ '([0-9]+\.[0-9]+\.[0-9]+)' ]]; then
    python_version=$match[1]
  fi
  # print the symbol, the name of the project and the python version (if known)
  print -r -- $'\uE606'" ${project_name//\%/%%}${python_version:+ ($python_version)}"
}

# Set the prompt and right prompt
PROMPT=$'%F{blue} \uF115 %~%f\u007C%F{red}$(git_branch)%f '
RPROMPT=$'%(?.%F{green} \uEAB2 %f.%F{red} \uEA76 %f) %F{blue}$(python_venv)%f'
