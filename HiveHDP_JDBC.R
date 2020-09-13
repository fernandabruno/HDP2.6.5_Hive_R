#########################
###    Hive + RJDBC   ###
### HDP 2.6.5 Sandbox ###
### September 13,2020 ###
#########################

#Loading required libraries
library("DBI")
library("rJava")
library("RJDBC")

#init of the classpath (tested with HD 2.6.5 Sandbox)
cp = c("/usr/hdp/2.6.5.0-292/hadoop/hadoop-common.jar", "/usr/hdp/2.6.5.0-292/hive2/jdbc/hive-jdbc-2.1.0.2.6.5.0-292-standalone.jar")
.jinit(classpath=cp)

#Creating JDBC connection
drv <- JDBC("org.apache.hive.jdbc.HiveDriver", "/usr/hdp/2.6.5.0-292/hive2/jdbc/hive-jdbc-2.1.0.2.6.5.0-292-standalone.jar", identifier.quote="`")

#Creating JDBC connection
conn <- dbConnect(drv, "jdbc:hive2://localhost:10000/", "user", "password")

#Checking connection
result <- dbGetQuery(conn, "show databases")
result

#Verifying tables available in selected database
tables <- dbGetQuery(conn, "show tables in database")
tables
