#!/usr/bin/env bash

# ZSH 
export ZSH=/Users/andrew/.oh-my-zsh
export UPDATE_ZSH_DAYS=1

export PATH=$HOME/.cargo/bin:$PATH

# Custom
########

export TERM=xterm-256color

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Lang and Locale
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export LDFLAGS=-L/usr/local/opt/libxml2/lib
export CPPFLAGS=-I/usr/local/opt/libxml2/include
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

#########
# Apps
#########

# local db testing
export MAIN_SITE_DB_URL="postgres://kemalyst:kemalyst@localhost:5432/main_site_dev"

# Vim FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
