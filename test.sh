#!/bin/bash
echo "Checking containers..."
docker-compose ps
echo "Testing database..."
docker exec -it fullstack-todo-list-database-1 mongo -u mongo-shared-dev -p fikTpih4U2! --eval "db.runCommand({ping:1})" || echo "Database not accessible"
echo "Testing backend GET /todos..."
curl -f http://localhost:3000/todos || echo "GET /todos not accessible"
echo "Testing backend POST /todos..."
curl -v -X POST -H "Content-Type: application/json" -d '{"title":"Test Todo","description":"Test Description","isCompleted":false}' http://localhost:3000/todos || echo "POST /todos not accessible"
echo "Testing frontend..."
curl -f http://localhost:3000 || echo "Frontend not accessible"