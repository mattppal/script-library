# Add custom scripts to PATH
for dir in $HOME/Developer/scripts/*/; do
  export PATH="$dir:$PATH"
done
export PATH="$HOME/Developer/scripts:$PATH"

# Script aliases
alias scripts="script-index.sh"
alias newscript="new-script.sh"

# Function to run uv scripts
uvrun() {
  if [[ "$1" == *.py ]]; then
    uv run "$1" "${@:2}"
  else
    uv run "$1.py" "${@:2}"
  fi
}
