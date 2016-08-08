#!/bin/bash

DEST=git@somewhere:somebody
REMOTE_NAME=ecs

cat src_repos.txt | while read REPO; do
    REPO_NAME=${REPO##*/}
    echo $REPO_NAME
    if [ -d $REPO_NAME ]; then
        cd $REPO_NAME
        git fetch -p origin
        git push --mirror $REMOTE_NAME
        cd ..
    else
        git clone --bare $REPO
        cd $REPO_NAME
        git remote add $REMOTE_NAME $DEST/$REPO_NAME
        git push --mirror $REMOTE_NAME
        cd ..
    fi
done
