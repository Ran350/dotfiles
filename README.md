# Dotfiles

[![Build Status](https://github.com/Ran350/dotfiles/workflows/build/badge.svg)](https://github.com/Ran350/dotfiles/actions)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.txt)

## Requirements

- macOS
- Ubuntu

## Usage

First, clone this repository.

```sh
gh repo clone Ran350/dotfiles
cd ~/dotfiles
```

### Setup

Install essential tools. (required sudo)

```sh
$ make install
```

Incidentally, `make install` will perform the following tasks.

- `make update` - update dotfiles
- `make deploy` - deploy dotfiles to your env
- `make init` - init some settings

If you want to know details, just execute `make help`.

### Change default shell

You need to add `zsh` to the list of available shells. (required sudo)

```sh
$ echo $(which zsh) >> /etc/shells
$ chsh -s $(which zsh) $USER
```

### tmux

If you want to launch tmux when you start the shell, write the following in end of `zshrc`.

```sh
$ launch-tmux
```
