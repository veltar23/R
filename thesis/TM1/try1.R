rm(list=ls(all.names = TRUE))

#1.library
library(tm)
library(tmcn)
library(Rwordseg)
library(jiebaR)
library(rJava)
library(SnowballC)
library(slam)


#2.get data
m<-"C:/Users/user/Dropbox/R/R/thesis/TM1" #檔案路徑  
mycorpus <- Corpus(DirSource(m),list(language = NA)) #讀取路徑下所有txt

mycorpus <- tm_map(mycorpus, removePunctuation)
mycorpus <- tm_map(mycorpus, stripWhitespace)
mycorpus <- tm_map(mycorpus, removeNumbers)
mycorpus <- tm_map(mycorpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})

#3.斷詞

mycorpus1 <- tm_map(mycorpus, segmentCN, nature = TRUE)
mycorpus2 <- Corpus(VectorSource(mycorpus1))


 c<-data.frame(text = sapply(mycorpus2, as.character), stringsAsFactors = FALSE)
 write.table(c,file="data2")

#4.停止詞
myStopWords <- c(toTrad(stopwordsCN()),"不受")
mycorpus3 <- tm_map(mycorpus2, removeWords, myStopWords)

c<-data.frame(text = sapply(mycorpus3, as.character), stringsAsFactors = FALSE)
write.table(c,file="data2X")
