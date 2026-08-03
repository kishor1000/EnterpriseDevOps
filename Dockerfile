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

# Copy source code
COPY app/ ./app/
COPY CMakeLists.txt .

# Create build directory
RUN mkdir build

# Build application
WORKDIR /app/build

RUN cmake ..

RUN make

ENV APP_NAME=EnterpriseCalculator
ENV APP_VERSION=1.0

# Run application
CMD ["./calculator"]
