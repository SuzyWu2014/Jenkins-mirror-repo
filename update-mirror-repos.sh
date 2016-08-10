#!/bin/bash

# SRC=git@banner-src.ellucian.com:
SRC=https://github.com
DEST=git@somewhere:someone
REMOTE_NAME=ecs

cat src_repos.txt | while read REPO; do
    if [ -n REPO ]; then
        REPO_NAME=${REPO##*/}.git
        echo $REPO_NAME
        if [ -d $REPO_NAME ]; then
            cd $REPO_NAME
            # git fetch -p origin
            # git push --mirror $REMOTE_NAME
            cd ..
        else
            echo $SRC/$REPO.git
            # git clone --bare $SRC/$REPO
            # cd $REPO_NAME
            # git remote add $REMOTE_NAME $DEST/$REPO_NAME
            # git push --mirror $REMOTE_NAME
            # cd ..
        fi
    fi
done

cat pages_repos.txt | while read REPO; do
    if [ -n REPO ]; then
        REPO_NAME=${REPO##*/}
        if [ -d $REPO_NAME ]; then
            cd $REPO_NAME
            # git fetch -p origin
            # git push --mirror $REMOTE_NAME
            cd ..
        else
            echo $REPO_NAME
            # git clone --bare $SRC/$REPO
            # cd $REPO_NAME
            # git remote add $REMOTE_NAME $DEST/pages-$REPO_NAME
            # git push --mirror $REMOTE_NAME
            # cd ..
        fi
    fi
done
