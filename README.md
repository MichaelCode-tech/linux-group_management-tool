# Group Management Tool
A comprehensive command-line utility for managing system groups on Linux/Unix systems. This tool provides an intuitive menu-driven interface for creating, modifying, and managing user groups efficiently.

## Project Screenshots

### Feature 1
<img width="800" alt="image" src="https://github.com/user-attachments/assets/c68473dd-e8e7-4340-8834-84f6a8bbf30c" />



### Feature 2
<img width="800" alt="image" src="https://github.com/user-attachments/assets/6f5fb4b7-95a5-4306-92b9-6a9d0f496e02" />

## Features

- **Create Groups**: Add new user groups to your system
- **Delete Groups**: Remove existing groups safely
- **View Groups**: Display all available normal groups on the system
- **Modify Groups**: Rename groups, set passwords, and change Group IDs (GID)
- **User Management**: View all users within a specific group
- **Intuitive Menu**: Easy-to-navigate terminal interface

## Installation

Make the script executable by running:

```bash
git clone https://github.com/MichaelCode-tech/linux-group_management-tool/tree/main
cd "linux-group_management-tool"
chmod +x group_management.sh
```

## Usage

Run the tool with:

```bash
./group_management.sh
```

## Menu Overview

### Main Menu
![Group Management Menu](./images/group_management_menu.png)

The main menu provides quick access to all group management functions:
1. **Create group** - Add a new group to your system
2. **Delete group** - Remove an existing group
3. **Show all normal groups** - View all standard groups
4. **Modify Group** - Edit group properties
5. **List users in a group** - View group membership
6. **Return to Main Menu** - Navigate back

### Modify Groups Menu
![Modify Groups Menu](./images/modify_groups_menu.png)

The modify menu allows you to perform advanced group operations:
1. **Rename group** - Change the group name
2. **Set group password** - Secure your group with a password
3. **Change Group ID (GID)** - Modify the unique group identifier
4. **Back to Group Menu** - Return to the main menu

## Requirements

- Linux/Unix operating system
- Root or sudo privileges for group management operations
- Bash shell

## License

This project is open source and available for community use.
