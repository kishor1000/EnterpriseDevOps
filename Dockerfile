# Base Image
FROM ubuntu:24.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install build tools
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy application source
COPY app/ ./app/
COPY CMakeLists.txt .

# Configure and build the application
RUN cmake -S . -B build
RUN cmake --build build

# Default command
CMD ["./build/calculator"]
