### Install RHDFS
#$ wget https://github.com/RevolutionAnalytics/rhdfs/blob/master/build/rhdfs_1.0.8.tar.gz?raw=true
#$ mv rhdfs_1.0.8.tar.gz?raw=true rhdfs_1.0.8.tar.gz
#$ sudo HADOOP_CMD=/usr/bin/hadoop R CMD INSTALL rhdfs_1.0.8.tar.gz

### Rhadoop Setup
#$ echo $JAVA_HOME
#$ sudo JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera R CMD javareconf

### Setup hdfs
Sys.setenv(HADOOP_CMD="/usr/local/hadoop/bin/hadoop")
#locate streaming | grep jar | more #find the jar file 
Sys.setenv(HADOOP_STREAMING="/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar")
library(rhdfs)
hdfs.init()

### Install RMR2
install.packages(c("codetools", "Rcpp", "RJSONIO", "bitops", "digest"))
install.packages(c("functional", "stringr", "plyr", "reshape2", "rJava", "caTools"))

install.packages("/home/hduser/rmr2_3.1.2.tar.gz", repos=NULL, type="source")






install.packages(c("rJava", "Rcpp", "RJSONIO", "bitops", "digest", "functional", "stringr", "plyr", "reshape2", "dplyr", "R.methodsS3", "caTools", "Hmisc"))
install.packages("data.table")