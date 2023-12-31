#!/bin/bash

echo "git config emails....."
git config --global user.email "amit.tiwari@gmail.com"
echo "git config user name..."
git config --global user.name "Ice Tee"

# Get the current timestamp in the format YYYYMMDD_HHMMSS
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create a filename based on the timestamps
filename="file_$timestamp.txt"


remote=$(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f1)
remote="origin2"
#remote_branch=$(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f2)
remote_branch="mv_to_pr"
echo "https://iceteee:${GH_TOKEN}@github.com/${remote}/bot_batching.git"
#git remote add $remote "https://iceteee:${GH_TOKEN}@github.com/${remote}/bot_batching.git"
git fetch $remote
#git checkout -b $remote-$remote_branch -t $remote/$remote_branch
git checkout -b $remote_branch -t $remote/$remote_branch

echo "Creating $filename..."
touch $filename

echo "git status..."
git status

echo "git branch..."
git branch

echo "Listing files..."
ls -latr

echo "git diff files..."
git diff

echo "gonna run: git add ./${filename}"
git add ${filename}
echo "gonna run: git commit -m \"bot added\""
git commit -m "bot added"
echo "git log...."
git log --oneline
echo "git remote -v...."
git remote -v

#git push $remote $remote-$remote_branch
echo "git push $remote $remote_branch....."
git push $remote $remote_branch
echo "Done."