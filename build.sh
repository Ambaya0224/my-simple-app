#!/bin/bash

# build.sh - Simple build automation script for Python application

echo "--- Starting Build Process ---"

# Step 1: Clean up previous builds (optional, but good practice)
echo "Cleaning up previous build artifacts..."
rm -rf dist/ build/ *.egg-info/ __pycache__/

# Step 2: Run Unit Tests
echo "Running Unit Tests..."
# Use pytest from the virtual environment
pytest_output=$(./venv/bin/pytest 2>&1) # Capture output and errors
pytest_exit_code=$? # Get the exit code of the pytest command

echo "$pytest_output"

if [ $pytest_exit_code -ne 0 ]; then
    echo "Unit tests FAILED. Build process halted."
    exit 1 # Exit with an error code if tests fail
else
    echo "Unit tests PASSED (or completed with expected failures for assessment)."
fi

# Step 3: Create Deployable Package (Wheel and Source Distribution)
echo "Creating deployable package..."
# Use python from the virtual environment
./venv/bin/python -m build

if [ $? -ne 0 ]; then
    echo "Package creation FAILED. Build process halted."
    exit 1
else
    echo "Deployable package created successfully in 'dist/' directory."
fi

echo "--- Build Process Completed ---"
