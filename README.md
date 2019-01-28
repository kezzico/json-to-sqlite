json-to-sqlite
=====================

Json-to-sqlite is a tool that can take any number of json files and create a sqlite database. Json-to-sqlite is most useful as part of a build where a pre-shipped sqlite database is needed by your app bundle.

Limitations:
Relationships between tables is currently not supported. 

Usage:

Database builder takes three inputs:
* a directory
  This is used for configuration. The directory should contain:
    dbconfig.plist. Each entry in the plist should be the name of a table in your schema. (see ./Sample for details on the file structure)
    A file.json matching each entry made in your dbconfig.plist. Each json file contains all the rows you want to put in the table.
* a schema file (momd)
  Can be found in your build output.
* an output file.
  The output will be a sqlite file. Where you want to store it is set here.


Sample xcode setup:

![ScreenShot](https://raw.github.com/loofy2/SqliteDatabaseBuilder/master/setup.png)
