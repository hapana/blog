#! /bin/bash

# Inspired by https://gohugo.io/hosting-and-deployment/hosting-on-github/

set -euo pipefail
log() {
  local msg=$1
  printf "\033[0;32m$(date) - $1...\033[0m\n"
}

# Comes from tusk, manage defaults there too so no need to do it here
MSG=$1

log "Staging Github Pages static content"

cd public
git add .

log "Comitting Github Pages content"

git commit -m "$(date) - $MSG"
git push origin master

log "Pushed to Github Pages"
log "Staging submodule commit update"

cd ..
git add ./public

log "Comitting submodule update"

git commit -m "$(date) - Updating submodule"
git push origin master

log "Pushed submodule commit update"
log "All done"
