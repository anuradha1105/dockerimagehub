# Dockerized Flask App with CI/CD 🚀

This repository contains a simple Flask web application containerized with Docker and integrated with a **CI/CD pipeline** using **GitHub Actions**.  

The pipeline ensures that code changes are automatically tested, packaged into a Docker image, and pushed to Docker Hub.

---

## 🔄 Workflow Overview

The pipeline is defined in [`.github/workflows/cicd.yml`](.github/workflows/cicd.yml).  

It has two jobs:

1. **Test**  
   - Runs on every `push` and `pull_request` to the `main` branch.  
   - Sets up Python.  
   - Installs dependencies.  
   - Runs unit tests with `pytest`.  

2. **Build and Push**  
   - Runs only on `push` to `main` (after tests pass).  
   - Builds a Docker image using the project `Dockerfile`.  
   - Pushes the image to Docker Hub with tags:  
     - `latest` → points to the most recent build.  
     - `<short commit SHA>` → unique traceable version.  

---

## ⚙️ Trigger

The pipeline runs automatically on:
- **Pushes to `main`** → full CI/CD (tests + build + push).  
- **Pull requests to `main`** → tests only.  
- **Manual runs** → using the “Run workflow” button in GitHub Actions.  

---

## 🛠 Why GitHub Actions?

- **Native to GitHub:** Works directly with my repo, no extra setup needed.  
- **Free for public repos:** Cost-effective for our assignmnets and projects (students)  
- **Secure secret management:** Easy to store Docker Hub credentials.    
- **Familiarity:** I chose GitHub Actions because I have already worked on it, and I am familiar with it.  

---


## ✅ Example Run (Screenshots to Include)

1. **Workflow Trigger**

<img width="1046" height="512" alt="image" src="https://github.com/user-attachments/assets/20c39af1-3158-4358-bffb-e052df181aa5" />

<img width="1053" height="502" alt="image" src="https://github.com/user-attachments/assets/8b9ef6df-f74c-4d4e-ac3a-ddb712ea139c" />

<img width="1045" height="519" alt="image" src="https://github.com/user-attachments/assets/30114758-4af3-4c23-b607-c545ead10bf5" />

<img width="963" height="498" alt="image" src="https://github.com/user-attachments/assets/d3294042-d16f-41bc-bcb6-562db07604f4" />


4. **Docker Hub Repository**  
   Tags `latest` and `<short-sha>` visible in Docker Hub.  
<img width="1219" height="368" alt="image" src="https://github.com/user-attachments/assets/2b87ca9a-e8b4-4e71-a693-daf729cfd9aa" />

<img width="626" height="467" alt="image" src="https://github.com/user-attachments/assets/ed86c351-4c2d-47b2-9b2c-025a842813a6" />



---

## 🧩 Step-by-Step Explanation

| Stage | Action | Purpose |
|-------|--------|---------|
| **Trigger** | Push to `main` starts pipeline | Automates CI/CD |
| **Checkout** | Repo pulled to runner | Access code & Dockerfile |
| **Set up Python** | `actions/setup-python` | Clean test env |
| **Install deps** | `pip install` | Get Flask + pytest |
| **Run tests** | `pytest -q` | Block bad builds |
| **Login to Docker Hub** | `docker/login-action` | Secure registry auth |
| **Build & Push** | `docker/build-push-action` | Create + publish image |

---

## ⚠️ Challenges & Solutions

1. **Secret Management**  
   - *Issue:* Avoid exposing Docker Hub credentials.  
   - *Solution:* Use GitHub Actions secrets (`DOCKER_USERNAME`, `DOCKER_PASSWORD`).    

2. **Accidental Deploys from PRs**  
   - *Issue:* PRs shouldn’t push to Docker Hub.  
   - *Solution:* Condition to publish only on `push` to `main`.  

3. **Build Performance**  
   - *Issue:* Builds can be slow.  
   - *Solution:* Use official `buildx` and pinned dependencies.  

---

