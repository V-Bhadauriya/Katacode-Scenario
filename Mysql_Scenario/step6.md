In this step we will creating the bin using App Workbench by executing commands.

## Task 1:
Go inside the Spark folder.
<br>`cd ~/Mysql`{{execute}}

## Task 2:
Go the Bluedata Workbench.
<br>`bdwb`{{execute}}

## Task 3:
Setting the organization name.
<br>`builder organization --name BlueData`{{execute}}

## Task 4:
Adding a new Catalog Entry.

<br>`catalog new --distroid mysql --name "MySQL" --desc "Open-source RDBMS" --categories databases --catalogapi 4 --version 1.0`{{execute}}

## Task 5:
Define all node roles for the virtual cluster.<br>
<br>`role add controller 1`{{execute}}


## Task 6:
Define all services that are available in the virtual cluster.
<br>`service add --srvcid mysql --name "Mysql server" --port 3306 --sysctl mysqld --onroles controller`{{execute}}

## Task 7:
Appconfiguration autogenenration.

`appconfig autogen --new --configapi 7`{{execute}}
<br><br>`appconfig autogen --generate`{{execute}}
<br><br>`appconfig package`{{execute}}

## Task 8:
Setting the logo for bin.
<br>`logo file --filepath Logo_mysql.png`{{execute}}

## Task 9:
Catalog the package for Centos

`image build --basedir image/centos --image-repotag bluedata/mysql-centos7:1.0`{{execute}}
<br><br>`image package --image-repotag bluedata/mysql-centos7:1.0 --os centos7 --roles controller`{{execute}}
<br><br>`catalog save --filepath staging/mysql-centos7.json --force`{{execute}}
<br><br>`sources package`{{execute}}
<br><br>`catalog package`{{execute}}
