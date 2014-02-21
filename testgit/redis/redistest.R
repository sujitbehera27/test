library("rredis")
library("rjson")# To parse JSON strings
library("RJSONIO")# To parse JSON strings
library("RCurl")  # To send GET requests, among many other things
#library("jsonlite")

redisConnect(host="127.0.0.1",port=6379, password=NULL, returnRef= FALSE, nodelay=FALSE, timeout=2678399L)


file <- '/home/sujit/node_modules/redis/examples/test.json'
#document <- fromJSON(file=file, method='C')
#print(readLines(conn, -1L))
document <- fromJSON(paste(readLines(file), collapse=""))
#conn <- file(file, "r")

#document1 <- readLines(conn, -1L)

#----------------------------------------------
#y<-document$type[[1]]$FeatureCollection[[0]]$features[[2]]
#y<-document$feature# get all the list
#print(y)
#myjson <- toJSON(y, pretty=FALSE)
#print(myjson)
#--------------------------------------------
file_list <- list.files("/home/sujit/ZZZZZZIPCODE/LBA-FINAL/DC_WIFI/lib/geojson/")

for (j in (1:(length(file_list)-1))){
  filename <- file_list[j]
  #print(filename)
  json_data<-toJSON(paste(readLines(paste("/home/sujit/ZZZZZZIPCODE/LBA-FINAL/DC_WIFI/lib/geojson/",filename,sep=''))))
  # nme<-substr(filename, start=1, stop=length(filename)-5)
  nme<-sub(".json","",filename)
  print(nme)
  print(json_data)
  redisSet(nme,json_data)
}
#--------------------------------------------
#redisSet("geojson",myjson)
#print(document)
#id<-redisGet("geojson")
#print(id)
#close(con)
redisClose()