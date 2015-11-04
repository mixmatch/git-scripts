#!/bin/bash
function finish {
 git fetch origin && git reset --hard origin/master && git clean -f
}
trap finish EXIT
set -e
eval $(ssh-agent)
ssh-add /<Home Dir>/.ssh/id_rsa
ssh-add -l
git add -A .
git commit -m "Auto-commit file changes on server"
git pull origin master && git push origin master
