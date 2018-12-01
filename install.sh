#!/bin/bash
echo "Copying to /usr/bin/"
cp tp /usr/bin/tp
echo "Setting an alias under $HOME/.bash_aliases"
echo "alias tp='source tp'" >> $HOME/.bash_aliases
source $HOME/.bash_aliases
