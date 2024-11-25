#!/bin/bash

# Function to calculate stats
calculate_stats() {
    local values=("$@")
    local sum=0
    local min=${values[0]}
    local max=${values[0]}
    
    for value in "${values[@]}"; do
        sum=$(echo "$sum + $value" | bc -l)
        
        # Update min
        if [ $(echo "$value < $min" | bc -l) -eq 1 ]; then
            min=$value
        fi
        
        # Update max
        if [ $(echo "$value > $max" | bc -l) -eq 1 ]; then
            max=$value
        fi
    done
    
    local count=${#values[@]}
    local mean=$(echo "scale=3; $sum / $count" | bc -l)
    
    echo "  Min: ${min}s"
    echo "  Max: ${max}s"
    echo "  Mean: ${mean}s"
}

# Number of requests per region
REQUESTS=10

# URLs
SG_URL="https://vfhshm2rwijwepjvffnvuir4t40tdbir.lambda-url.ap-southeast-1.on.aws/"
EU_URL="https://2twxsirpop66yfrchm3mrlcgdy0yvmaj.lambda-url.eu-west-1.on.aws/"
US_URL="https://nlhuakeg5sfqvispi5322ocudq0jviru.lambda-url.us-east-1.on.aws/"

echo "Running $REQUESTS requests per region..."
echo

# Arrays to store times
singapore_times=()
ireland_times=()
virginia_times=()

# Collect times
for i in $(seq 1 $REQUESTS); do
    singapore_times+=( $(curl -w "%{time_total}" -o /dev/null -s "$SG_URL") )
    ireland_times+=( $(curl -w "%{time_total}" -o /dev/null -s "$EU_URL") )
    virginia_times+=( $(curl -w "%{time_total}" -o /dev/null -s "$US_URL") )
done

# Print results
echo "Singapore (ap-southeast-1):"
calculate_stats "${singapore_times[@]}"
echo
echo "Ireland (eu-west-1):"
calculate_stats "${ireland_times[@]}"
echo
echo "Virginia (us-east-1):"
calculate_stats "${virginia_times[@]}"
