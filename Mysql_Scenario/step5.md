Creating some more app config files required for MySql. We already have refernce files, we can just copy to appropriate folder.

## Task 1:
Copying the appjob file.<br>
`cp ~/test/appjob  ~/Mysql/appconfig`{{execute}}
<br><br>
To view thw content of appjob file, please execute the below command.<br>
`cat  ~/Mysql/appconfig/appjob`{{execute}}

## Task 2:
Copying systemd.service file.<br>
`cp ~/test/systemd.service ~/Mysql/appconfig`{{execute}}
<br><br>
To view the content of systemd.service file, please execute the below command.<br>
`cat ~/Mysql/appconfig/systemd.service`{{execute}}

## Task 3:
Copying configure_java8.sh file which is used for configuring java.<br>
`cp ~/test/configure_java8.sh ~/Mysql/image/centos`{{execute}}
<br><br>
To view the content of configure_java8 file.<br>Please execute the below command.<br>
`cat ~/Mysql/image/centos/configure_java8.sh`{{execute}}

## Task 4:
Copying the logo file.<br>
`cp ~/test/Logo_mysql.png ~/Mysql`{{execute}}
