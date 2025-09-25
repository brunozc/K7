# Zsh configuration for K7 theme

# Allows for command substitution in prompts
setopt PROMPT_SUBST

# Load the key bindings
source ./key_bindings.zsh

# Function to get git branch (if in repo)
git_branch() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
      echo $'\uF418'" $branch"$'\u007C'
    fi
  fi
}

# Function to get python venv (if exists)
python_venv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    # Get the project folder name (parent of venv folder)
    local project_name=$(basename $(dirname $VIRTUAL_ENV))
    # Get the python version
    local python_version=$(python --version 2>&1 | cut -d' ' -f2)
    # echo the symbol, the name of the project and the python version
    echo $'\uE606'" $project_name ($python_version)"
  fi
}

# Set the prompt and right prompt
PROMPT=$'%F{blue} \uF115 %~%f\u007C%F{red}$(git_branch)%f '
RPROMPT=$'%(?.%F{green} \uEAB2 %f.%F{red} \uEA76 %f) %F{blue}$(python_venv)%f'
