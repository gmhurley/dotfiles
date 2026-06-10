eval "$(starship init zsh)"

alias ll='ls -alh'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/work-journal/tools:$PATH"

note() {
  local file="$HOME/work-journal/journal/scratch.md"
  mkdir -p "$(dirname "$file")"

  echo "Dictate your note. Press Enter on an empty line to finish:"

  local text=""
  local line

  while IFS= read -r line; do
    [[ -z "$line" ]] && break
    text+="$line"$'\n'
  done

  [[ -z "$text" ]] && return 0

  {
    echo "## $(date '+%I:%M%p')"
    printf '%s' "$text"
    echo
  } >> "$file"
}

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
