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

```bash
git clone https://github.com/yourusername/repository-name.git
2. Set up the Script
Navigate to the script directory:

bash
Copy
Edit
cd /path/to/script
Make sure the script is executable:

bash
Copy
Edit
chmod +x your_script.sh
3. (Optional) Customize the Configuration
If you're running the script for the first time, it will prompt you to enter your DreamHost API key, domain name, and the log file name. The values will be saved in a config.txt file for future use.

4. Set Up a Cron Job
To automate the script, you can set up a cron job to run it every 2 minutes (or any other interval you'd prefer). Edit the crontab:

bash
Copy
Edit
crontab -e
Then add the following line:

bash
Copy
Edit
*/2 * * * * /path/to/your/script.sh
This will run the script every 2 minutes. Make sure to replace /path/to/your/script.sh with the actual path to your script.

Usage
Once set up, the script will run automatically based on your cron schedule, checking if the external IP address matches the current DNS A record. If they differ, it will update the A record to match the current IP.

Logs of each script execution will be saved to the specified log file, and the script will only ask for the DreamHost API key, domain name, and log file name on the first run (or if the config.txt file is deleted).

Running Manually
To run the script manually:

bash
Copy
Edit
./your_script.sh
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

markdown
Copy
Edit

### Sections Explanation:
- **Overview**: Describes the script and what it does.
- **Prerequisites**: List dependencies and requirements for the script to work.
- **Installation**: Provides step-by-step instructions on how to set up the script.
- **Usage**: Explains how the script works and how to run it manually.
- **Configuration**: Details how the configuration works and where settings are saved.
- **License**: Includes a basic license section (you can modify this depending on your licensing choice).
- **Author**: Provides attribution to you or the repository's creator.

You can replace the placeholders (like `your_script.sh` and `repository-name`) with your actual script and GitHub repository details.
