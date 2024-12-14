# Node Base Image
# Base image
FROM node:12.2.0-alpine

# Working directory
WORKDIR /node

# Copy application code
COPY . .

# Copy Locust script into the container
COPY locustfile.py /app/locustfile.py

# Install dependencies
RUN npm install

# Run tests (optional: may fail the build if tests fail)
RUN npm run test

# Install Locust for load testing
RUN apk add --no-cache python3 py3-pip && pip3 install locust

# Expose the application port
EXPOSE 8000

# Run the application
CMD ["node", "app.js"]
