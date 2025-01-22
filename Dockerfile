# Use the official Node.js image as a parent image
FROM node:16-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the TypeScript code
RUN npm run build

# Use a smaller Node.js image for the runtime environment
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy the built files from the builder stage
COPY --from=builder /app/build /app/build
COPY --from=builder /app/node_modules /app/node_modules

# Set environment variables
ENV GEMINI_API_KEY=your-gemini-api-key
ENV PERPLEXITY_API_KEY=your-perplexity-api-key
ENV STACK_EXCHANGE_KEY=your-stack-exchange-key

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD ["node", "build/index.js"]