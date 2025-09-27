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



## ✅ Run

1. **Workflow Trigger**



<img width="1046" height="512" alt="image" src="https://github.com/user-attachments/assets/20c39af1-3158-4358-bffb-e052df181aa5" />



<img width="1107" height="561" alt="image" src="https://github.com/user-attachments/assets/6f7fb20a-2fc2-48bc-8d0c-4c4f0bf941e2" />




<img width="969" height="530" alt="image" src="https://github.com/user-attachments/assets/a1ad29c0-6eb8-429a-9991-fa5d64f8e7d5" />




2. **Docker Hub Repository**  
   Tags `latest` and `<short-sha>` visible in Docker Hub.


    
<img width="1241" height="517" alt="image" src="https://github.com/user-attachments/assets/131938a2-9917-45e8-aad6-1aab912c0d9a" />


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

