#!/bin/bash

# Fetch the HTTP response code of the website
http_code=$(curl -s -o /dev/null -w "%{http_code}" guvi.in)

# Print the HTTP error code
echo "HTTP Response Code: $http_code"

# Check the HTTP status code and print success/failure message
if [[ "$http_code" -ge 200 && "$http_code" -lt 300 ]]; then
  echo "Success: Website is reachable."
else
  echo "Failure: Website is not reachable or returned an error."
fi
