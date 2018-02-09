# Dotfiles
My environment configuration files for shell, tmux and vim.
I work in OS X so I can't guarantee this will work on other *nix derivatives.

Once upon a time I typed something to the likes of <br>
`$ echo "my-config=setting" > ~/.zshrc` <br>
instead of <br>
`$ echo "my-config=setting" >> ~/.zshrc` <br>
and overwrote my config.

Never again.


## Usage
This is a backup of my dotfiles, but you're welcome to use them. Clone the repo somewhere on your machine, copy what you want into your home directory.


## Contents

### .zshrc
Slightly modified version of .oh-my-zsh with some handy aliases for my current dev stack.

### .tmux.conf
I'm new to tmux but this is the most exciting for me at the moment. I use tmuxinator to define 'dev' and 'blog' projects I can quickly tap into pre-configured tmux sessions.

### .vimrc
I'm most proud of this, especially thanks to [Kevin](https://github.com/kmckelvin) for his help on this one.

### .gitconfig
Random git config, basically for me.

### Others
Brewfile for replicating some of the brews that I like if my machine were destroyed / stolen by a rogue beaver of sorts.

### import-these

See the readme in this directory

## License

The MIT License (MIT)

Copyright © 2014 Simon van Dyk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
