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

echo "Done."