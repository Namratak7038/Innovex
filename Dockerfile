FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy application
COPY . .

# Create .env if not exists
RUN echo "PORT=4000\nMONGODB_URI=mongodb://mongo:27017/smartopd" > .env

# Expose port
EXPOSE 4000

# Start server
CMD ["npm", "run", "dev"]
