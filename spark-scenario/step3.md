In this step we are creating a Dockerfile for centos.
For this first we need to create a folder inside image folder name as centos.

`mkdir ~/Spark/image/centos`{{execute}}

Now We are going to create Dockerfile inside the centos folder.

`tee ~/Spark/image/centos/Dockerfile <<'EOF' >/dev/null
#Spark-2.1 docker image for CentOS 7.x


FROM bluedata/centos7:3.1
# Install EPEL repo
#RUN yum install -y http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y http://download.fedoraproject.org//pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y expect mysql-server mysql-connector-java \
                   php-5.3.3 php-xml php-pear php-gd R R-devel libcurl-devel openssl-devel
RUN yum install -y numpy scipy pandas

RUN R -e "install.packages('devtools', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('knitr', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('ggplot2', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('devtools','mplot', 'googleVis'), repos = 'http://cran.us.r-project.org'); require(devtools); install_github('ramnathv/rCharts')"

## Download and extract spark
RUN mkdir /usr/lib/spark; https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz | tar xz -C /usr/lib/spark/

## Download and extract mysql connector
RUN mkdir -p /opt/bluedata; curl -s https://s3.amazonaws.com/bluedata-catalog/thirdparty/spark/mysql-connector-java-5.1.36.tar.gz | tar xz -C /opt/bluedata/; mv /opt/bluedata/mysql-connector-java-5.1.36/*.jar /opt/bluedata/mysql-connector.jar; rm -rf /opt/bluedata/mysql-connector-java-5.1.36

## Download thirdparty aws jars
RUN wget -q http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar -P /opt/bluedata/
RUN wget -q http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.1/hadoop-aws-2.7.jar -P /opt/bluedata/

## Install zeppelin
RUN mkdir /usr/lib/zeppelin; curl -s https://github.com/SarunasG/zeppelin-oidc/releases/download/v1.0.2/zeppelin-0.8.0-SNAPSHOT.tar.gz | tar xz -C /usr/lib/zeppelin

## Install sparklingwater
RUN wget -q  http://h2o-release.s3.amazonaws.com/sparkling-water/rel-2.0/0/sparkling-water-2.0.0.zip -P /usr/lib/sparklingwater/;unzip -q /usr/lib/sparklingwater/sparkling-water-2.0.0.zip -d /usr/lib/sparklingwater/; rm -rf /usr/lib/sparklingwater/*.zip

## Create spark-event dir and give permissions
RUN mkdir /tmp/spark-events
RUN chmod -R 777 /tmp/spark-events/

## Give logs and conf permissions
RUN mkdir -p /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/logs
RUN touch /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/logs/Bluedata-spark-logs
RUN chmod -R 1777 /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/logs/

# make spark bin dir accessible to all
RUN echo "export PATH=$PATH:/usr/lib/spark/spark-2.1.0-bin-hadoop2.7/bin/" > /etc/profile.d/updatePath.sh
EOF`{{execute}}


Check the content of Dockerfile.
`cat ~/Spark/image/centos/Dokcerfile`{{execute}}

