import requests
import time
import statistics

URL = "http://127.0.0.1:5000/"   # Flask app endpoint
REQUESTS = 50                    # Number of requests to send

def benchmark():
    times = []

    print(f"Sending {REQUESTS} requests to {URL}...")

    for i in range(REQUESTS):
        start = time.time()
        try:
            response = requests.get(URL)
            elapsed = time.time() - start
            times.append(elapsed)

            print(f"Request {i+1}: {response.status_code} in {elapsed:.4f} sec")
        except Exception as e:
            print(f"Request {i+1} failed: {e}")

    if times:
        print("\n📊 Benchmark Results:")
        print(f"Average response time: {statistics.mean(times):.4f} sec")
        print(f"Median response time: {statistics.median(times):.4f} sec")
        print(f"Fastest response: {min(times):.4f} sec")
        print(f"Slowest response: {max(times):.4f} sec")

if __name__ == "__main__":
    benchmark()
