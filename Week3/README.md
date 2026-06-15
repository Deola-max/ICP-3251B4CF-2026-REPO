# Week 3: Project 1 Completion - Multi-Tier Application Dockerization Runbook

**Intern Name:** Favour Lambe  
**Portal ID:** ICP-3251B4CF-2026  
**Project Track:** Project 2 - Dockerize an Application (Completed)  

---

## 📋 Project Overview
This repository contains the complete production-optimized deployment configuration for a containerized 3-tier application microservice stack. The system separates components into isolated environments while preserving strict internal communication networking rules.

## 🏗️ Architectural Layout
* **Frontend:** Built using a multi-stage Docker configuration and served via an optimized Nginx Alpine production image.
* **Backend API:** Managed via Node.js runtime environment with distinct environment variables.
* **Database Layer:** Stateful PostgreSQL service utilizing isolated volume configurations for persistent local storage.

## 🛠️ Operational Runbook (How to Run)

### 1. Prerequisites
Ensure the local management machine has the following versions active (Verified in Week 1 environment setup):
* Docker Engine (v28.2.2+)
* Docker Compose CLI tool

### 2. Deployment Blueprint Execution
To build the multi-stage images, map network dependencies, and launch the service cluster in detached mode, execute:
```bash
docker compose up -d