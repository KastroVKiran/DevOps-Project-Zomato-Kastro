# Use Node.js 16 slim as the base image
FROM node:16-slim

# Set working directory
WORKDIR /app

# Copy only package.json and lock file first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Build the React app (optional: can be skipped in prod server if already built)
RUN npm run build

# Use a minimal base image for production
# If you don't need to serve the React build from Node.js, use a static server like nginx

# EXPOSE port app runs on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

