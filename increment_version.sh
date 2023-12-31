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
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: $(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f2)..."
remote_branch=$(git log -1 --pretty=%B | head -n 1 |awk '{print $NF}'|cut -d '/' -f2)
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git remote add $remote https://iceteee:${GH_TOKEN}@github.com/${remote}/bot_batching.git..."
git remote add $remote "https://iceteee:${GH_TOKEN}@github.com/${remote}/bot_batching.git"
echo -e "*************************************************\n"


echo "*************************************************"
echo "RUNNING: git fetch $remote..."
git fetch $remote
echo -e "*************************************************\n"


echo "*************************************************"
#git checkout -b $remote-$remote_branch -t $remote/$remote_branch
echo "RUNNING: git checkout -b $remote_branch -t $remote/$remote_branch..."
git checkout -b $remote_branch -t $remote/$remote_branch
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: touch $filename..."
touch $filename
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git status..."
git status
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git branch..."
git branch
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: ls -latr..."
ls -latr
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git diff files..."
git diff
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git add ./${filename}"
git add ${filename}
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git commit -m \"bot added\""
git commit -m "bot added"
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git log...."
git log --oneline
echo -e "*************************************************\n"

echo "*************************************************"
echo "RUNNING: git remote -v...."
git remote -v
echo -e "*************************************************\n"

#git push $remote $remote-$remote_branch
echo "*************************************************"
echo "RUNNING: git push $remote $remote_branch"
git push $remote $remote_branch
echo -e "*************************************************\n"
echo "Done."