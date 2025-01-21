#!/bin/bash

echo "Running tests for Permission Network Checker..."
../Permission_Network_Checker.sh 80 # Replace with a valid port for testing
if [ $? -eq 0 ]; then
    echo "Permission Network Checker test passed."
else
    echo "Permission Network Checker test failed."
fi

echo "Running tests for Server Health Checker..."
../Server_Health_Checker.sh
if [ $? -eq 0 ]; then
    echo "Server Health Checker test passed."
else
    echo "Server Health Checker test failed."
fi

echo "All tests completed."