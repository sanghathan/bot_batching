#!/bin/bash
# Get the current timestamp in the format YYYYMMDD_HHMMSS
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create a filename based on the timestamp
filename="file_$timestamp.txt"

# Use the filename in your script or command
echo "Creating $filename..."
touch $filename

echo "git config emails..."
git config --global user.email "amit.tiwari@gmail.com"
echo "git config user name..."
git config --global user.name "Ice Tee"
echo "git status..."
git status

echo "Listing files..."
ls -latr

echo "git diff files..."
git diff

# Other commands using the filename can go here
# For example, you might want to write data to the file or perform other operations.

#git_status=$(git status)
#if [[ $git_status -eq 0  ]]; then
#    echo "Git status passed successfully"
#else
#    echo "Git status failed or produced unexpected output"
#    exit 1
#fi 
echo "gonna run: git add ./${filename}"
git add ${filename}
echo "gonna run: git commit -m \"bot added\""
git commit -m "bot added"
echo "Done."