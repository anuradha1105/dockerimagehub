#!/bin/bash
echo "=== Measuring Docker startup time ==="
time docker run -d --name flask-app-measure -p 5000:5000 flask-app-test

echo "=== Container Resource Usage ==="
docker stats --no-stream flask-app-measure

docker rm -f flask-app-measure
