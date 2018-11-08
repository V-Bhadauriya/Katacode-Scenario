In this step we will refer to the startscript file we created back in step 2.
We have already have a configured startscript file. We wil copy it to the appropriate folder using the below commands.

Removing the existing startscrit from folder ~/Spark/appconfig
`rm -rf ~/Spark/appconfig/startscript`{{execute}}

Copying the new startscript.
`cp ~/test/startscript ~/Spark/appconfig`{{execute}}

If you want to see the startscript. Please execute the below command.
`cat ~/Spark/appconfig/startscript`{{execute}}

