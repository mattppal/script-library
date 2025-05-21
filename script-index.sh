#!/bin/bash
# Description: Lists all available scripts with descriptions
echo "Available Scripts:"
echo "-----------------"
for script in $(find ~/Developer/scripts -type f -name "*.sh" -o -name "*.py" | sort); do
  if [ -x "$script" ]; then
    description=$(grep "# Description:" "$script" | sed 's/# Description: //')
    name=$(basename "$script")
    if [ ! -z "$description" ]; then
      printf "%-30s - %s\n" "$name" "$description"
    fi
  fi
done
