#!/usr/bin/env bash

OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
esac

echo "Detected OS: $MACHINE"

if [ "$MACHINE" = "Linux" ]; then
    # Linux installation (Ubuntu/Debian)
    if [ "$EUID" -ne 0 ]; then
        echo "./install.sh must be run under root on Linux!"
        exit 1
    fi

    echo "Installing LaTeX packages for Linux..."
    apt install -y texlive-latex-base
    apt install -y texlive-fonts-recommended
    apt install -y texlive-bibtex-extra
    apt install -y texlive-fonts-extra
    apt install -y texlive-latex-extra
    apt install -y texlive-lang-cyrillic
    apt install -y inkscape
    apt install -y latexmk

elif [ "$MACHINE" = "Mac" ]; then
    # macOS installation
    echo "Installing LaTeX packages for macOS..."

    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Install LaTeX packages using Homebrew
    brew install --cask mactex
    brew install --cask latexit
    brew install inkscape
    brew install latexml

    echo "LaTeX installation completed for macOS!"
    echo "Note: MacTeX installation may take some time as it's a large package."
    echo "Note: You may need to delete the line \"\endinput\" in the file /usr/local/texlive/2025/texmf-dist/bibtex/bst/gost/ugost2008l.bst"
else
    echo "Unsupported operating system: $MACHINE"
    echo "This script supports Linux and macOS only."
    exit 1
fi

echo "Installation completed successfully!"
