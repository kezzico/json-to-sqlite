SqliteDatabaseBuilder
=====================

Database Builder is a tool used to take any number of json files and create a sqlite database. It is most useful as part of a build process where you have data you need rolled into a sqlite file as part of your build process.

Limitations:
Relationships between tables is currently not supported. 

Usage:

Database builder takes three inputs:
* a directory
  This is used for configuration. The directory should contain:
    dbconfig.plist. Each entry in the plist should be the name of a table in your schema. (see ./Sample for details on the file structure)
    A file.json matching each entry made in your dbconfig.plist. Each json file contains all the rows you want to put in the table.
* a schema file (momd)
  The schema file can be found in your build output. See the screenshot below if you are not sure where this file exists.
* an output file.
  The output will be a sqlite file. Where you want to store it is set here.
