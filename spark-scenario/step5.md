Creating some more files require for Spark.

Task 1:

Creating simple hadoop utiity script.

`tee ~/Spark/appconfig/hadoop <<'EOF' >/dev/null
#!/bin/bash
# Copyright (c) 2015 BlueData Software, Inc.
#
# Simple hadoop fs utility script
if [ "$1" != "fs" ]; then
echo "Only hadoop fs commands supported"
exit 1
fi
shift
HADOOP_JAR="/usr/lib/spark/spark-2.1.0-bin-hadoop2.7/jars/*"
java -cp ${HADOOP_JAR}:/opt/bluedata/bluedata-dtap.jar:/opt/bluedata/aws-java-sdk-1.7.4.jar:/opt/bluedata/hadoop-aws-2.7.1.jar:/usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf -Djava.net.preferIPv4Stack=true org.apache.hadoop.fs.FsShell $@
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/hadoop`{{execute}}


Task 2:

Creating Spark env file.

`tee ~/Spark/appconfig/spark-env.sh <<'EOF' >/dev/null
#!/usr/bin/env bash
SPARK_MASTER_HOST=@@@@MASTER_HOST@@@@
SPARK_WORKER_CORES=@@@@CORES@@@@
SPARK_WORKER_MEMORY=@@@@MEMORY@@@@
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/spark-env.sh`{{execute}}

Task 3:

Creating spark-slave file which is used for bringing up and down the spark slave service.

`tee ~/Spark/appconfig/spark-slave <<'EOF' >/dev/null
#!/bin/bash
#
# spark_master      Bring up/down the Spark Master service.
#
# chkconfig: 35 11 89
# description:

. /etc/init.d/functions

export TERM='xterm-256color'
export JAVA_HOME=/usr/lib/jvm/java-openjdk
export PATH=$JAVA_HOME/bin:/root/bin:$PATH

rc=0
SPARK_HOME=@@@@SPARK_HOME@@@@
SPARK_SBIN=${SPARK_HOME}/sbin
SPARK_SLAVE_START=${SPARK_SBIN}/start-slave.sh
SPARK_SLAVE_STOP=${SPARK_SBIN}/stop-slave.sh

start() {
    action $"Starting Spark Slave: " $SPARK_SLAVE_START @@@@SPARK_MASTER@@@@
    rc=$?
}

stop() {
    action $"Stopping Spark Master: " ${SPARK_SLAVE_STOP}
    rc=$?
}

get_status() {
    echo | nc @@@@FQDN@@@@ 8081 2>&1 >/dev/null
    rc=$?

    if [[ $rc -eq 0 ]]; then
        echo "Spark Slave is running."
    else
        echo "Spark Slave is NOT running."
    fi
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        get_status
        ;;
    restart|reload)
        $0 stop
        $0 start
        rc=$?
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|reload)"
        exit 1
esac

exit $rc
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/spark-slave`{{execute}}


Task 4:

Creating spark-master file which is used for bringing up and down the spark master service.

`tee ~/Spark/appconfig/spark-master <<'EOF' >/dev/null
#!/bin/bash
#
# spark_master      Bring up/down the Spark Master service.
#
# chkconfig: 35 11 89
# description:

. /etc/init.d/functions

export TERM='xterm-256color'
export JAVA_HOME=/usr/lib/jvm/java-openjdk
export PATH=$JAVA_HOME/bin:/root/bin:$PATH

rc=0
SPARK_HOME=@@@@SPARK_HOME@@@@
SPARK_SBIN=${SPARK_HOME}/sbin
SPARK_MASTER_START=${SPARK_SBIN}/start-master.sh
SPARK_MASTER_STOP=${SPARK_SBIN}/stop-master.sh

start() {
    action $"Starting Spark Master: " ${SPARK_MASTER_START}
    rc=$?
}

stop() {
    action $"Stopping Spark Master: " ${SPARK_MASTER_STOP}
    rc=$?
}

get_status() {
    echo | nc  @@@@FQDN@@@@ 7077 2>&1 >/dev/null
    rc=$?

    if [[ $rc -eq 0 ]]; then
        echo "Spark Master is running."
    else
        echo "Spark Master is NOT running."
    fi
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        get_status
        ;;
    restart|reload)
        $0 stop
        $0 start
        rc=$?
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|reload)"
        exit 1
esac

exit $rc
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/spark-server`{{execute}}


Task 5:

Creating total_vcores.sh script.

`tee ~/Spark/appconfig/total_vcores.sh <<'EOF' >/dev/null
SELF=$(readlink -nf $0)
BASE_DIR=$(dirname ${SELF})

source ${BASE_DIR}/logging.sh || exit 1
source ${BASE_DIR}/utils.sh || exit 1

PRIMARY_NODEGROUP=1
DISTRO=$(invoke_bdvcli --get node.distro_id)
Roles=($(invoke_bdvcli --get distros.${DISTRO}.${PRIMARY_NODEGROUP}.roles))
Role=$(echo $Roles | tr "," "\n")
TotalCores=0
for r in $Role
do
  RoleFqdn=($(invoke_bdvcli --get distros.${DISTRO}.${PRIMARY_NODEGROUP}.roles.${r}.fqdns | tr ',' '\n'))
  Cores=$(invoke_bdvcli --get distros.${DISTRO}.1.roles.${r}.flavor.cores)
  RoleCount=${#RoleFqdn[@]}
  T=$(echo "$(($Cores * $RoleCount))")
  TotalCores=$(echo "$(($TotalCores + ($Cores * $RoleCount)))")
done
echo $TotalCores

ZEPP_CORES=`expr $TotalCores / 3`
PATTERN=@@@@ZEPPELIN_CORES@@@@
DESTFILE=/usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-env.sh
sed -i "s!${PATTERN}!${ZEPP_CORES}!g" ${DESTFILE}
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/total_vcores.sh`{{execute}}

Task 6:

Creating zeppelin-env.sh script.
`tee ~/Spark/appconfig/zeppelin-env.sh <<'EOF' >/dev/null
#!/bin/bash
export ZEPPELIN_JAVA_OPTS="-Dspark.cores.max=@@@@ZEPPELIN_CORES@@@@"
export ADD_JARS="/opt/bluedata/bluedata-dtap.jar"
export MASTER="@@@@SPARK_MASTER@@@@"
export SPARK_HOME=@@@SPARK_HOME@@@
export SPARK_SUBMIT_OPTIONS="--jars /opt/bluedata/bluedata-dtap.jar,/opt/bluedata/aws-java-sdk-1.7.4.jar,/opt/bluedata/hadoop-aws-2.7.1.jar"
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/zeppelin-env.sh`{{execute}}


Task 7:

Creating zeppelin-server file which is used for bringing up and down the spark master service.
`tee ~/Spark/appconfig/zeppelin-server <<'EOF' >/dev/null
#!/bin/bash
#
# Zeppelin server: Bring up/down the Zeppelin service.
#
# chkconfig: 35 11 89
# description:

. /etc/init.d/functions

export TERM='xterm-256color'
export ZEPPELIN_HOME=@@@@ZEPPELIN_HOME@@@@
export PATH=$JAVA_HOME/bin:$PATH

rc=0
ZEPPELIN_DAEMON=${ZEPPELIN_HOME}/bin/zeppelin-daemon.sh

start() {
    action $"Starting Zeppelin server: " ${ZEPPELIN_DAEMON} start
    rc=$?
}

stop() {
    action $"Stopping Zeppelin server: " ${ZEPPELIN_DAEMON} stop
    rc=$?
}

get_status() {
    action $"Status of Zeppelin server: " ${ZEPPELIN_DAEMON} status
    rc=$?
    if [[ $rc -eq 0 ]]; then
        echo "Zeppelin server is running."
    else
        echo "Zeppline server is NOT running."
    fi
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        get_status
        ;;
    restart|reload)
        $0 stop
        $0 start
        rc=$?
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|reload)"
        exit 1
esac

exit $rc
EOF`{{execute}}

Changing file to executable.
`chmod +x ~/Spark/appconfig/zeppelin-server.sh`{{execute}}

Task 8:

Creating core-site.xml file.

`tee ~/Spark/appconfig/core-site.xml <<'EOF' >/dev/null
<configuration>
<property>
  <name>fs.dtap.impl</name>
  <value>com.bluedata.hadoop.bdfs.Bdfs</value>
  <description>The FileSystem for BlueData dtap: URIs.</description>
</property>
<property>
  <name>fs.s3a.access.key</name>
  <value>@@@@AWS_ACCESS_KEY@@@@</value>
  </property>
<property>
  <name>fs.s3a.secret.key</name>
  <value>@@@@AWS_SECRET_KEY@@@@</value>
</property>
<property>
  <name>fs.s3a.impl</name>
  <value>org.apache.hadoop.fs.s3a.S3AFileSystem</value>
 </property>
</configuration>
EOF`{{execute}}

Task 9:

Creating spark-defaults.conf file.

`tee ~/Spark/appconfig/spark-defaults.conf <<'EOF' >/dev/null
spark.master=@@@@SPARK_MASTER@@@@
spark.jars=/opt/bluedata/bluedata-dtap.jar
spark.executor.extraClassPath=/opt/bluedata/bluedata-dtap.jar:/opt/bluedata/aws-java-sdk-1.7.4.jar:/opt/bluedata/hadoop-aws-2.7.1.jar
spark.driver.extraClassPath=/opt/bluedata/bluedata-dtap.jar:/opt/bluedata/aws-java-sdk-1.7.4.jar:/opt/bluedata/hadoop-aws-2.7.1.jar
spark.sql.warehouse.dir=file:///usr/lib/spark/spark/spark-2.1.0-bin-hadoop2.7/warehouse
EOF`{{execute}}

Task 10:

Creating zeppelin-log4j.properties file.

`tee ~/Spark/appconfig/zeppelin-log4j.properties <<'EOF' >/dev/null
log4j.rootLogger = INFO,stdout,stderr,dailyfile
log4j.appender.stdout = org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target = System.out
log4j.appender.stdout.layout = org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%5p [%d] ({%t} %F[%M]:%L) - %m%n

log4j.appender.stderr = org.apache.log4j.ConsoleAppender
log4j.appender.stderr.Threshold = WARN
log4j.appender.stderr.Target = System.err
log4j.appender.stderr.layout = org.apache.log4j.PatternLayout
log4j.appender.stderr.layout.ConversionPattern=%5p [%d] ({%t} %F[%M]:%L) - %m%n

log4j.appender.dailyfile.DatePattern=.yyyy-MM-dd
log4j.appender.dailyfile = org.apache.log4j.RollingFileAppender
log4j.appender.dailyfile.File =@@@@ZEPPELIN_HOME@@@@/zep.log
log4j.appender.dailyfile.layout = org.apache.log4j.PatternLayout
log4j.appender.dailyfile.layout.ConversionPattern=%5p [%d] ({%t} %F[%M]:%L) - %m%n
EOF`{{execute}}


Task 11:

Creating zeppelin-site.xml file.

`tee ~/Spark/appconfig/zeppelin-site.xml <<'EOF' >/dev/null
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->

<configuration>

<property>
  <name>zeppelin.server.addr</name>
  <value>0.0.0.0</value>
  <description>Server address</description>
</property>

<property>
  <name>zeppelin.server.port</name>
  <value>8055</value>
  <description>Server port. port+1 is used for web socket.</description>
</property>

<property>
  <name>zeppelin.websocket.addr</name>
  <value>0.0.0.0</value>
  <description>Testing websocket address</description>
</property>

<property>
  <name>zeppelin.anonymous.allowed</name>
  <value>true</value>
  <description>Anonymous user allowed by default</description>
</property>

<!-- If the port value is negative, then it'll default to the server
     port + 1.
  -->
<property>
  <name>zeppelin.websocket.port</name>
  <value>-1</value>
  <description>Testing websocket port</description>
</property>

<property>
  <name>zeppelin.notebook.dir</name>
  <value>notebook</value>
  <description>path or URI for notebook persist</description>
</property>

<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.VFSNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>

<property>
  <name>zeppelin.interpreter.dir</name>
  <value>interpreter</value>
  <description>Interpreter implementation base directory</description>
</property>

<property>
  <name>zeppelin.interpreters</name>
  <value>org.apache.zeppelin.spark.SparkInterpreter,org.apache.zeppelin.spark.PySparkInterpreter,org.apache.zeppelin.spark.SparkSqlInterpreter,org.apache.zeppelin.spark.DepInterpreter,org.apache.zeppelin.markdown.Markdown,org.apache.zeppelin.angular.AngularInterpreter,org.apache.zeppelin.shell.ShellInterpreter,org.apache.zeppelin.hive.HiveInterpreter,org.apache.zeppelin.tajo.TajoInterpreter,org.apache.zeppelin.flink.FlinkInterpreter,org.apache.zeppelin.ignite.IgniteInterpreter,org.apache.zeppelin.ignite.IgniteSqlInterpreter</value>
  <description>Comma separated interpreter configurations. First interpreter become a default</description>
</property>

<property>
  <name>zeppelin.interpreter.connect.timeout</name>
  <value>30000</value>
  <description>Interpreter process connect timeout in msec.</description>
</property>


<property>
  <name>zeppelin.ssl</name>
  <value>false</value>
  <description>Should SSL be used by the servers?</description>
</property>

<property>
  <name>zeppelin.ssl.client.auth</name>
  <value>false</value>
  <description>Should client authentication be used for SSL connections?</description>
</property>

<property>
  <name>zeppelin.ssl.keystore.path</name>
  <value>keystore</value>
  <description>Path to keystore relative to Zeppelin configuration directory</description>
</property>

<property>
  <name>zeppelin.ssl.keystore.type</name>
  <value>JKS</value>
  <description>The format of the given keystore (e.g. JKS or PKCS12)</description>
</property>

<property>
  <name>zeppelin.ssl.keystore.password</name>
  <value>change me</value>
  <description>Keystore password. Can be obfuscated by the Jetty Password tool</description>
</property>

<!--
<property>
  <name>zeppelin.ssl.key.manager.password</name>
  <value>change me</value>
  <description>Key Manager password. Defaults to keystore password. Can be obfuscated.</description>
</property>
-->

<property>
  <name>zeppelin.ssl.truststore.path</name>
  <value>truststore</value>
  <description>Path to truststore relative to Zeppelin configuration directory. Defaults to the keystore path</description>
</property>

<property>
  <name>zeppelin.ssl.truststore.type</name>
  <value>JKS</value>
  <description>The format of the given truststore (e.g. JKS or PKCS12). Defaults to the same type as the keystore type</description>
</property>

<!--
<property>
  <name>zeppelin.ssl.truststore.password</name>
  <value>change me</value>
  <description>Truststore password. Can be obfuscated by the Jetty Password tool. Defaults to the keystore password</description>
</property>
-->

</configuration>
EOF`{{execute}}

