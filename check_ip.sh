#!/bin/bash

# Path to a file that stores the previous configuration
config_file="config.txt"

# Check if the config file exists
if [ -f "$config_file" ]; then
  # Read the stored values from the config file
  source "$config_file"
else
  # Ask the user for the DreamHost API Key, show the previous value if available
  read -p "Enter your DreamHost API Key: " api_key
  # Ask the user for the domain name
  read -p "Enter the domain name to change (e.g., home.example.com): " domain
  # Ask the user for the log file name, show the previous value if available, default to "check_ip.log"
  read -p "Enter the log file name (default: check_ip.log): " log_file
  log_file=${log_file:-check_ip.log}

  # Save the values to the config file for future runs
  echo "api_key=$api_key" > "$config_file"
  echo "domain=$domain" >> "$config_file"
  echo "log_file=$log_file" >> "$config_file"
fi

# Get the external IP address
external_ip=$(curl -s https://icomeau.com/ip/index.php)

# Get the current A record IP for the specified domain
dreamhost_ip=$(dig +short $domain)

# Timestamp for log
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Compare the two IPs
if [ "$external_ip" == "$dreamhost_ip" ]; then
  echo "$timestamp: The external IP $external_ip matches the IP for $domain"
else
  echo "$timestamp: The external IP does NOT match the IP for $domain" | tee -a $log_file
  echo "$timestamp: External IP: $external_ip" | tee -a $log_file
  echo "$timestamp: DreamHost IP: $dreamhost_ip" | tee -a $log_file

  # Step 1: Remove the existing A record for the domain with the current DreamHost IP
  echo "$timestamp: Removing existing A record for $domain..." | tee -a $log_file
  remove_response=$(curl -s "https://api.dreamhost.com/?key=$api_key&cmd=dns-remove_record&record=$domain&type=A&value=$dreamhost_ip")

  # Log the remove response
  echo "$timestamp: Remove Response: $remove_response" | tee -a $log_file

  # Step 2: Add a new A record for the domain with the new external IP
  echo "$timestamp: Adding new A record for $domain with IP $external_ip..." | tee -a $log_file
  add_response=$(curl -s "https://api.dreamhost.com/?key=$api_key&cmd=dns-add_record&record=$domain&type=A&value=$external_ip")

  # Log the add response
  echo "$timestamp: Add Response: $add_response" | tee -a $log_file

  # Check if the removal and addition were successful
  if [[ "$remove_response" == *"success"* && "$add_response" == *"success"* ]]; then
    echo "$timestamp: DNS record for $domain successfully updated to $external_ip" | tee -a $log_file
  else
    echo "$timestamp: Failed to update DNS record. Removal response: $remove_response, Addition response: $add_response" | tee -a $log_file
  fi
fi
