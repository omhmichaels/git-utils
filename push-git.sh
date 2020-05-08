#!/bin/bash
# Title: push-git.sh
# Author: Michael Martin
# Desc: Script to push to a git repo


comment=${1:- "ADDED CONTENT"}

git add .;
git commit -m "$comment";
git push;