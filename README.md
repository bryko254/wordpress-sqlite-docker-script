# WordPress + SQLite (Docker Setup)

This project provides a simple script to spin up a WordPress container powered by **SQLite** instead of MySQL.  
It uses Docker and the official WordPress image, with the [SQLite Database Integration plugin](https://wordpress.org/plugins/sqlite-database-integration/).

## Requirements
- Linux or macOS (tested on Ubuntu)
- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- `unzip` and `curl` installed on the host system

## Usage
```bash
# Clone the repository
git clone https://github.com/bryko254/wordpress-sqlite-docker-script.git
cd wordpress-sqlite-docker-script

# Make the script executable
chmod +x setup-wp-sqlite.sh

# Run the setup script (requires sudo for Docker)
sudo ./setup-wp-sqlite.sh
