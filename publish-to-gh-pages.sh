#!/bin/bash
set -ev
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout master:gh-pages
cd ../
mv .deploy_git/.git/ ./public/
cd ./public
git config user.name  "tqlin"
git config user.email "smltq@126.com"
# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages