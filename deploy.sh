#!/bin/bash

# Step 1: Push to GitHub
echo "Pushing changes to GitHub..."
git add .
git commit -m "Deploying changes"
git push origin main  # Replace 'main' with your branch name if different

if [ $? -ne 0 ]; then
    echo "Error pushing to GitHub. Exiting."
    exit 1
fi

# Step 2: Install Neocities CLI (if not installed)
if ! command -v neocities &> /dev/null
then
    echo "Neocities CLI not found, installing..."
    npm install -g neocities
fi

# Step 3: Clean up files that are not supposed to be deployed
echo "Cleaning up files before deploying..."
rm -rf .git  # Removes the .git directory entirely
rm -f .gitignore  # Optional: remove .gitignore if you don't want it pushed

# Step 4: Push to Neocities (excluding unwanted files)
echo "Deploying to Neocities..."
neocities push . --exclude .git --exclude README.md --exclude deploy.sh --exclude .github --exclude .DS_Store  # Excluding specific files

if [ $? -ne 0 ]; then
    echo "Error deploying to Neocities. Exiting."
    exit 1
fi

echo "Deployment complete!"
