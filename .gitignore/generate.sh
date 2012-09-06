#!/bin/bash

touch .global_gitignore
rm .global_gitignore
ls *.gitignore | xargs cat >> .global_gitignore

git config --global core.excludesfile ~/.gitignore/.global_gitignore
