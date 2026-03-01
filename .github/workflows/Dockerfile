# Use Ubuntu as base
FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && apt-get install -y g++ && rm -rf /var/lib/apt/lists/*

# Copy source code
COPY Hello_world.cpp /app/Hello_world.cpp
COPY Hello_world_test.sh /app/Hello_world_test.sh

WORKDIR /app

# Build program
RUN g++ Hello_world.cpp -o hello

# Make test script executable
RUN chmod +x Hello_world_test.sh

# Run tests
RUN ./Hello_world_test.sh

# Set default command
CMD ["./hello"]