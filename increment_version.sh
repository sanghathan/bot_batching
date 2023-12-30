#!/bin/bash
# Get the current timestamp in the format YYYYMMDD_HHMMSS
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create a filename based on the timestamp
filename="file_$timestamp.txt"

# Use the filename in your script or command
echo "Creating $filename..."
touch $filename

# Other commands using the filename can go here
# For example, you might want to write data to the file or perform other operations.

#git_status=$(git status)
#if [[ $git_status -eq 0  ]]; then
#    echo "Git status passed successfully"
#else
#    echo "Git status failed or produced unexpected output"
#    exit 1
#fi 
git status
git add $filename
git commit $filename -m "bot added ${filename}"
echo "Done."