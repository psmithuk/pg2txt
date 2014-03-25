# pg2xlsx

Create XLSX spreadsheet files for Microsoft Excel from PostgreSQL queries. Works with Amazon Redshift and PostgresSQL.

## Motivation

* Because no matter what you think, all the funky analysis work you ever do will probably need to be distributed to the rest of your business as Excel files

* The MacOS version of Excel doesn't properly import UTF-8 text and you work for a global business.

* You want to automate this in your scheduled reports without installing lots of scripting dependancies or huge BI applications.

* Against your better judgement you regularly distribute large datasets in Excel format


## Limitations


* The sheets are constructed using templates in the library [github.com/psmithuk/xlsx](https://github.com/psmithuk/xlsx). The default formats are pretty simple

* Only queries with a single result set are currently supported

* Spreadsheets are generated in memory before being written to disk. This should however require less RAM than opening the sheet in Excel itself

* SSL connections to Postgres are planned but not currently supported


## Usage

The command line options roughly mirror the `psql` application. If your user has access rights to a default database on local host you shouldn't need to set anything other than an query and output file. For example:

		pg2xlsx -c="SELECT COUNT(*) FROM TABLE;" -o="output.xlsx"

You can specify host connection details on the command line, or standard `psql` environment variables will be used:

		pg2xlsx -h myhostname -p 5432 -d mydbname -c="SELECT 1;" -o="output.xlsx"

When you specify `-u` for a username in the connection the default behaviour is to check the local `.pgpass` file for a corresponding entry. If no matching password for the connection exists in the file then you will be prompted for one. If the connection will be trusted you can override this behaviour with the `-w` option.

In addition to reading queries from the `-c` option you can read large queries from files using the `-f` option.

		pg2xlsx -f="input.sql" -o="output.xlsx"

The default behaviour is not to include a row with the column titles, these can be enabled with the `-titles` option.

```bash
usage: pg2xlsx [flags]
  -c="": run a single command (ignores other input)
  -d="": database name to connect to
  -f="": execute command from file (defaults to stdin)
  -h="": database server host
  -o="": output file
  -p="": database server port
  -propuser="": the username in the xlsx document properties (defaults to current login)
  -t=false: test database connection and exit
  -titles=false: add row for column titles
  -u="": username
  -version=false: print version string
  -w=false: never prompt for password
```

