#!/bin/bash

echo "git config emails....."
git config --global user.email "amit.tiwari@gmail.com"
echo "git config user name..."
git config --global user.name "Ice Tee"

# Get the current timestamp in the format YYYYMMDD_HHMMSS
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create a filename based on the timestamps
filename="file_$timestamp.txt"

echo "*************************************************"
echo "RUNNING: $(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f1)..."
remote=$(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f1)
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: $(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f2)..."
remote_branch=$(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f2)
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git remote add $remote https://iceteee:${GH_TOKEN}@github.com/${remote}/bot_batching.git..."
git remote add $remote "https://iceteee:${GH_TOKEN}@github.com/${remote}/bot_batching.git"
echo "*************************************************"


echo "*************************************************"
echo "RUNNING: git fetch $remote..."
git fetch $remote
echo "*************************************************"


echo "*************************************************"
#git checkout -b $remote-$remote_branch -t $remote/$remote_branch
echo "RUNNING: git checkout -b $remote_branch -t $remote/$remote_branch..."
git checkout -b $remote_branch -t $remote/$remote_branch

echo "*************************************************"
echo "RUNNING: touch $filename..."
touch $filename
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git status..."
git status
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git branch..."
git branch
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: ls -latr..."
ls -latr
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git diff files..."
git diff
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git add ./${filename}"
git add ${filename}
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git commit -m \"bot added\""
git commit -m "bot added"
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git log...."
git log --oneline
echo "*************************************************"

echo "*************************************************"
echo "RUNNING: git remote -v...."
git remote -v
echo "*************************************************"

#git push $remote $remote-$remote_branch
echo "*************************************************"
echo "RUNNING: git push $remote $remote_branch"
git push $remote $remote_branch
echo "*************************************************"
echo "Done."