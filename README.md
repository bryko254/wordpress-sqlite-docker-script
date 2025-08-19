# WordPress + SQLite (Docker Setup)

This project provides a simple script to spin up a WordPress container powered by **SQLite** instead of MySQL.  
It uses Docker and the official WordPress image, with the [SQLite Database Integration plugin](https://wordpress.org/plugins/sqlite-database-integration/).

---

## Requirements
- Linux or macOS (tested on Ubuntu)
- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- `unzip` and `curl` installed on the host system

---

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/bryko254/wordpress-sqlite-docker-script.git
   cd wordpress-sqlite-docker-script
Make the script executable:

bash
Copy
Edit
chmod +x setup-wp-sqlite.sh
Run the setup script as root (sudo is required for Docker permissions):

bash
Copy
Edit
sudo ./setup-wp-sqlite.sh
Once setup is complete, open WordPress in your browser:

arduino
Copy
Edit
http://localhost:8080
What the script does
Creates a wordpress_sqlite project directory.

Writes a minimal docker-compose.yml.

Starts the WordPress container.

Waits until WordPress core files are initialized.

Downloads and installs the SQLite Database Integration plugin.

Activates SQLite by copying db.php.

Prints the URL where your WordPress site is available.

Project Structure
pgsql
Copy
Edit
wordpress_sqlite/
├── docker-compose.yml
└── wordpress/
    ├── wp-admin/
    ├── wp-content/
    │   └── plugins/sqlite-database-integration/
    └── wp-includes/
Notes
WordPress will store its database in a file named wordpress.db inside the container.

If you restart the container, your content will persist in the wordpress/ folder.

Logs can be viewed with:

bash
Copy
Edit
docker logs -f wp-sqlite
To stop and remove the container:

bash
Copy
Edit
sudo docker compose -f wordpress_sqlite/docker-compose.yml down
