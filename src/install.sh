#!/bin/bash

usage() {
  echo "Usage: $0"
  echo "This script will guide you through the installation of the ',' command interactively."
  exit 1
}

if [ $# -ne 0 ]; then
  usage
fi

SHELL_CONFIG="$HOME/.bashrc"

if [ -f "$HOME/.zshrc" ]; then
  SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bash_profile" ]; then
  SHELL_CONFIG="$HOME/.bash_profile"
fi

OS="$(uname -s)"
case "$OS" in
  Darwin)
    OS="macOS"
    ;;
  Linux)
    OS="Linux"
    ;;
  *)
    echo "Unsupported operating system: $OS"
    exit 1
    ;;
esac

echo "Welcome to the comma command installer!"
echo "Please select an installation level:"
echo "  1. Soft   - Add alias to user's shell configuration file"
echo "  2. Medium (not fully supported)- Install ',' in /usr/bin"
echo "  X. Hard (not supported yet) - Install and enable ',' command without a space"
echo "  q. Quit   - Exit without installing"

read -p "Enter your choice 1/[2-3 or q]: " choice

case $choice in
  3)
    # NOT SUPPORTED YET Hard installation: requires admin privileges
    echo "Installing hard alias..."

    echo "Hard installation complete. You can now use ',' without a space."
    ;;
  
  2)
    # NOT SUPPORTED YET Medium installation: install , in /usr/bin
    echo "Installing medium alias..."
    echo " cp $(dirname "$0")/," /usr/bin/,
    echo "Medium installation complete. You can now use ',' as a command."
    ;;
  
  1)
    # Soft installation: add alias to shell config
    if [ -f "$SHELL_CONFIG" ]; then
      echo "Adding alias to $SHELL_CONFIG..."
      echo "alias ,='sudo'" >> "$SHELL_CONFIG"
      echo "Alias ',' added to $SHELL_CONFIG. Please restart your terminal or run 'source $SHELL_CONFIG' to apply changes."
    else
      echo "Shell configuration file not found at $SHELL_CONFIG."
      echo "Would you like to:"
      echo "  1. Create the file"
      echo "  2. Specify a different shell configuration file"
      read -p "Enter your choice [1-2]: " config_choice
      
      case $config_choice in
        1)
          echo "Creating $SHELL_CONFIG..."
          echo "alias ,='sudo'" > "$SHELL_CONFIG"
          echo "File created with alias. Please restart your terminal or run 'source $SHELL_CONFIG' to apply changes."
          ;;
        2)
          read -p "Please enter the path to your shell configuration file: " new_config
          if [ -f "$new_config" ]; then
            echo "alias ,='sudo'" >> "$new_config"
            echo "Alias ',' added to $new_config. Please restart your terminal or run 'source $new_config' to apply changes."
          else
            echo "File not found. No changes made."
          fi
          ;;
        *)
          echo "Invalid option. No changes made."
          ;;
      esac
    fi
    ;;
  
  q|Q)
    echo "Installation cancelled."
    exit 0
    ;;
  
  *)
    echo "Invalid option."
    usage
    ;;
esac

echo "Thank you for installing ,"