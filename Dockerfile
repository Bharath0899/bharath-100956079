FROM node:20-alpine
WORKDIR /app

# Copy package files (no globs; JSON-array form handles spaces in paths)
COPY ["Assignment 1 Files/package.json", "."]
COPY ["Assignment 1 Files/package-lock.json", "."]

# Install production deps
RUN npm ci --only=production

# Copy the rest of the app (folder name contains spaces)
COPY ["Assignment 1 Files/.", "."]

# Cloud Run port
ENV PORT=8080
EXPOSE 8080

# Start script must exist in package.json
CMD ["npm", "start"]
