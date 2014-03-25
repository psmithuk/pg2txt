# pg2txt

*Work in progress*

Create text files from PostgreSQL queries in your shell. Works with Amazon Redshift and PostgresSQL. Slightly more flexible than using `psql`. A sister application to github.com/psmithuk/pg2xlsx


## Usage

The command line options roughly mirror the `psql` application. If your user has access rights to a default database on local host you shouldn't need to set anything other than an query and output file. For example:

		pg2txt -c="SELECT COUNT(*) FROM TABLE;"

You can specify host connection details on the command line, or standard `psql` environment variables will be used:

		pg2txt -h myhostname -p 5432 -d mydbname -c="SELECT 1;" -o="output.txt"

When you specify `-u` for a username in the connection the default behaviour is to check the local `.pgpass` file for a corresponding entry. If no matching password for the connection exists in the file then you will be prompted for one. If the connection will be trusted you can override this behaviour with the `-w` option.

In addition to reading queries from the `-c` option you can read large queries from files using the `-f` option.

		pg2txt -f="input.sql" -o="output.txt"

The default behaviour is not to include a row with the column titles, these can be enabled with the `-titles` option.

```bash
usage: pg2txt [flags]
  -c="": run a single command (ignores other input)
  -d="": database name to connect to
  -f="": execute command from file (defaults to stdin)
  -h="": database server host
  -o="": output file
  -p="": database server port
  -t=false: test database connection and exit
  -titles=false: add row for column titles
  -u="": username
  -version=false: print version string
  -w=false: never prompt for password
```
