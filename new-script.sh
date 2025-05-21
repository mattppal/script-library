#!/bin/bash
# Description: Creates a new script from template
# Usage: new-script.sh category script-name [type]

if [ $# -lt 2 ]; then
  echo "Usage: new-script.sh category script-name [type]"
  echo "  type: bash (default) or uv"
  exit 1
fi

category=$1
script_name=$2
script_type=${3:-bash}

if [ ! -d ~/Developer/scripts/$category ]; then
  echo "Category $category doesn't exist"
  exit 1
fi

if [ "$script_type" = "bash" ]; then
  script_path=~/Developer/scripts/$category/$script_name.sh
  template=~/Developer/scripts/template.sh
elif [ "$script_type" = "uv" ]; then
  script_path=~/Developer/scripts/$category/$script_name.py
  template=~/Developer/scripts/template-uv.py
else
  echo "Unknown script type: $script_type"
  echo "Supported types: bash, uv"
  exit 1
fi

if [ -f $script_path ]; then
  echo "Script already exists"
  exit 1
fi

cp $template $script_path
sed -i "" "s/# Created: .*/# Created: $(date +%Y-%m-%d)/" $script_path
sed -i "" "s/# Author: .*/# Author: $(whoami)/" $script_path
chmod +x $script_path
echo "Created $script_path"
