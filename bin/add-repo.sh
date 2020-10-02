# Add repo to repo list

REPO=${1:- ""}
REPO_LIST=${2:- ""}

# Remove closing ']'
text=$(cut -d] -f1 $REPO_LIST);
echo $text > $REPO_LIST;

# Add line
echo "  ,{\"repo\": \"$REPO\"}" >> $REPO_LIST
# Add closing ']'
echo "]" >> $REPO_LIST