#!/bin/bash
echo "=== Measuring VM startup time ==="
cd ../vagrant
time vagrant up --provision

echo "=== VM Memory and CPU Usage ==="
vagrant ssh -c "free -m && top -b -n1 | head -n 15"
