#!/bin/bash

# Step 1: Push to GitHub (if needed)
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

# Step 3: Exclude unwanted files and push to Neocities
echo "Deploying to Neocities..."
neocities push . --exclude .git --exclude .DS_Store --exclude README.md --exclude deploy.sh --exclude .github

if [ $? -ne 0 ]; then
    echo "Error deploying to Neocities. Exiting."
    exit 1
fi

echo "Deployment complete!"

