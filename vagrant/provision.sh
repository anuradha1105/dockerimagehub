#!/usr/bin/env bash

# Update package lists
sudo apt-get update -y

# Install Python and pip
sudo apt-get install -y python3 python3-pip

# Install Flask and pytest
pip3 install flask pytest

# Optional: install curl, htop for testing/monitoring
sudo apt-get install -y curl htop
