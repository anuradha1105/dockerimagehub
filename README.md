🌟 Performance Comparison: Docker Containers vs Virtual Machines
1️⃣ Project Overview

This project analyzes the performance of a Flask web application running on:
1. Docker container
2. Vagrant-managed Virtual Machine
We measure startup time, memory usage, CPU utilization, and request throughput to understand the efficiency differences between containers and VMs.


2️⃣ Application Details
Sample Flask App:
from flask import Flask
""app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000) ""
Lightweight application for benchmarking.


Returns a simple “Hello World!” response.


3️⃣ Environment Setup
🐳 Docker
Build the Docker image:
bash
Copy code
docker build -t flask-app .
Run the container:
bash
Copy code
docker run -d -p 5000:5000 --name flask-container flask-app
Benchmark metrics using measure_container.sh or benchmark.py.

🖥️ Virtual Machine (VM)
Spin up the VM with Vagrant:
bash
Copy code
vagrant up
vagrant ssh
Inside the VM:
bash
Copy code
sudo apt update
sudo apt install python3-pip -y
pip3 install flask
python3 app.py
Benchmark metrics using measure_vm.sh or benchmark.py.





