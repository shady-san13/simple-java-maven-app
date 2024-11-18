#!/bin/bash

# Hardcoded values for debugging
PROJECT_NAME="my-app"
PROJECT_VERSION="1.0"

echo "Debugging with hardcoded values:"
echo "Project Name: $PROJECT_NAME"
echo "Project Version: $PROJECT_VERSION"

# Example usage of these variables in your script
echo "Starting deployment for $PROJECT_NAME version $PROJECT_VERSION..."

# Simulate some logic using the hardcoded values
if [[ $PROJECT_NAME == "my-app" && $PROJECT_VERSION == "1.0" ]]; then
    echo "Project and version match the expected hardcoded values."
    # Add your deployment logic or commands here
    echo "Deploying $PROJECT_NAME version $PROJECT_VERSION..."
else
    echo "Unexpected values. Check your hardcoded settings."
fi

# Placeholder for dynamic logic
# Uncomment the following lines to fetch dynamically after debugging
# PROJECT_NAME=$(fetch_project_name_from_env)
# PROJECT_VERSION=$(fetch_project_version_from_env)

echo "Debugging complete."
exit 0
