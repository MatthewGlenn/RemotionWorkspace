FROM node:20-bookworm

LABEL org.opencontainers.image.source https://github.com/matthewglenn/remotionworkspace

RUN apt-get update

RUN apt-get install -y chromium

# Copy everything from your project to the Docker image. Adjust if needed.
COPY package.json package*.json yarn.lock* pnpm-lock.yaml* bun.lockb* tsconfig.json* remotion.config.* .prettierrc* ./

# Install the right package manager and dependencies. Adjust if needed.
RUN npm i

# Copy the node_modules folder to the Docker image
COPY node_modules ./node_modules

# Copy the hello world source code to the Docker image
COPY src ./src

# Expose the port that the server is running on
EXPOSE 3000

CMD ["npx", "remotion studio"]