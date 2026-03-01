#!/bin/bash

set -e  # stop on first failure. If any command fails, immediately stop the script.”

# Compile
g++ Hello_world.cpp -o hello

run_test() {
    input="$1"
    expected="$2"

    output=$(printf "%s\n" "$input" | ./hello)

    if [ "$output" = "$expected" ]; then
        echo "PASS: $input"
    else
        echo "FAIL: $input"
        echo "Expected: $expected"
        echo "Got: $output"
        exit 1
    fi
}

run_test "John" "Enter your name: Hello Hi, John!"
run_test "Alice" "Enter your name: Hello Hi, Alice!"
run_test "" "Enter your name: Hello Hi, !"

echo "All CI tests passed ✅"