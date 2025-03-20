# Use an official lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy the rest of the application files
COPY . .

# Copy the environment variables file (only for build-time reference)
# This file won't persist in the final container image
COPY config.env /app/config.env

# Set environment variables from the file
ARG APP_PORT
ARG DB_HOST
ARG DB_USER
ARG DB_PASS

# Set environment variables using the values from the file
ENV APP_PORT=${APP_PORT}
ENV DB_HOST=${DB_HOST}
ENV DB_USER=${DB_USER}
ENV DB_PASS=${DB_PASS}

# Expose the application port
EXPOSE ${APP_PORT}

# Start the application
CMD ["npm", "start"]
