#!/bin/bash
set -x -e

mkdir dist-local
cd dist-local
git config --global user.email "$USER_EMAIL" > /dev/null 2>&1
git config --global user.name  "$USER_NAME" > /dev/null 2>&1
git init
git remote add --fetch origin "$DEST_URL"

git checkout master
git rm -rf .

cp -a "../build" .

git add -A
git commit --allow-empty -m "Deploy to gh pages"
git push --force --quiet origin master
cd ..
rm -rf dist-local

echo "Done!"