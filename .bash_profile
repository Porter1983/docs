#docker
function docker-nuke() {
    docker stop `docker ps -qa`
    docker system prune -a --volumes --force
}
alias dc='docker-compose'
alias dprune='docker system prune --force'
alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias dockerclean='dockercleanc || true && dockercleani'

#git
alias gs='git status'
alias gas='git add -A && git status'
alias stash='git stash'
alias pop='git stash pop'
alias gp='git pull --no-edit'
alias sync_fork='echo "Switching to master" && git checkout master && git status && echo "Fetching" && git fetch --all --prune && echo "Merging with the upstream" && git merge upstream/master && echo "Garbage Collecting" && git gc'
alias gpo="git push -u origin HEAD"
alias removeAllBranches="git branch | grep -v 'master' | xargs git branch -D"
function com() {
    git commit -m "$1"
}

#nuget
alias clearNuget="dotnet nuget locals all --clear"

#general
alias imout='shutdown /f'
function encode() {
    echo "$1" | base64 | clip.exe
}

function decode() {
    echo "$1" | base64 -d
}
