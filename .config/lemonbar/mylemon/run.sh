#!/bin/bash

cd ~/.config/lemonbar/mylemon
[ ! -e venv ] && virtualenv -q venv 
source ./venv/bin/activate
pip install -q -r ./requirements.txt

python ./my_lemon.py | lemonbar -p -b -f Inconsolata -f Steel_Alphabet -g x30++ -u 2 -o -3 | zsh

