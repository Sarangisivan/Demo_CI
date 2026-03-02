# ----------------------------
# Stage 1: Build + Test
# ----------------------------
FROM ubuntu:22.04 AS builder

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install compiler
RUN apt-get update && \
    apt-get install -y g++ && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy source and test files
COPY Hello_world.cpp .
COPY Hello_world_test.sh .

# Compile program
RUN g++ Hello_world.cpp -o hello

# Run tests
RUN chmod +x Hello_world_test.sh && ./Hello_world_test.sh

# ----------------------------
# Stage 2: Minimal Runtime
# ----------------------------
FROM ubuntu:22.04

WORKDIR /app

# Copy only compiled binary (no compiler included)
COPY --from=builder /app/hello .

# Run program when container starts
CMD ["./hello"]