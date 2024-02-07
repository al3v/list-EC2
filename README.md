# AWS EC2 Instance Status Checker

This script checks the status (running or stopped) of AWS EC2 instances in all available regions and provides a summary of the counts.

## Prerequisites

- AWS CLI installed and configured with appropriate credentials
- `jq` command-line JSON processor (install with `sudo apt-get install jq` on Linux)

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/al3v/list-EC2.git
   cd list-EC2

2. Make the script executable:
   ```bash
   chmod +x list_instances.sh

3. Run the script:
   ```bash
   ./list_instances.sh


![image](https://github.com/al3v/list-EC2/assets/73062283/f9e51f98-eb49-48f6-902d-c1b195c4ca8b)


![image](https://github.com/al3v/list-EC2/assets/73062283/279eadae-6e93-4337-b2b1-1d3a291e2fa7)

