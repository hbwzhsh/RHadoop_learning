Sys.setenv(HADOOP_CMD="/usr/local/hadoop/bin/hadoop")
#locate streaming | grep jar | more #find the jar file 
Sys.setenv(HADOOP_STREAMING="/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar")
library(rhdfs)
hdfs.init()
library(rmr2)



hdfs.put('/home/hduser/bible.txt', '/user/hduser/input/bible_data.txt')


map <- function(k,lines) {
  words.list <- strsplit(lines, '\\s')
  words <- unlist(words.list)
  return( keyval(words, 1) ) 
} 

reduce <- function(word, counts) { 
  keyval(word, sum(counts)) 
} 

hdfs.root <- 'input' 
hdfs.data <- file.path(hdfs.root,'bible_data.txt') 
hdfs.out <- file.path(hdfs.root, 'out6') 
wordcount <- function (input, output=NULL) { 
  mapreduce(input=input, output=output, input.format="text", map=map, reduce=reduce) 
} 
out <- wordcount(hdfs.data, hdfs.out)

system.file(package="functional")
.libPaths()
# solution the errors of pipemapred..http://blog.fens.me/rhadoop-rmr2-pipemapred/

results <- from.dfs(out) 
results$key[order(results$val, decreasing = TRUE)][1:10]

