ls
git remote add origin https://github.com/vs-bhadauriya/Katacode-Scenario
ls
https://github.com/vs-bhadauriya/Katacode-Scenario
git init
git remote add origin https://github.com/vs-bhadauriya/Katacode-Scenario
ls
git remote -v
wget 
https://raw.githubusercontent.com/stefanwalther/katacoda-scenarios/master/hello-world/finish.md
wget https://raw.githubusercontent.com/stefanwalther/katacoda-scenarios/master/hello-world/finish.md
ll
wget https://raw.githubusercontent.com/stefanwalther/katacoda-scenarios/master/hello-world/step1.md
wget https://raw.githubusercontent.com/stefanwalther/katacoda-scenarios/master/hello-world/intro.md
wget https://raw.githubusercontent.com/stefanwalther/katacoda-scenarios/master/hello-world/index.json
ll
cd ..
ls
cd vs.bhadauriya/
ls
mkdir Hello-World
ls
mv in* step1.md finish.md Hello-World/
ls
curl -s https://cli.katacoda.com | sudo sh
exit
ssh-keygen
ll
ls ~/.ssh/
pwd
ll
ls -a
cd .ssh
ll
cat id_rsa.pub 
git --version
git config --global user.name "Vivek"
git config --global user.email "vbhadauriya@sandatasystem.com"
git config --list 
curl -s https://cli.katacoda.com | sudo sh
katacode
katacoda
ls
katacode v Hello-World/
katacoda v Hello-World/
cd Hello-World/
ls
katacoda v 
cd ..
ls
git push -u origin master
git push -u origin
ls
git add .
git push -u origin
git commit -m "Hello World Done.."
git push -u origin
git push -u master
git pull
ls
git push -u origin
git push --help
git push -f origin
ll
mkdir ssark-scenario
mv ssark-scenario/ spark-scenario/
ll
cd spark-scenario/
ifconfig
cd /tmp/
ll
unzip bluedata-catalog-Spark2.1-official.zip 
ll
cd bluedata-catalog-Spark2.1-official
ll
cat spark21_catalog_docker.wb 
bdwb
exit
ls
cd spark-scenario/
ls
cp /tmp/bluedata-catalog-Spark2.1-official .
pwd
cp /tmp/bluedata-catalog-Spark2.1-official /home/vs.bhadauriya/spark-scenario/
ls
cp /tmp/bluedata-catalog-Spark2.1-official.zip /home/vs.bhadauriya/spark-scenario/
ll
exit
ls
cd spark-scenario/
ls
vi init.sh
pwd
vi init.sh 
ll
unzip bluedata-catalog-Spark2.1-official.zip 
ll
cd bluedata-catalog-Spark2.1-official
ll
cd ..
rm -r bluedata-catalog-Spark2.1-official
l
ll
ifconfig
ls
cat init.sh 
ls
vi intro.md
vi step1.md
vi step2.md
ll
unzip bluedata-catalog-Spark2.1-official.zip 
cd bluedata-catalog-Spark2.1-official
ls
ll
ls -r
ls -R
ll
cd ..
ls
s
vi step2.md 
ls
vi step3.md
cat bluedata-catalog-Spark2.1-official/image/centos/Dockerfile 
ping10.2.12.27
ping 10.2.12.27
curl -s https://s3.amazonaws.com/bluedata-catalog/thirdparty/spark/mysql-connector-java-5.1.36.tar.gz
clear
ls
vi step3.md
ls
cat bluedata-catalog-Spark2.1-official/image/centos/Dockerfile 
ls
cp bluedata-catalog-Spark2.1-official/image/centos/Dockerfile .
vi Dockerfile 
ls
cat Dockerfile 
ls
cat step3.md 
vi step3.md 
cat Dockerfile 
vi step3.md 
ls
cat bluedata-catalog-Spark2.1-official/appconfig/startscript 
ls
vi step4.md
ls bluedata-catalog-Spark2.1-official/appconfig/
cd bluedata-catalog-Spark2.1-official/appconfig/
ls
cat [ ! -d '/usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf' ] && mkdir -vp /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf
cp -rvf ${CONFIG_BASE_DIR}/core-site.xml /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/core-site.xml
[ ! -d '/usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/' ] && mkdir -vp /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/
cp -rvf ${CONFIG_BASE_DIR}/zeppelin-site.xml /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-site.xml
[ ! -d '/usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf' ] && mkdir -vp /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf
cp -rvf ${CONFIG_BASE_DIR}/spark-defaults.conf /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-defaults.conf
[ ! -d '/etc/init.d/' ] && mkdir -vp /etc/init.d/
cp -rvf ${CONFIG_BASE_DIR}/spark-master /etc/init.d/spark-master
[ ! -d '/usr/bin' ] && mkdir -vp /usr/bin
cp -rvf ${CONFIG_BASE_DIR}/hadoop /usr/bin/hadoop
[ ! -d '/usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf' ] && mkdir -vp /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf
cp -rvf ${CONFIG_BASE_DIR}/spark-env.sh /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh
[ ! -d '/usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/' ] && mkdir -vp /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/
cp -rvf ${CONFIG_BASE_DIR}/zeppelin-env.sh /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-env.sh
In this step we will append some lines to  existing startscript file.
[ ! -d '/etc/init.d/' ] && mkdir -vp /etc/init.d/
cp -rvf ${CONFIG_BASE_DIR}/spark-slave /etc/init.d/spark-slave
[ ! -d '/etc/init.d/' ] && mkdir -vp /etc/init.d/
cp -rvf ${CONFIG_BASE_DIR}/zeppelin-server /etc/init.d/zeppelin-server
[ ! -d '/usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/' ] && mkdir -vp /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/
cp -rvf ${CONFIG_BASE_DIR}/zeppelin-log4j.properties /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-log4j.properties
REPLACE_PATTERN @@@@SPARK_MASTER@@@@ /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-defaults.conf GET_SERVICE_URL spark_master controller
REPLACE_PATTERN @@@@MASTER_HOST@@@@ /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh GET_FQDN_LIST controller
REPLACE_PATTERN @@@@MEMORY@@@@ /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh echo $(GET_TOTAL_VMEMORY_MB)m
REPLACE_PATTERN @@@@CORES@@@@ /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/spark-env.sh GET_TOTAL_VCORES
REPLACE_PATTERN @@@@SPARK_MASTER@@@@ /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-env.sh GET_SERVICE_URL spark_master controller
REPLACE_PATTERN @@@SPARK_HOME@@@ /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT/conf/zeppelin-env.sh echo /usr/lib/spark/spark-2.1.0-bin-hadoop2.7
REPLACE_PATTERN @@@@ZEPPELIN_HOME@@@@ /etc/init.d/zeppelin-server echo /usr/lib/zeppelin/zeppelin-0.8.0-SNAPSHOT
REPLACE_PATTERN @@@@FQDN@@@@ /etc/init.d/spark-slave GET_NODE_FQDN
REPLACE_PATTERN @@@@FQDN@@@@ /etc/init.d/spark-master GET_FQDN_LIST controller
REPLACE_PATTERN @@@@SPARK_HOME@@@@ /etc/init.d/spark-slave echo /usr/lib/spark/spark-2.1.0-bin-hadoop2.7
REPLACE_PATTERN @@@@SPARK_HOME@@@@ /etc/init.d/spark-master echo /usr/lib/spark/spark-2.1.0-bin-hadoop2.7
REPLACE_PATTERN @@@@AWS_ACCESS_KEY@@@@ /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/core-site.xml TENANT_INFO s3_access_key
REPLACE_PATTERN @@@@AWS_SECRET_KEY@@@@ /usr/lib/spark/spark-2.1.0-bin-hadoop2.7/conf/core-site.xml TENANT_INFO s3_secret_key
REPLACE_PATTERN @@@@SPARK_MASTER@@@@ /etc/init.d/spark-slave GET_SERVICE_URL spark_master controller
chmod 777 ${CONFIG_BASE_DIR}/total_vcores.sh
sh ${CONFIG_BASE_DIR}/total_vcores.sh && (echo ${CONFIG_BASE_DIR}/total_vcores.sh successful || exit 1)
REGISTER_START_SERVICE_SYSV spark_master spark-master
REGISTER_START_SERVICE_SYSV zeppelin-notebook zeppelin-server
REGISTER_START_SERVICE_SYSV spark_worker spark-slave
clear
ls
cat hadoop
ls
l
ll
ls
cd ..

sls

cd ..
ls
vi step4.md 
ls
cat step3.md 
ls
vi step5.md
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/hadoop 
vi step5.md 
cat step3.md 
vi step5.md 
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/spark-env.sh 
vi step5.md 
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/spark-slave 
cat bluedata-catalog-Spark2.1-official/appconfig/spark-master 
cat bluedata-catalog-Spark2.1-official/appconfig/spark-slave 
cat bluedata-catalog-Spark2.1-official/appconfig/spark-master 
cat bluedata-catalog-Spark2.1-official/appconfig/spark-slave 
ls
vi step5.md 
cat step5.md 
vi step5.md 
cat step5.md
clear
cat step5.md 
ls
cat bluedata-catalog-Spark2.1-official/appconfig/spark-server
cat bluedata-catalog-Spark2.1-official/appconfig/spark-master 
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/total_vcores.sh 
cat Dockerfile 
cat bluedata-catalog-Spark2.1-official/appconfig/total_vcores.sh 
cat bluedata-catalog-Spark2.1-official/appconfig/startscript 
cat bluedata-catalog-Spark2.1-official/appconfig/total_vcores.sh 
ls
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/zeppelin-env.sh 
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/zeppelin-server 
ls bluedata-catalog-Spark2.1-official/appconfig/
ls
cat bluedata-catalog-Spark2.1-official/appconfig/core-site.xml 
cat bluedata-catalog-Spark2.1-official/appconfig/spark-defaults.conf 
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/zeppelin-log4j.properties 
ls bluedata-catalog-Spark2.1-official/appconfig/
cat bluedata-catalog-Spark2.1-official/appconfig/zeppelin-site.xml 
sls
ls
vi step5.md 
ls
vi step6.md
ls
cat bluedata-catalog-Spark2.1-official/spark210-centos.json 
vi step6.md 
vi step7.md
cat step7.md 
la
ls
cat bluedata-catalog-Spark2.1-official/spark21_catalog_docker.wb 
ls
ls bluedata-catalog-Spark2.1-official
ls
vi step7.md 
ls
vi /home/vs.bhadauriya/Hello-World/
vi step7.md 
ls
vi step8.md
ls
cp bluedata-catalog-Spark2.1-official/Logo_Spark.png .
ls
vi Logo_Spark.png
vi finish.md
vi index.json
cat in
ls
rm init.sh 
ls
vi index.json 
ls
mkdir /tmp/test
ls
mv bluedata-catalog-Spark2.1-official /tmp/test/
mv bluedata-catalog-Spark2.1-official.zip  /tmp/test/
mv Dockerfile /tmp/test/
ls
cd .
ls
cd ..
ls
git app .
git add .
git commit -m "New Scenario added"
git push ogigin
git push origin
git push origin -f
ls
curl -s https://cli.katacoda.com | sudo sh
ls
katacode --help
katacoda --help
cd spark-scenario/
katacode -v
katacoda -v
katacoda v
katacoda p -help
katacoda push
ls
vi step2.md 
vi step3.md 
katacoda push
ls
git commit -m ""
git commit
cd ..
ls
gir push 
git push -f
git commit
git commit -m "done"
cd spark-scenario/
katacoda push
ls
vi step3.md 
katacode push -f
ls
katacoda push
ls
vi step3.md 
cd ..
ls
git add .
git push -f
git commit -m "done"
cd spark-scenario/
katacoda push
vi step3.md 
cd ..
git add .
git push -f
git add .
git commit -m "done"
cd spark-scenario/
katacoda push
ls
cd ..
cd spark-scenario/
ls
cat step3.md 
cd ..
git add .
git push -f
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
ls
cat step3.md 
mkdir files
vi files/Dockerfile
vi step3.md 
vi step4.md 
ls
zip -r files.zip files
tar cvfz files/ 
tar cvfz files/ files.tar.gz
tar cvfz files.tar.gz files/
ls
mv files/ /home/ -r
mv files /home
mv -r files /home
mv -r files/ /home
ls
cp files/ /tmp
cp -r files/ /tmp
rm files/ -rf
ls
vi index.json 
vi init.sh
cd .
cd ..
git add .
git push origin -f
git commit -m "done"
ls
cd spark-scenario/
katacoda push
ls
vi index.json 
cd ..
ls
git add .
git push origin -f
git commit -m "done"
ls
cd spark-scenario/
katacoda push
ls
vi index.json 
cd ..
git add .
git push origin -f
git commint -m "done"
git commit -m "done"
cd spark-scenario/
katacoda push
ls
vi init.sh 
cat index.json 
vi init.sh 
vi index.json 
vi init.sh 
cd ..
git add .
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
ls
mkdir assets
mv files.tar.gz assets/
cd ..
git add .
git add --all
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
ls
vi index.json 
cd ..
git add .
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
vi index.json 
cd ..
git add .
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
ls
cd assets/
ls
tar xvf files.tar.gz 
ls
rm files.tar.gz 
cp files/Dockerfile  .
ls
rm files/ -rf
ls
cd .
cd ..
ls
vi index.json 
cd ..
git add .
git add -all
git add --all
git push origin -f
git commit -m "done"
cd ..
cd vs.bhadauriya/
ks
ls
cd spark-scenario/
ls
katacoda push
ls
vi index.json 
ls assets/Dockerfile 
cd ..
ls
git add .
git push origin
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
vi init.sh 
ls
vi step3.md 
vi step4.md 
cat step3.md 
vi step3.md 
vi step4.md 
cp /tmp/bluedata-catalog-Spark2.1-official/appconfig/startscript assets/
ls
ls assets/
vi index.json 
ls
cd assets/
ls
pwd
cd /tmp/bluedata-catalog-Spark2.1-official
ls
cd appconfig/
ls
cp hadoop  /home/vs.bhadauriya/spark-scenario/assets
cp spark-env.sh /home/vs.bhadauriya/spark-scenario/assets
cp spark-slave total_vcores.sh zeppelin-env.sh zeppelin-server core-site.xml spark-defaults.conf spark-master zeppelin-log4j.properties zeppelin-site.xml /home/vs.bhadauriya/spark-scenario/assets
cd /home/vs.bhadauriya/spark-scenario/assets
ls
cd ..
ls
vi step5.md 
cat step5.md 
cd /home/
ls
cd vs.bhadauriya/
ls
cd spark-scenario/
l
ls
vi step5.md 
rm step5.md 
vi step5.md
ls
vi index.json 
cat index.json 
ls
vi step6.md 
vi index.json 
ls
cd ..
ls
git add .
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
ls
rm Logo_Spark.png 
ls
cd assets/
git add .
cd ..
ls
cd ..
git add --all
git push origin -f
git commit -m "doone"
ls
cd spark-scenario/
ls
vi init.sh 
vi movefile.sh
vi index.json 
ls
cd ..
ls
cd ..
ls
cd vs.bhadauriya/
ls
git add --all
git push origin -f
git commint -m "done"
git commit -m "done"
cd spark-scenario/
ls
katacoda push
ls
cat index.json 
git add index.json 
cd ..
ls
git add --all
git add --help
git add --all
git add -u --all
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
ls
vi step7.md 
ls
cat step5.md 
sed -i 's/##/#/g' step5.md
cat step5.md 
cd ..
ls
git add --all
git push origin -f
git commit -m "done"
cd spark-scenario/
s
ls
rm movefile.sh 
vi step3.md 
cd ..
ls
git add --all
git push origin -f
git commint -m "done"
git commit -m "done"
cd spark-scenario/
katacoda push
ls
vi step3.md 
vi step5.md 
vi step6.md 
vi step4.md 
cd ..
ls
git add --alll
git add --all -f
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
cd ..
ls
git 
git add -h
git add --refresh
git add --all --refresh
git add --all
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
katacoda push -y
katacoda push --help
katacoda push -h
katacoda push 
ls
cat /tmp/bluedata-catalog-Spark2.1-official/*.wb
ls
vi step7.md 
vi assets/Dockerfile 
cd ..
git add --refresh
git add --all --refresh
git add --all
git push origin -u -f
git push origin -f
git commit -m done""
git commit -m "done"
git push origin -f
vi step7
cd spark-scenario/
vi step7.md 
vi step5.md 
cd ..
git add -u
git add --all
git push master -f
git push origin -f
git commit -m "done"
cd spark-scenario/
katacoda push
cd ..
katacoda push
cat spark-scenario/step5.md 
cd ..
cd vs.bhadauriya/
git add --all
git push origin -f
git commit -m 'done'
cd spark-scenario/
katacoda push
cat assets/Dockerfile 
vi intro.md 
pwd
cd spark-scenario/
ls assets/
ls
cd ap
cd assets/
ls
cp /tmp/bluedata-catalog-Spark2.1-official/*.json
cp /tmp/bluedata-catalog-Spark2.1-official/*.json .
cp /tmp/bluedata-catalog-Spark2.1-official/*.png .
ls
cd ..
cat /tmp/bluedata-catalog-Spark2.1-official/*.wb
ls
rm spark-scenario/ -rf
ls
git pull
ls
ls
ls /tmp/
cd /home/
ls
cp Scenario/ /home/vs.bhadauriya/ -r
ls
cd /home/vs.bhadauriya/
ls
cd Scenario/
ls
vi init.sh 
cd ..
ls
git add --all
git push origin -f
git commit -m "done"
cd Scenario/
katacoda push
ls
cat init.sh 
cd ..
ls
git add --refresh
git add -all --refresh
git add --all --refresh
git push origin -f
git commit -m "done."
cd Scenario/
katacoda push
cat /tmp/bluedata-catalog-Spark2.1-official/*.wb
ls
cd ..
ls
cd /tmp/
ls
yum install rar
exit
