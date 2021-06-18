alias g='git'
alias gs='git status'
alias gst='git status'

alias ga='git add'
alias gaa='git add .'		    # Stage all changes
alias gat='git add -u'			# Stage all changes of tracked files only

alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit --amend -m'          # add changes and modify last commit message
alias gcan='git commit --amend --no-edit'   # add changes to last commit without edit

alias gcp='git branch | grep '^\*' | cut -d' ' -f2 | pbcopy'  # copy the name of the current branch
alias gcc='git clean -df && git checkout -- .' # delete unstaged files and discard all unstage changes

alias gd='git diff'
alias gdd='git diff develop'
alias gdm='git diff master'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias gds='git diff HEAD'

alias gf='git fetch'
alias gfa='git fetch --all'
alias gfp='git fetch --prune'

alias gg='git grep -n'

alias gm='git merge'

alias gl='git log'
alias glp='git log --patch'
alias glo='git log --oneline'
alias glg='git log --graph --color --decorate --oneline'

alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull'
alias gpll='git pull --all'
alias gpb="git checkout \$1 && git pull && git checkout -"  # git pull -branch without switching current branch

alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grb="git checkout \$1 && git pull && git checkout - && git rebase \$1"    # pull and rebase with the desired -branch

alias grs='git reset --soft'
alias grs1='git reset --soft HEAD~1' # soft reset last commit 
alias grh='git reset --hard'
alias grh1='git reset --hard HEAD~1' # hard reset last commit

alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstc='git stash clear'
alias gstd='git stash drop'

alias gitskip='git update-index --skip-worktree'
alias gitnoskip='git update-index --no-skip-worktree'

alias gitl='git config --local user.name $1; git config --local user.email $2'
alias gitg='git config --global user.name $1; git config --global user.email $2'

# git search and replace, original_text = $1, replace_text=$2
alias gsed="git grep -l \$1 | xargs sed '' -e 's/\$1/\$2/g" # find and replace text


# git commit browser. needs fzf
log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

# Sync all projects with remote in the current directory
pullall() {
  # store the current dir
  CUR_DIR=$(pwd)

  # Let the person running the script know what's going on.
  echo "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

  # Find all git repositories and update it to the master latest revision
  for i in $(find . -name ".git" | cut -c 3-); do
      echo "";
      echo "\033[33m"+$i+"\033[0m";

      # We have to go to the .git parent directory to call the pull command
      cd "$i";
      cd ..;

      # finally pull
      git pull origin master;

      # lets get back to the CUR_DIR
      cd $CUR_DIR
  done

  echo "\n\033[32mComplete!\033[0m\n"
}
