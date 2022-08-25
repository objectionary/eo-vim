<img alt="logo" src="https://www.objectionary.com/cactus.svg" height="100px" />

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)

![Lines of code](https://img.shields.io/tokei/lines/github/objectionary/eo-vim)
[![Hits-of-Code](https://hitsofcode.com/github/objectionary/eo-vim)](https://hitsofcode.com/github/objectionary/eo-vim/view)
[![CI](https://github.com/objectionary/eo-vim/actions/workflows/main.yml/badge.svg)](https://github.com/objectionary/eo-vim/actions/workflows/main.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/objectionary/eo-vim/blob/master/LICENSE.txt)

This plugin makes [Vim](https://www.vim.org) highlight syntax in [EO](https://www.eolang.org) progams.

The simplest way to install is by adding it to the standard Vim runtime path:

```
git clone https://github.com/objectionary/eo-vim ~/.vim/pack/myplugins/start
``` 

However, you can also use some popular package managers:

* [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages)
  * `git clone https://github.com/objectionary/eo-vim.git ~/.vim/pack/plugins/start/eo-vim`
* [Neovim packages](https://neovim.io/doc/user/repeat.html#packages)
  * `git clone https://github.com/objectionary/eo-vim.git ~/.local/share/nvim/site/pack/plugins/start/eo-vim`
* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/objectionary/eo-vim.git ~/.vim/bundle/eo-vim`
* [Vundle](https://github.com/VundleVim/Vundle.vim)
  * `git clone https://github.com/objectionary/eo-vim.git ~/.vim/bundle/eo-vim`
  *  add `Plugin 'eo-vim'` to your `~/.vimrc` and run `PluginInstall`.

## Configuration

If you use tabs in Vim, it is necessary to set the 'expandtab' option: `:set expandtab` due to compiler specifics. Also, the following line will be useful if you don't want to set this every time you start the Vim:

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

If you want to change colors in vim as you wish, you can see the list of highlight groups [here](https://github.com/objectionary/eo-vim/blob/master/syntax/README.md).

### Highlight setting

You can change colors in syntax highlighting on your own by using `highlight` command in vim, for example:

```
:highlight Comment term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
```

Here is the list of highlight groups and examples in code:

```
Group          | Example
-------------- | ---------------
Keyword        | @, &, $, ^
Comment        | #Here is comment
Number         | Ints and floats
String         | "Hello, world"
Boolean        | TRUE, FALSE and bytes literals
Todo           | TODO FIXME NOTE
DotName        | .plus .write .smth etc.
ObjectName     | All objects except abstract and dot-notation
AbstractName   | Abstact objects
Define         | alias package rt etc.
Statement      | +rt jvm org.eolang...
```

More information by `:highlight` and `:help 'highlight'`

## How to Contribute

For testing eo-vim plugin we use a [testing framework](https://github.com/thinca/vim-themis) for Vim script, so you can add some tests for your new features with this soft. It will be run by CI.

All PRs are welcome. If you are planning to contribute a large patch or to integrate a new tool or some features, please create an issue first to get any upfront questions or design decisions out of the way first. Then, you may fork repository, make changes and send us a pull request.
