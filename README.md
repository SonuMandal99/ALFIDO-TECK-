# Dockerized Node.js App with MongoDB

## Project Overview
This project containerizes a simple Express.js Node.js application and runs it with MongoDB using Docker and Docker Compose. The app exposes the root endpoint `/` and returns:

Dockerized Node.js App Running Successfully!

It is designed to be ready for GitHub upload and local Docker-based development.

## Folder Structure

```text
.
├── app.js
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── package.json
└── README.md
```

## Prerequisites
Before running the project, ensure you have the following installed:

- Docker Desktop or Docker Engine
- Docker Compose
- Node.js (for local development only)
- A browser or curl to verify the endpoint

## Docker Build Commands
Build the Docker image manually:

```bash
docker build -t dockerized-node-app .
```

## Docker Run Commands
Run the container directly:

```bash
docker run -d --name docker-node-app -p 3000:3000 \
  -e PORT=3000 \
  -e MONGO_URI=mongodb://host.docker.internal:27017/docker-node-app \
  dockerized-node-app
```

If you prefer to use the Compose setup, use the commands below.

## Docker Compose Commands
Start all services:

```bash
docker-compose up --build
```

Or with the newer Docker CLI:

```bash
docker compose up --build
```

Stop and remove containers:

```bash
docker-compose down
```

Or:

```bash
docker compose down
```

## Verification Steps
1. Start the application with Docker Compose.
2. Open the browser or use curl:

```bash
curl http://localhost:3000/
```

3. Check running containers:

```bash
docker ps
```

4. Verify the MongoDB service is running:

```bash
docker ps --filter name=mongo
```

## Expected Output
When you open the application endpoint, you should see:

```text
Dockerized Node.js App Running Successfully!
```

You should also see the container running in `docker ps`.

## Docker Best Practices Applied
- Lightweight multi-stage build using `node:18-alpine`
- Non-root user in the runtime image
- Exposed port `3000`
- Persistent MongoDB volume using `mongo-data`
- `.dockerignore` to reduce image size

## How to Take Screenshots
### Running containers
1. Run:

```bash
docker ps
```

2. Take a screenshot of the terminal output.

### Application endpoint
1. Open:

```text
http://localhost:3000/
```

2. Capture the browser page or run:

```bash
curl http://localhost:3000/
```

3. Save the output as a screenshot or image for your submission.

## Final Project Structure

```text
.
├── app.js
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── package.json
└── README.md
```
