if [ -e "$HOME"/.alias ]; then
        [ -n "$PS1" ] && . "$HOME"/.alias
fi

#-------------------------------------GIT_ALIASES----------------------------------------------

# Get current branch's name
alias current_branch='git rev-parse --abbrev-ref HEAD'

# Color declarations
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m'
LIGHT_RED='\033[1;31m'
LIGHT_CYAN='\033[1;36m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
RESET_FORMAT='\033[0m'

# Messages when running github command
checking_typescript="${LIGHT_BLUE}[Typescript] ${LIGHT_CYAN}Checking the generated files for syntax correctness${RESET_FORMAT}"
pulling_from="${YELLOW}Pulling code from"
pushing_to="${YELLOW}Pushing code to"
force_pushing_to="${LIGHT_RED}Force-pushing${YELLOW} code to"
develop_branch_text="the ${LIGHT_GREEN}DEVELOP${YELLOW} branch${RESET_FORMAT}"

alias current_branch_text='echo "the ${LIGHT_GREEN}$(current_branch)${YELLOW} branch${RESET_FORMAT}"'
alias message_done='echo -e "${LIGHT_GREEN}Done!${RESET_FORMAT}"'
alias message_checking_typescript='echo -e "${checking_typescript}"'
alias message_pulling_develop='echo -e "${pulling_from} ${develop_branch_text}"'
alias message_pulling_code='echo -e "${pulling_from} $(current_branch_text)"'
alias message_pushing_code='echo -e "${pushing_to} $(current_branch_text)"'
alias message_force_pushing_code='echo -e "${force_pushing_to} $(current_branch_text)"'

# Github command alias
alias gp='message_pulling_develop && git pull origin develop && message_done'
alias checkout='git checkout'
alias checkdev='git checkout develop'
alias push='message_pushing_code && git push origin $(current_branch) && message_done'
alias force_push='message_force_pushing_code && git push origin $(current_branch) --force-with-lease && message_done'

alias delb='git branch -D'
alias delb_current='echo $(current_branch) | pbcopy && checkdev && delb $(pbpaste)'

alias bl='git branch'
alias glog='git log --oneline'
alias stash='git stash push -m'
alias pick='git cherry-pick'
alias revert_previous_commit='git reset --soft HEAD@{1}'
alias gf='git fetch && message_done'
alias me='
  echo -e "${LIGHT_GREEN}User:${RESET_FORMAT} $(git config user.name)" && \
  echo -e "${LIGHT_GREEN}Email:${RESET_FORMAT} $(git config user.email)"
'

# Pull code from current branch or any branches on the remotes!
pull() {
  # Determine target branch
  local branch=${1:-$(current_branch)}

  # Show message
  if [ -z "$1" ]; then
    echo -e "${pulling_from} $(current_branch_text)"
  else
    echo -e "${YELLOW}Pulling code from the ${LIGHT_GREEN}${branch}${YELLOW} branch${RESET_FORMAT}"
  fi

  # Run git pull
  git pull origin "$branch" && message_done
}

# Custom 'commit' function:
# - Shows git user info (via `me`)
# - Waits for typing 'ok' text
# - Runs `git commit -m <msg> [extra options]`
commit() {
  # Get current Git user info
  local user_name
  local user_email
  user_name=$(git config user.name)
  user_email=$(git config user.email)

  # Check if user.name or user.email is empty
  if [ -z "$user_name" ] || [ -z "$user_email" ]; then
    echo -e "   ❌ ${RED}Git user.name or user.email is not set.${RESET_FORMAT}"
    echo -e "   Run the following to set them locally:"
    echo -e "   ${LIGHT_GREEN}git config user.name 'Your Name'${RESET_FORMAT}"
    echo -e "   ${LIGHT_GREEN}git config user.email 'your@email.com'${RESET_FORMAT}"
    return 1
  fi


  # Show current Git user.name and user.email
  me

  # Prompt user to type 'ok' to confirm
  echo -e "⚠️ ${ORANGE}WARNING!${RESET_FORMAT} Type ${LIGHT_GREEN}'ok'${RESET_FORMAT} to continue with commit, or Ctrl+C to cancel."

  read -r input

  # Use zsh's 'typeset -l' to lowercase the variable
  typeset -l lower_input=$input

  if [[ "$lower_input" != "ok" ]]; then
    echo "❌ Confirmation failed. Commit aborted."
    return 1
  fi

  # First arg is the commit message
  local message=$1
  shift  # Remaining args are passed to `git commit`

  # If no message, show error
  if [ -z "$message" ]; then
    echo "❌ No commit message provided."
    return 1
  fi

  # Run git commit with message and extra options
  git commit -m "$message" "$@"
}


#-------------------------------------END_GIT_ALIASES----------------------------------------------


#-------------------------------------SYSTEM_AND_OTHERS----------------------------------------------

# Project command alias
alias dev="rm -f .stylelintcache .eslintcache && pnpm run clean || echo 'No clean script found, skipping...' && pnpm run dev"


# Typescript command alias
alias typecheck='message_checking_typescript && npx tsc --noEmit && message_done'


# System command alias
alias cls='clear'
alias test='echo "It works!"'

killport() {
  PID=$(sudo lsof -t -i :$1)
  if [ -z "$PID" ]; then
    echo "⚠️  No process is using port $1"
  else
    sudo kill -9 $PID
    echo "✅ Killed process $PID on port $1"
  fi
}

alias restart_nginx='brew services restart nginx'

#-------------------------------------END_SYSTEM_AND_OTHERS----------------------------------------------