# MYSQL 
![1_TTM5AleQfFJ-mItttJROdg](https://user-images.githubusercontent.com/125953981/234188905-c0588905-75ad-49ab-bf0d-3c48f629d5de.jpg)

The mysqldump command is a tool used to backup and restore MySQL databases. It is a command-line utility that comes with the MySQL database software.

``` mysql -h hostname -u username -p ```

### Some common options used with the mysqldump command are:
```-u : username to connect to the MySQL server
-p : password for the user
-h : hostname or IP address of the MySQL server
--databases : specifies the databases to be dumped
--tables : specifies the tables to be dumped
--verbose : provides detailed information during the backup process
--compress : compresses the backup file
--add-drop-table : adds DROP TABLE statement before each CREATE TABLE statement
```
The basic syntax of the mysqldump command is:

```mysqldump -u myusername -p mypassword mydatabase > backup.sql```

This will create a backup file called backup.sql that contains the entire mydatabase database.

## mysqldump --compress

The --compress option is used with the mysqldump command to compress the output of the dump using gzip. This can help to reduce the size of the output file, which can be especially useful when backing up large databases.
To use the --compress option, simply add it to the mysqldump command followed by the name of the database you want to dump and the file name to save the output to. Here's an example:

``` mysqldump --compress -u username -p password database_name > backup_file.sql.gz ```

In this example, 
--compress is used to compress the output of the dump,
-u username is used to specify the MySQL username to use for the connection, 
-p password is used to prompt for the MySQL password, 
database_name is the name of the database you want to dump, and backup_file.sql.gz is the file name to save the compressed output to.
When the mysqldump command is run with the
--compress option, the output file will be compressed using gzip, resulting in a smaller file size. To restore the backup, you can use the gunzip command to decompress the file and then use the mysql command to import the data back into the MySQL database.

Here's an example of how to create a backup of a MySQL database using the mysqldump command and store it in a separate backup file:

``` mysqldump -u username -p password database_name > backup_file.sql ```

In this example, replace username and password with the MySQL username and password that you will use to connect to the MySQL server.
Replace database_name with the name of the database that you want to back up. backup_file.sql is the name of the backup file that will be created.

### Simple script that creates a Auto Cron job backup of a MySQL database every day at midnight:
```
#!/bin/bash

# Set variables
USER=username
PASSWORD=password
DATABASE=database_name
BACKUP_DIR=/path/to/backup/directory

# Create backup file name with timestamp
BACKUP_FILE=$BACKUP_DIR/$DATABASE-$(date +%Y-%m-%d-%H%M%S).sql

# Create backup using mysqldump
mysqldump -u $USER -p$PASSWORD $DATABASE > $BACKUP_FILE

# Print status message
echo "Backup completed: $BACKUP_FILE"
```
