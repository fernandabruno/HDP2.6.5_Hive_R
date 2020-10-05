#########################
###    Hive + RJDBC   ###
### HDP 2.6.5 Sandbox ###
### September 13,2020 ###
#########################

#loading required libraries
library("DBI")
library("rJava")
library("RJDBC")

options( java.parameters = "-Xmx8g" )

#init of the classpath (tested with HD 2.6.5 Sandbox)
cp = c("/usr/hdp/2.6.5.0-292/hadoop/hadoop-common.jar","/usr/hdp/2.6.5.0-292/hadoop/hadoop-auth.jar", 
       "/usr/hdp/2.6.5.0-292/hive/jdbc/hive-jdbc-1.2.1000.2.6.5.0-292-standalone.jar",
       "/usr/hdp/2.6.5.0-292/hive2/lib/hive-service.jar")
.jinit(classpath=cp)

#Creating JDBC connection
drv <- JDBC("org.apache.hive.jdbc.HiveDriver", "/usr/hdp/2.6.5.0-292/hive/jdbc/hive-jdbc-1.2.1000.2.6.5.0-292-standalone.jar", identifier.quote="`")

#Creating JDBC connection
conn <- dbConnect(drv, "jdbc:hive2://localhost:10000/",user="user",password="password")

#Checking connection
result <- dbGetQuery(conn, "show databases")
result

#Verifying tables available in selected database
tables <- dbGetQuery(conn, "show tables in your_database")
tables
