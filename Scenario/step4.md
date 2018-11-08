In this step we will refer to the startscript file we created back in step 2.<br>
We have already have a configured startscript file. We will copy it to the appropriate folder using the below commands.
<br><br>Removing the existing startscrit from folder ~/Spark/appconfig.<br>
`rm -rf ~/Spark/appconfig/startscript`{{execute}}

Copying the new startscript.<br>`cp ~/test/startscript ~/Spark/appconfig`{{execute}}

If you want to see the startscript. Please execute the below command.<br>
`cat ~/Spark/appconfig/startscript`{{execute}}
