## Introduction
This jenkins job will mirror given github repos to a targeted github account and periodically update the mirrors. It runs once a day at 11:00 pm.

## Requirements

1. Ensure the jenkins node has SSH keys paired with both the source and destination Github repo. To generate / add SSH keys, simply follow the official guide [here](https://help.github.com/categories/ssh/).

2. Destination github repos should have been created and the name of the repo should be same as the source repo.

## Configuration

1. update `files/src_repos.txt` with your source repos
2. edit `defaults/main.yml`, replace `dest_github` with your destination github repo
