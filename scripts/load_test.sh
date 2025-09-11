#!/bin/bash
echo "=== Running Load Test with ApacheBench ==="
ab -n 1000 -c 50 http://127.0.0.1:5000/
