# MariaDB installation

In this course, we use MariaDB as our Database Management System (DBMS). These instructions guide you to install MariaDB on a Windows computer.

# Installing MariaDB on Windows

Follow these steps to install MariaDB on your Windows computer:

1. **Download the Installer:**
   - Visit the [MariaDB Downloads page](https://mariadb.org/download/).
   - Select the appropriate version for Windows and download the installer.

2. **Run the Installer:**
   - Locate the downloaded installer file and double-click it to run the installation wizard.

3. **Follow the Installation Wizard:**
   - Follow the prompts in the installation wizard. You can choose the default options for most settings.
   - Note down the root password you set during the installation process.

4. **Complete the Installation:**
   - Once the installation is complete, start the MariaDB service and use the MariaDB client to connect to the database.

5. **Verify the Installation:**
   - Open a command prompt and type `mysql -u root -p` to log in to the MariaDB server using the root account.

# Installing MariaDB on macOS

Follow these steps to install MariaDB on your macOS computer:

1. **Install Homebrew (if not already installed):**
   - Open the Terminal application.
   - Install Homebrew by running the following command:
     ```sh
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```

2. **Install MariaDB using Homebrew:**
   - Once Homebrew is installed, you can install MariaDB by running:
     ```sh
     brew install mariadb
     ```

3. **Start the MariaDB Service:**
   - After the installation is complete, start the MariaDB service with:
     ```sh
     brew services start mariadb
     ```

4. **Secure the Installation:**
   - Run the secure installation script to set the root password and secure the installation:
     ```sh
     mysql_secure_installation
     ```

5. **Verify the Installation:**
   - Open a Terminal and type `mysql -u root -p` to log in to the MariaDB server using the root account.
