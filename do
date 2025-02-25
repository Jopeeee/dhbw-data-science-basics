#!/bin/bash

# Function to display help message
function display_help {
    echo "Usage: $0 {setup|help}"
    echo
    echo "Commands:"
    echo "  setup    Create a virtual environment for Python and install dependencies."
    echo "  help     Display this help message."
}

# Function to setup virtual environment
function setup_venv {
    python3 -m venv .venv
    echo "Virtual environment created in '.venv' directory."

    # Activate the virtual environment
    source .venv/bin/activate
    
    # Install dependencies from requirements.txt
    if [ -f requirements.txt ]; then
        pip install -r requirements.txt
        echo "Dependencies installed from 'requirements.txt'."
    else
        echo "No 'requirements.txt' file found."
    fi
    
    # Deactivate the virtual environment
    deactivate
}

# Check the command line argument
case "$1" in
    setup)
        setup_venv
        ;;
    help)
        display_help
        ;;
    *)
        display_help
        exit 1
        ;;
esac