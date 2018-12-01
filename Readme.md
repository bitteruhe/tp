# TP
Teleport - A bash tool for transitioning from one directory to another.  
## What it is
`tp` is just a wrapper for `cd`. It makes use of so called `portals` that point
to user defined directories.
## Why you need TP
Let's say your current working directory is `~/Documents/foo/bar/1/oak/blah`
and you quickly want to change your directory to `~/Documents/oof/rab/1/kao/halb`.
Consequently, you will start entering dots into your command line:
```bash
$ cd ../../../../oof/rab/1/kao/halb
```
Since you are using both `blah` and `halb` very regularly, you often find yourself
entering such commands. You maybe start wondering: isn't there a nice alternative
to such mind numbing procedure? Wonder no more! `tp` is here to save you.

With `tp`, switching from `~/Documents/foo/bar/1/oak/blah` to
`~/Documents/oof/rab/1/kao/halb` is done in a 7 char command:
```bash
$ tp halb
halb --> HOME/Documents/oof/rab/1/kao/halb
```
And when you want to switch back, simply enter `tb blah`:
```bash
$ tp blah
blah --> HOME/Documents/foo/bar/1/oak/blah
```
## Where you need TP
Everybody has a couple of static directories she/he uses on a daily basis.
Such directories are the perfect use case for `tp`. Of course, seldom used
directories, e.g. `~/Documents/code/java/sesame/src/main/java/io`, do not
require a separate portal, when `~/Documents/code/java/sesame/` already has one.

## How you use TP
`tp` was developed with the ambition to create a minimalistic tool that offers
greate ease of use.

### Setting up a portal
Before teleporting to a directory is possible, a portal must be created for that
directory. This is achieved by appending a line to `~/.tp_config`:
```bash
# This creates a portal called "local" that points to ~/.local/share
$ echo "local=HOME/.local/share" | tee ~/.tp_config -a
```
Of course, you can also edit `~/.tp_config` with your favorite text editor.
#### The meaning of HOME
A path, specified in `~/.tp_config`, is indirectly passed to `cd`. To keep the
`~/.tp_config` easy to read, the special value `HOME` was introduced.
When `tp` reads a path that starts with `HOME`, the path is parsed relative to the
user's home directory (`$HOME`).

### TP in action
Let's say that this is your `~/.tp_config` file:
```text
up=../
r=/
root=/root
documents=HOME/Documents/
local=HOME/.local/share
code=HOME/Documents/code/
bash=HOME/Documents/code/bash
java=HOME/Documents/code/java
clargs=HOME/Documents/code/java/clargs/src/main/java/org/ruhe
py=HOME/Documents/code/python
python=HOME/Documents/code/python
go=HOME/Documents/code/go
tp=HOME/Documents/code/bash/teleport
volumes=/var/lib/docker/volumes
```
You are currently working on a python project and want to switch to your java
project called `clargs`. Instead of using cd with a (long) relative path or
inconvenient absolute path, you simply enter this:
```bash
$ tp clargs
clargs --> HOME/Documents/code/java/clargs/src/main/java/org/ruhe
$ pwd
~/Documents/code/java/clargs/src/main/java/org/ruhe
```

## Installation
Clone this repo and run the install script:
```bash
$ git clone https://github.com/bitteruhe/tp && cd tp
$ sudo ./install.sh
```
If you don't want to run the install script, follow these steps:
1. Copy tp to your bin folder: `cp tp /usr/bin/tp`
2. Set an alias for tp: `echo "alias tp='source tp'" >> $HOME/.bash_aliases`
3. Apply the changes: `source $HOME/.bash_aliases`
4. If not done yet, link `~/.bash_aliases` to `~/.bashrc` by pasting the following
bash code into `~/.bashrc`:
```bash
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi
```

After running `tp` for the first time, the two files `~/.tp_config` and `~/.tp_config.defaults` are created. Add your own portals to `~/.tp_config` or
use the existing portals in `~/.tp_config.defaults`.
