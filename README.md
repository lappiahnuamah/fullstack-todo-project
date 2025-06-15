# Fullstack Todo List Application Documentation

This document provides instructions for setting up, configuring, and troubleshooting the fullstack todo list application containerized using Docker and Docker Compose. The application consists of a frontend (React), a backend (Node.js with Express), and a MongoDB database.

## Setup Instructions

### Prerequisites
- **Docker**: Install Docker Desktop or Docker Engine (version 20.10 or later) on your system. Download from [docker.com](https://www.docker.com/get-started).
- **Docker Compose**: Ensure Docker Compose (version 1.29 or later) is installed. It comes with Docker Desktop or can be installed separately [here](https://docs.docker.com/compose/install/).
- **Git**: Optional, for cloning the repository. Install from [git-scm.com](https://git-scm.com/downloads).
- **Node.js**: Required for local development (version 20.x recommended). Download from [nodejs.org](https://nodejs.org/).

### Step-by-Step Guide
1. **Clone the Repository**:
   - Open a terminal and run:
     ```bash
     git clone https://github.com/icnoka/fullstack-todo-list.git
     cd fullstack-todo-list
     ```
   - Ensure the directory structure includes `Backend/`, `Frontend/`, and a `docker-compose.yml` file.

2. **Adjust Directory Structure (if needed)**:
   - Verify that `Backend/` contains `index.js`, `DB/`, and `package.json`, and `Frontend/` contains its own `package.json` and `src/`.
   - If the structure differs, move the files accordingly.

3. **Build the Containers**:
   - Run the following command to build the Docker images:
     ```bash
     docker-compose build
     ```
   - This creates images for the frontend, backend, and database services.

4. **Run the Containers**:
   - Start the containers in detached mode:
     ```bash
     docker-compose up -d
     ```
   - The application will be accessible at:
     - Frontend: `http://localhost:3000`
     - Backend API: `http://localhost:5000/todos`
     - MongoDB (for debugging): `localhost:27017`

5. **Verify the Setup**:
   - Open `http://localhost:3000` in a browser to view the todo list UI.
   - Test the backend API with:
     ```bash
     curl http://localhost:5000/todos
     ```

6. **Stop the Containers**:
   - To stop the containers:
     ```bash
     docker-compose down
     ```
   - To remove volumes and reset data:
     ```bash
     docker-compose down -v
     ```

## Network and Security Configurations

### Network Configuration
- **Network**: The application uses a custom Docker network named `app-network` (created with `driver: bridge`). This allows internal communication between the `frontend`, `backend`, and `database` services.
  - Frontend accesses the backend at `http://backend:5000` (resolved via the network).
  - Backend connects to the database at `database:27017`.
- **Exposed Ports**:
  - `3000:3000`: Maps the frontend service to host port 3000.
  - `5000:5000`: Maps the backend service to host port 5000.
  - `27017:27017`: Exposes the MongoDB service for local debugging (optional, remove in production).

### Security Settings
- **Database Credentials**: The MongoDB container is configured with:
  - Username: `mongo-shared-dev`
  - Password: `fikTpih4U2!`
  - These are set via `MONGO_INITDB_ROOT_USERNAME` and `MONGO_INITDB_ROOT_PASSWORD` environment variables in `docker-compose.yml`.
- **Environment Variables**: The backend uses `MONGODB_URI` to connect to MongoDB, set to `mongodb://mongo-shared-dev:fikTpih4U2!@database:27017/?authSource=admin`. This can be overridden with a `.env` file for security:
  ```env
  MONGODB_URI=mongodb://your-username:your-password@database:27017/?authSource=admin

## Snapshots

<img src="./Frontend/src/assets/home-snapshot.png" alt="home page"/>
