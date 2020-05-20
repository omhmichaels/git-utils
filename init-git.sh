#!/bin/bash
# Title: init-git.sh
# Author: Michael Martin
# Desc: Script to quickly setup a git repo






project=${1:- ""}
username=${2:- ""}
comment=${2:- "Initialized $project"}
private=${4-: ""}


# Initializes repo and pushes to master
function initGit(){
    echo "Initializing and pushing to repo $project"

    rm -rf .git/
    git init;
    git add .
    git commit -m "$comment"
    
    ## REPLACED WITH HUB ##
    git remote add origin git@github.com:$username/$project.git
    # Create remote github repo
    hub create $private $comment $project
    git push -u origin master
}

function fixssh(){
    local SSH_KEYPATH="~/.ssh/github-${username}"
    ssh-add -D
    ssh-add -K "${SSH_KEYPATH}"
}

function readme(){
    # Title
    printf "# **$project**" >> README.md;

    #printf "\n**---- $project Owners ----**\t\t\n" >> README.md;
    printf "\n**License(s)**: **:" >>  README.md;
    printf "\n***Author(s)**: *${username}*" >>  README.md;
    printf "\n**Maintainer(s)**: *MAINTAINERS*" >>  README.md;
    printf "\n**Department/Team**: *DevOps*: *TOC*" >>  README.md;
    printf "\n**Contents**:" >>  README.md;

    ### Servers ###
    printf "\n* **Server(s)** *SERVERS*" >>  README.md;

    # Pubic Web
    printf "\n\t- **VPN**" >>  README.md;
    printf "\n\t- **Web**" >>  README.md;            # SERVERS_MAP = {}

    # Dev Ops
    printf "\n\t- **Build**" >>  README.md;            # SERVERS_MAP = {}
    printf "\n\t- **Deployment**" >>  README.md;            # SERVERS_MAP = {}

    ### Build Example Template ###
    printf "\n\n### **Usage**:" >> README.md;
    printf "\n* *Building Project*:" >> README.md;
    printf "\n* *Basic Usage*:" >> README.md;
    printf "\n* *Examples*:" >> README.md;
}

fixssh;
readme;
initGit;