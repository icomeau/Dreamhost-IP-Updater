# Dreamhost-IP-Updater
Dreamhost IP updated for DNS

# DNS Update Script

This script is designed to automatically update the DNS A record for a specified domain on DreamHost whenever your external IP address changes. It compares your current external IP address with the existing DNS record and updates the A record if they don't match.

## Features

- Automatically updates DreamHost DNS A record based on your external IP address.
- Stores configuration (API key, domain name, and log file) in a persistent file to avoid repeated user input.
- Logs actions and responses to a log file for tracking and debugging.
- Can be scheduled to run at regular intervals using a cron job.

## Prerequisites

Before using this script, you will need:
- A DreamHost API key.
- The domain you wish to update.
- A Unix-based system (Linux/macOS) with `bash`, `curl`, and `dig` installed.

### Dependencies:
- `curl`: For fetching your external IP address and interacting with DreamHost API.
- `dig`: For checking the current A record for the domain.

## Installation

### 1. Clone the Repository

Clone this repository to your local machine:

1. git clone https://github.com/icomeau/Dreamhost-IP-Updater.git
2. Navigate to the script directory:
3. Make sure the script is executable:  chmod +x check_ip.sh
4. Run the script by typing ./check_ip.sh

3. (Optional) Customize the Configuration
If you're running the script for the first time, it will prompt you to enter your DreamHost API key, domain name, and the log file name. The values will be saved in a config.txt file for future use.

4. Set Up a Cron Job
To automate the script, you can set up a cron job to run it every 2 minutes (or any other interval you'd prefer). Edit the crontab:
crontab -e
Then add the following line:
*/2 * * * * /path/to/your/check_ip.sh


Usage
Once set up, the script will run automatically based on your cron schedule, checking if the external IP address matches the current DNS A record. If they differ, it will update the A record to match the current IP.

Logs of each script execution will be saved to the specified log file, and the script will only ask for the DreamHost API key, domain name, and log file name on the first run (or if the config.txt file is deleted).

Running Manually
To run the script manually:
./check_ip.sh

Log Output
By default, the script will log its actions (success or failure) to the specified log file. You can customize the log file name when prompted.

Configuration
API Key: Enter your DreamHost API key when prompted.
Domain Name: Enter the domain name (e.g., home.example.com) whose DNS A record you want to update.
Log File: Enter the name of the log file where script actions will be recorded (default: check_ip.log).
These values will be saved to a config.txt file so subsequent runs won't require user input.

License
This script is open-source and free to use. You may modify and distribute it under the terms of the MIT License.

Author
Ian Comeau
