REPO_LIST=${1:- "~/.config/repo-list.txt"}
BASE_PATH=${2:- "~/projects"}
# Use jq to get repos from json config
repo_list=$(jq '.[] | .repo ' ${REPO_LIST}) 

# Strip remaining quotes
repo_list=$(echo $repo_list | xargs echo)  


# Loop through and clone repos
IFS=$' '
for repo in $repo_list;
do
    printf "\nRemoving $repo\n"
    # Strip Repo Name
    repo=$(echo $repo | cut -d'/' -f5 | cut -d'.'  -f1)
    rm -rf "${BASE_PATH}/${repo}"
done
unset IFS

printf "\nRemoved Repos\n"
