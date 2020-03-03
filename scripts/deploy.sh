#! /bin/bash

# Inspired by https://gohugo.io/hosting-and-deployment/hosting-on-github/

set -euo pipefail
log() {
  local msg=$1
  printf "\033[0;32m$(date) - $1...\033[0m\n"
}

log "Deploying to github"

# Go To Public folder
cd public

# Add changes to git
git add .

# Commit changes
git commit -m "$(date) - Pushing to github"

# Push source and build repos.
git push origin master

log "All done"
