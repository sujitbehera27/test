library("rredis")
library("rjson")# To parse JSON strings
library("RJSONIO")# To parse JSON strings

run <- function(zipcodes)
{
 
 print(length(zipcodes))
# file_list <- list.files("/home/sujit/ZZZZZZIPCODE/LBA-FINAL/DC_WIFI/lib/geojson/")
 #print(file_list)
 exists<-unlist(lapply(zipcodes, function(x) file.exists(paste("/home/sujit/ZZZZZZIPCODE/LBA-FINAL/DC_WIFI/lib/geojson/",x,'.json',sep=''))))
   json_data <- unlist(lapply(zipcodes[which(exists)], function(x) {
   json_data<-toJSON(paste(readLines(paste("/home/sujit/ZZZZZZIPCODE/LBA-FINAL/DC_WIFI/lib/geojson/",x,'.json',sep=''))))
   print(x)
   print(json_data)
 }
 ))
 #for (j in (1:(length(zipcodes)-1)))
# {
 #  zip <- zipcodes[j]
  # print(zip)
  # json_data<-toJSON(paste(readLines(paste("/home/sujit/ZZZZZZIPCODE/LBA-FINAL/DC_WIFI/lib/geojson/",zip,'.json',sep=''))))
  #print(json_data)
 #}

}
run(list('07095','08821','07082','07084','31405','31323'))