In this step we will creating the bin using App Workbench by executing commands.

## Task 1:
Go inside the Spark folder.
<br>`cd ~/Spark`{{execute}}

## Task 2:
Go the Bluedata Workbench.
<br>`bdwb`{{execute}}

## Task 3:
Setting the organization name.
<br>`builder organization --name BlueData`{{execute}}

## Task 4:
Adding a new Catalog Entry.

<br>`catalog new --distroid spark210-centos7 --name "Spark 2.1.0 Hadoop 2.7 Centos 7" --desc "Apache Spark is general purpose  open source in memory computational engine developed by the Apache Software Foundation written in Scala." --categories Spark --version 1.0`{{execute}}

## Task 5:
Define all node roles for the virtual cluster.<br>
<br>`role add controller 1`{{execute}}
<br>`role add worker 0+`{{execute}}


## Task 6:
Define all services that are available in the virtual cluster.

<br>`service add --srvcid spark --name "Spark master" --scheme "http" --port 8080   --path "/" --display`{{execute}}
<br><br>`service add --srvcid spark_master --name "Spark master" --scheme "spark"  --port 7077 --export_as "spark"`{{execute}}
<br><br>`service add --srvcid spark_worker --name "Spark worker" --scheme "http"  --port 8081 --path "/" --display`{{execute}}
<br><br>`service add --srvcid mysql --name "Mysql server" --port 3306`{{execute}}
<br><br>`service add --srvcid zeppelin-notebook --name "Zeppelin server" --scheme "http" --port 8055 --path "/" --display`{{execute}}

## Task 7:
Define run time placement of the services.
<br>`clusterconfig new --configid default`{{execute}}
<br><br>`clusterconfig assign --configid default --role controller --srvcids spark spark_master spark_worker zeppelin-notebook mysql`{{execute}}
<br><br>`clusterconfig assign --configid default --role worker --srvcids spark_worker`{{execute}}


## Task 8:
Appconfiguration autogenenration.

`appconfig autogen --new --configapi 4`{{execute}}
<br><br>`appconfig autogen --pkgfile spark-defaults.conf spark-env.sh  --destdir /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf`{{execute}}
<br><br>`appconfig autogen --pkgfile core-site.xml --dest /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/core-site.xml`{{execute}}
<br><br>`appconfig autogen --pkgfile hadoop --dest /usr/bin/hadoop`{{execute}}
<br><br>`appconfig autogen --pkgfile spark-master spark-slave zeppelin-server --destdir /etc/init.d/`{{execute}}
<br><br>`appconfig autogen --pkgfile zeppelin-env.sh zeppelin-site.xml zeppelin-log4j.properties --destdir /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/`{{execute}}

## Task 9:
Replacing Pattern from Some files.

`appconfig autogen --replace /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-defaults.conf --pattern @@@@SPARK_MASTER@@@@ --macro GET_SERVICE_URL spark_master controller`{{execute}}
<br><br>`appconfig autogen --replace /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh  --pattern @@@@MASTER_HOST@@@@ --macro GET_FQDN_LIST controller`{{execute}}
<br><br>`appconfig autogen --replace /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh  --pattern @@@@MEMORY@@@@ --macro echo "$(GET_TOTAL_VMEMORY_MB)m"`{{execute}}
<br><br>`appconfig autogen --replace /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh  --pattern @@@@CORES@@@@ --macro GET_TOTAL_VCORES`{{execute}}
<br><br>`appconfig autogen --execute total_vcores.sh`{{execute}}
<br><br>`appconfig autogen --replace /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-env.sh  --pattern @@@@SPARK_MASTER@@@@ --macro GET_SERVICE_URL spark_master controller`{{execute}}<br><br>
`appconfig autogen --replace /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-env.sh --pattern @@@SPARK_HOME@@@ --macro echo /usr/lib/spark/spark-2.1.0-bin-hadoop2.7`{{execute}}<br><br>
`appconfig autogen --replace /etc/init.d/zeppelin-server --pattern @@@@ZEPPELIN_HOME@@@@  --macro "echo /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT"`{{execute}}<br><br>
`appconfig autogen --replace /etc/init.d/spark-slave --pattern @@@@FQDN@@@@ --macro GET_NODE_FQDN`{{execute}}
`appconfig autogen --replace /etc/init.d/spark-master --pattern @@@@FQDN@@@@  --macro GET_FQDN_LIST controller`{{execute}}<br><br>
`appconfig autogen --replace /etc/init.d/spark-slave --pattern @@@@SPARK_HOME@@@@   --macro "echo /usr/lib/spark/spark-2.1.0-bin-hadoop2.7"`{{execute}}<br><br>
`appconfig autogen --replace /etc/init.d/spark-master --pattern @@@@SPARK_HOME@@@@   --macro "echo /usr/lib/spark/spark-2.1.0-bin-hadoop2.7"`{{execute}}<br><br>
`appconfig autogen --replace /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/core-site.xml --pattern @@@@AWS_ACCESS_KEY@@@@ --macro TENANT_INFO s3_access_key`{{execute}}<br><br>
`appconfig autogen --replace /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/core-site.xml --pattern @@@@AWS_SECRET_KEY@@@@ --macro TENANT_INFO s3_secret_key`{{execute}}<br><br>
`appconfig autogen --replace /etc/init.d/spark-slave --pattern @@@@SPARK_MASTER@@@@  --macro GET_SERVICE_URL spark_master controller`{{execute}}


## Task 10:
Now we are defining teh order of services in the order in which they are brought up.
The services defined here are only registered and started if the specific node is expected to run the service.

`appconfig autogen --srvcid spark_master --sysv spark-master`{{execute}}
<br><br>`appconfig autogen --srvcid spark_worker --sysv spark-slave`{{execute}}
<br><br>`appconfig autogen --srvcid mysql --sysv mysqld`{{execute}}
<br><br>`appconfig autogen --srvcid zeppelin-notebook --sysv zeppelin-server`{{execute}}
<br><br>`appconfig autogen --generate`{{execute}}
<br><br>`appconfig package`{{execute}}


## Task 11:
Setting the logo for bin.
<br>`logo file --filepath Logo_Spark.png`{{execute}}

## Task 12:
Catalog the package for Centos

`image build --basedir image/centos --imgversion 1.0 --os centos7`{{execute}}
<br><br>`catalog save --filepath staging/spark210-centos.json --force`{{execute}}
<br><br>`sources package`{{execute}}
<br><br>`catalog package --os=centos`{{execute}}
