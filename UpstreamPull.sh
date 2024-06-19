#!/usr/bin/env bash

## Add Once
#git remote add  upstream https://github.com/nvim-lua/kickstart.nvim.git

## Status of Defined Remotes
#git remote -v

git status
git fetch upstream
git merge upstream/master
git status

