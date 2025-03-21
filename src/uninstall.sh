#!/bin/bash
# This script uninstalls the command "," based on the installation level.

# Function to remove the alias from the user's shell configuration file
remove_alias() {
  SHELL_CONFIG="$HOME/.bashrc"
  if [ -f "$SHELL_CONFIG" ]; then
    sed -i.bak "/alias ,='sudo'/d" "$SHELL_CONFIG"
    echo "Alias ',' removed from $SHELL_CONFIG. Please restart your terminal or run 'source $SHELL_CONFIG' to apply changes."
  else
    echo "Shell configuration file not found. No alias to remove."
  fi
}

# Function to remove the executable from /usr/bin
remove_executable() {
  if [ -f "/usr/bin/," ]; then
    sudo rm -f "/usr/bin/,"
    echo "Executable 'comma' removed from /usr/bin."
  else
    echo "Executable 'comma' not found in /usr/bin."
  fi
}

# Check the installation level
if [ "$1" == "hard" ]; then
  remove_executable
elif [ "$1" == "medium" ]; then
  remove_executable
elif [ "$1" == "soft" ]; then
  remove_alias
else
  echo "Invalid option. Please specify 'hard', 'medium', or 'soft'."
fi