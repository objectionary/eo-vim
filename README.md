<img src="https://www.yegor256.com/images/books/elegant-objects/cactus.svg" height="92px" />

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)

![Lines of code](https://img.shields.io/tokei/lines/github/ivan-egorov42/vim-eo)
[![Hits-of-Code](https://hitsofcode.com/github/ivan-egorov42/vim-eo)](https://hitsofcode.com/github/ivan-egorov42/vim-eo/view)
[![CI](https://github.com/ivan-egorov42/vim-eo/actions/workflows/main.yml/badge.svg)](https://github.com/ivan-egorov42/vim-eo/actions/workflows/main.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/objectionary/eo/blob/master/LICENSE.txt)

# Vim plugin for EO programs

## Features

This plugin adds EO language support for Vim, with the following main features:

* Syntax highlighting

## Installation

The simplest way to install eo-vim plugin is adding it to the standard runtime path like this:

#### 1st Step
 
If you don't have "start" directory in ~/.vim, you can run this:
``` 
mkdir -p ~/.vim/pack/myplugins/start
``` 
else you can skip this step

#### 2nd Step
``` 
cd ~/.vim/pack/myplugins/start
git clone https://github.com/ivan-egorov42/eo-vim
``` 

#### But also you can use some popular package managers:

* [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages)
  * `git clone https://github.com/ivan-egorov42/eo-vim.git ~/.vim/pack/plugins/start/eo-vim`
* [Neovim packages](https://neovim.io/doc/user/repeat.html#packages)
  * `git clone https://github.com/ivan-egorov42/eo-vim.git ~/.local/share/nvim/site/pack/plugins/start/eo-vim`
* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/ivan-egorov42/eo-vim.git ~/.vim/bundle/eo-vim`
* [Vundle](https://github.com/VundleVim/Vundle.vim)
  * `git clone https://github.com/ivan-egorov42/eo-vim.git ~/.vim/bundle/eo-vim`
  *  add `Plugin 'eo-vim'` to your `~/.vimrc` and run `PluginInstall`.

## Using tabulation

If you use tabs in vim, it is necessary to set the 'expandtab' option: `:set expandtab` due to compiler specifics. Also, the following line will be useful if you don't want to set this every time you start the vim:
```
autocmd BufEnter *.eo set ai ts=2 st=2 expandtab

```
You can add it to your `$HOME/.vimrc` configuration file. This will work only with `.eo` files. 

Arguments `ts` and `st` set number of space characters that will be inserted when the tab key is pressed. You can change it as you wish. 

More information by:
* :help 'tabstop'
* :help 'shiftwidth'
* :help 'expandtab'
* :help 'softtabstop'

## Testing

For testing eo-vim plugin we use a [testing framework](https://github.com/thinca/vim-themis) for Vim script, so you can add some tests for your new features with this soft. It will be run by CI.

##  Contributing

All PRs are welcome. If you are planning to contribute a large patch or to integrate a new tool or some features, please create an issue first to get any upfront questions or design decisions out of the way first. Then, you may fork repository, make changes and send us a pull request.
