alias g='git'
alias gs='git status'
alias gst='git status'

alias ga='git add'
alias gaa='git add .'
alias gat='git add -u'			# Stage all updates of tracked files

alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit --amend -m'
alias gcan='git commit --amend --no-edit'

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
alias gpb="git checkout \$1 && git pull && git checkout -"  # git `pull` branch without switching current branch

alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grb="git checkout \$1 && git pull && git checkout - && git rebase \$1"    # pull and rebase with the desired branch

alias grs='git reset --soft'
alias grs1='git reset --soft HEAD~1'
alias grh='git reset --hard HEAD~1'

alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstc='git stash clear'
alias gstd='git stash drop'

alias gitskip='git update-index --skip-worktree'
alias gitnoskip='git update-index --no-skip-worktree'

alias gitpc='git config --local user.email imam.swe@gmail.com; git config --local user.name "Imam Hossain";'
alias gitwc='git config --global user.email imam.hossain@welldev.io; git config --global user.name "Imam Hossain";'


# git search and replace, original_text = $1, replace_text=$2
alias gsed="git grep -l \$1 | xargs sed '' -e 's/\$1/\$2/g" # find and replace text
