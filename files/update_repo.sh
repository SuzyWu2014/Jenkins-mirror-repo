#!/bin/bash

SRC=$1
DEST=$2
REMOTE_NAME=ecs
ERROR=false

while read REPO; do
    if [ -n "$REPO" ]; then
      REPO_NAME=${REPO##*/}.git
      if [ -d $REPO_NAME ]; then
          cd $REPO_NAME &&
          git fetch -p origin &&
          git push --all $REMOTE_NAME &&
          git push --tags $REMOTE_NAME &&
          cd .. || ERROR=true
      else
          git clone --bare $SRC/$REPO.git &&
          cd $REPO_NAME &&
          git remote add $REMOTE_NAME $DEST/$REPO_NAME &&
          git push --all $REMOTE_NAME &&
          git push --tags $REMOTE_NAME &&
          cd .. || ERROR=true
      fi
    fi
done <<< "$(cat src_repos.txt)"

while read REPO; do
    if [ -n "$REPO" ]; then
      REPO_NAME=${REPO##*/}
      if [ -d $REPO_NAME ]; then
          cd $REPO_NAME &&
          git fetch -p origin &&
          git push --all $REMOTE_NAME &&
          git push --tags $REMOTE_NAME &&
          cd .. || ERROR=true
      else
          git clone --bare $SRC/$REPO &&
          cd $REPO_NAME &&
          git remote add $REMOTE_NAME $DEST/pages-$REPO_NAME &&
          git push --all $REMOTE_NAME &&
          git push --tags $REMOTE_NAME &&
          cd .. || ERROR=true
      fi
    fi
done <<< "$(cat pages_repos.txt)"

if [ $ERROR == true ]; then
    exit -1
fi