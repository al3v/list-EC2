#!/bin/bash

# Initialize total counts
total_running_count=0
total_stopped_count=0

# Get a list of all AWS regions
regions=$(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text)

# Iterate through each region and list instances
for region in $regions; do
  echo "Instances in region: $region"

  # Get instance details for the region
  instances=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, State.Name]" --region $region --output json)

  # Count running and stopped instances
  running_count=$(echo "$instances" | jq -r '.[][] | select(.[1] == "running") | .[0]' | wc -l)
  stopped_count=$(echo "$instances" | jq -r '.[][] | select(.[1] == "stopped") | .[0]' | wc -l)

  # Display running and stopped instances for the region
  echo "Running instances: $running_count"
  echo "Stopped instances: $stopped_count"

  # Display instance IDs with their states under the region
  echo "Instance IDs:"
  echo "$instances" | jq -r '.[][] | "\(.[0]) - \(.[1])"'
  
  echo "-------------------------"

  # Update total counts
  total_running_count=$((total_running_count + running_count))
  total_stopped_count=$((total_stopped_count + stopped_count))
done

# Display total counts of running and stopped instances across all regions
echo "Total running instances across all regions: $total_running_count"
echo "Total stopped instances across all regions: $total_stopped_count"
