#!/bin/bash

# ARGUEMENT: Return value from 'git push'
# TRUE: 'cd ..' and remove repository directory
# FALSE: Abort/ Do not remove repository

# Return value from 'git push'
PUSH_RETURN_VALUE=${1}

# Check if TRUE 
if ['true' == "$PUSH_RETURN_VALUE"];
then 
    printf "\n---PUSH SUCCEEDED---\n"
    # 
else 
    printf "\n---PUSH FAILED---\n"
    printf "\n---PUSH EXITING---\n"
fi



