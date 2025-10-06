# Node LTS runtime
FROM node:20-alpine

# Workdir inside the container
WORKDIR /app

# Copy only package files first (better caching)
COPY "Assignment 1 Files/package*.json" ./

# Install production deps
RUN npm ci --only=production

# Copy the rest of the app from the subfolder (handles spaces in folder name)
COPY "Assignment 1 Files/." .

# Cloud Run will set PORT
ENV PORT=8080
EXPOSE 8080

# Start command (must exist in your package.json scripts)
CMD ["npm", "start"]
