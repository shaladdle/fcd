fcd - Fast Change Directory
===


This utility is quite similar to 'autojump' (https://github.com/joelthelion/autojump), except that instead of remembering directories that you've been to recently, it searches for a directory with the name you want.

Future Improvements
==
- [ ] Show a list when there are multiple hits and let the user choose
- [ ] Sort that list, putting directories in the users home directory at the top of the list

Installation
===

You need two things:

1. A compiled fcd binary in your path
1. Some shell alias/function that calls the binary and does the actual cd. The Go program has its own shell env, so it can't really change your shell's directory.

For the first, you'll need Go installed. Git clone this repo and do make install to install the binary to $HOME/bin/fcd.  For the second, if you use bash or zsh, you can do cat fcd.sh >> .bashrc or cat fcd.sh >> .zshrc

At this point, it should work!

Notes
===
- Works best on OS X, where mdfind (spotlight) has filesystem support. Using locate on linux will work, but you better already have an updatedb chron job or something.
