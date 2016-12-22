FROM centos

RUN yum update -y
RUN yum install -y gcc make tar wget

ADD setup_redshift.sh /tmp/setup_redshift.sh
ADD env.sh /tmp/env.sh
ADD test.sh /tmp/test.sh

RUN /tmp/setup_redshift.sh

ADD odbc.ini /etc/odbc.ini
ADD odbcinst.ini /etc/odbcinst.ini
ADD amazon.redshiftodbc.ini /opt/amazon/redshiftodbc/lib/64/amazon.redshiftodbc.ini

RUN /tmp/env.sh

RUN /tmp/test.sh
