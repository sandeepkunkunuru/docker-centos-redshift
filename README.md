# docker-centos-redshift

Docker container that contains 
* UnixODBC
* Redshift ODBC
* Some scripts to test 

### Steps
* Replace placeholders in odbc.ini, test.sh and Makefile (optional, needed only if you intend to use container registry)

### References
* https://github.com/simpleltc/docker-centos-mssql
* http://docs.aws.amazon.com/redshift/latest/mgmt/install-odbc-driver-linux.html
* http://docs.aws.amazon.com/redshift/latest/mgmt/odbc-driver-configure-linux-mac.html
* https://communities.sas.com/t5/SAS-Communities-Library/Successfully-configuring-an-ODBC-driver-to-access-Redshift-from/ta-p/223987
* http://www.unixodbc.org/doc/UserManual/
* https://github.com/awslabs/ecs-refarch-cloudformation/blob/master/services/website-service/src/Makefile
