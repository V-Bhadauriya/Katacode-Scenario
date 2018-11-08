In this step we will refer to the startscript file created back in step 2 using the app workbench init command.<br>
For reference, there's already a docker file.<br>We can copy it to the appconfig folder using the following commands.
<br><br>Removing the existing startscrit from folder ~/Mysql/appconfig<br>
`rm -rf ~/Mysql/appconfig/startscript`{{execute}}

Copying the new startscript.<br>`cp ~/test/startscript ~/Mysql/appconfig`{{execute}}

If you want to see the startscript. Please execute the below command.<br>
`cat ~/Mysql/appconfig/startscript`{{execute}}
