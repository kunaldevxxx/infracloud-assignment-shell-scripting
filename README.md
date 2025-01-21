# infracloud-assignment-shell-scripting/README.md

# Infracloud Shell Scripting Assignments

This project contains a collection of shell scripting assignments organized into three categories: Basics, Intermediate, and Advanced. Each category includes scripts that perform specific tasks, along with test scripts to ensure functionality.

## Project Structure

```
infracloud-assignment-shell-scripting
├── Advanced
│   ├── Permission_Network_Checker.sh
│   ├── Server_Health_Checker.sh
│   └── tests
│       └── test_advanced.sh
├── Basics
│   ├── count_file_and_dir.sh
│   ├── duplicate_line_remover.sh
│   ├── file_permission.sh
│   ├── file_size_checker.sh
│   ├── string_search.sh
│   └── tests
│       └── test_basics.sh
├── Intermediate
│   ├── Disk_Space_Monitor.sh
│   ├── File_Ownership_Debugger.sh
│   ├── Text_Report_Generator.sh
│   ├── disk_space_monitor.log
│   └── tests
│       └── test_intermediate.sh
├── one.log
├── two.log
├── three.log
├── four.log
├── input.txt
├── output.txt
├── sample_log.txt
├── error_summary.txt
├── Permission_Checker.sh
└── README.md
```

## Assignment Descriptions

### Advanced
- **Permission_Network_Checker.sh**: Checks if a specified network port is in use and can terminate the process using that port.
- **Server_Health_Checker.sh**: Monitors CPU and memory usage, and checks the status of specified services.

### Basics
- **count_file_and_dir.sh**: Counts the number of files and subdirectories in a specified directory.
- **duplicate_line_remover.sh**: Removes duplicate lines from a specified file.
- **file_permission.sh**: Checks and displays the permissions of a specified file.
- **file_size_checker.sh**: Checks the size of a specified file against a user-defined threshold.
- **string_search.sh**: Searches for a specified string in all .log files within a directory.

### Intermediate
- **Disk_Space_Monitor.sh**: Monitors disk usage and logs warnings if usage exceeds 80%.
- **File_Ownership_Debugger.sh**: Identifies files in a specified directory that are not owned by a specific user.
- **Text_Report_Generator.sh**: Parses a log file to extract and count error messages.

## Testing

Each category includes a corresponding test script located in the `tests` subdirectory. These scripts are designed to validate the functionality of the respective scripts in that category.

## Usage

To run any of the scripts, navigate to the appropriate directory and execute the script using the bash command. Ensure that you have the necessary permissions to execute the scripts.

## License

This project is open-source and available for anyone to use and modify.