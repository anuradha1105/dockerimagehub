# Docker & VM Performance Comparison Assignment

## Overview
This project demonstrates:

1. Building a Docker image from a simple Flask web application.
2. Running automated tests inside a container.
3. Pushing the Docker image to Docker Hub.
4. Comparing performance metrics of the same application running in a Virtual Machine (VM) vs a Docker container.

The goal is to analyze startup time, memory usage, CPU utilization, and overall efficiency between containers and VMs.

---

## Project Structure
dockerimagehub/
├── app.py # Flask application
├── Dockerfile # Docker image definition
├── requirements.txt # Python dependencies
├── benchmark.py # Script to benchmark the app
├── compare_results.py # Compare VM vs Container metrics
├── README.md # Project documentation
├── reports/
│ ├── vm_run_1.txt # VM benchmark results
│ ├── container_run_1.txt # Container benchmark results
├── scripts/
│ ├── measure_vm.sh # Benchmark VM
│ ├── measure_container.sh # Benchmark Docker
├── vagrant/
│ ├── Vagrantfile # VM configuration
│ ├── provision.sh # VM setup script
└── screenshots/ # Screenshots of Docker, VM




