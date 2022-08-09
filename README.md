# Vim plugin for EO programs

## Features

* Syntax highlighting

## Installation

The simplest way to install vim-eo plugin is adding it to the standard runtime path like this:

#### 1st Step
 
If you don't have "start" directory in ~/.vim, you can run this:
``` 
mkdir -p ~/.vim/pack/myplugins/start
``` 
else you can skip this step

#### 2nd Step
``` 
cd ~/.vim/pack/myplugins/start
git clone https://github.com/ivan-egorov42/vim-eo
``` 

#### But also you can use some popular package managers:

* [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages)
  * `git clone https://github.com/ivan-egorov42/vim-eo.git ~/.vim/pack/plugins/start/vim-eo`
* [Neovim packages](https://neovim.io/doc/user/repeat.html#packages)
  * `git clone https://github.com/ivan-egorov42/vim-eo.git ~/.local/share/nvim/site/pack/plugins/start/vim-eo`
* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/ivan-egorov42/vim-eo.git ~/.vim/bundle/vim-eo`
* [Vundle](https://github.com/VundleVim/Vundle.vim)
  * `git clone https://github.com/ivan-egorov42/vim-eo.git ~/.vim/bundle/vim-eo`
  *  add `Plugin 'vim-eo'` to your `~/.vimrc` and run `PluginInstall`.

##  Contributing

All PRs are welcome. If you are planning to contribute a large patch or to integrate a new tool or some features, please create an issue first to get any upfront questions or design decisions out of the way first. Then, you may fork repository, make changes and send us a pull request.
