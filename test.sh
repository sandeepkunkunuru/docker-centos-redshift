#!/bin/bash

echo "select * from SVV_TABLE_INFO" | isql -v "Amazon Redshift (x64)" <<user name>> <<password>> > tables.html

