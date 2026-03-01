# Stage 1: Build
FROM ubuntu:22.04 AS build

RUN apt-get update && apt-get install -y g++

WORKDIR /app
COPY Hello_world.cpp Hello_world_test.sh ./

RUN g++ Hello_world.cpp -o hello
RUN chmod +x Hello_world_test.sh && ./Hello_world_test.sh

# Stage 2: Final image
FROM ubuntu:22.04
WORKDIR /app
COPY --from=build /app/hello .
CMD ["./hello"]