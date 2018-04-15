##套件
library(quanteda)
library(dplyr)

##文本
data<-read.csv("bda2018.csv",stringsAsFactors = F)
colnames(data)
data1<-data$內容

##前處理
data2<-gsub("（","",data1)
data2<-gsub("）","",data2)
data2<-gsub("[0-9a-zA-Z]+?","",data2)###去除阿拉伯數字和英文
data2<-gsub("[０-９]+?","",data2)
##分組
#data2<-data.frame(data2)
#a1<-data2[grep("銀行",data2$data2),]

a2<-as.character(data2)

##切詞
b0<-corpus(a2)
ndoc(b0)

b1<-tokens(b0 ,what="character",remove_numbers = T, remove_punct = T,
           remove_symbols = T, remove_separators = TRUE)

################################################
##文本分組
b11=b1[1:5000]
b12=b1[5001:10000]
b13=b1[10001:15000]
b14=b1[15001:20000]
b15=b1[20001:25000]
b16=b1[25001:30000]
b17=b1[30001:35000]
b18=b1[35001:40000]
b19=b1[40001:45000]
b110=b1[45001:50000]
b111=b1[50001:55000]
b112=b1[55001:60000]
b113=b1[60001:65000]
b114=b1[65001:70000]
b115=b1[70001:75000]
b116=b1[75001:80000]
b117=b1[80001:85000]
b118=b1[85001:90507]

#KK<-c(b11,b12,b13,b14,b15,b16,b17,b18,b19,b110,b111,b112,b113,b114,b115,b116)
##切n-gram, 建立tdm, 排序, 取前五萬個詞

j=0

ff<-function(x){
  j <-tokens_ngrams(x,n=2:6,concatenator = "")
  k <-dfm(j)
  l <-dfm_sort(k)
  m <-l[,1:20000]
  
  return(m)
}


##return(paste)
##全部丟進去
d1<-ff(b11)
d2<-ff(b12)
d3<-ff(b13)
d4<-ff(b14)
d5<-ff(b15)
d6<-ff(b16)
d7<-ff(b17)
d8<-ff(b18)
d9<-ff(b19)
d10<-ff(b110)
d11<-ff(b111)
d12<-ff(b112)
d13<-ff(b113)
d14<-ff(b114)
d15<-ff(b115)
d16<-ff(b116)
d17<-ff(b117)
d18<-ff(b118)

##############################################
ee <- rbind(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,
            d11,d12,d13,d14,d15,d16,d17,d18) ##合併n-gram斷詞結果
ee1<-dfm_compress(ee, margin = "features")  ##按照feature合併

nfeat(ee1)
ee1[1:5,1:10]



e2<-dfm_sort(ee1) ##排序
e2[1:5,1:10]
nfeat(e2)

##########################

##計算相似度
ans1<-textstat_simil(e2, c("text3555","text9943","text25423","text39132","text7914","text66900"),margin = "documents")
write.csv(ans1,file = "a1.csv")
ans11<-as.list(ans1)
ans111<-sort(ans11$text3555,decreasing = T)
ans111[1:3]

##
dic<-read.csv("dict.csv")
length(dic$term)

##篩選245
f1<-dfm_select(e2,dic$term)
f1[1:5,1:10]
nfeat(f1)
ndoc(f1)

ans1<-textstat_simil(f1, c("text3555","text9943","text25423","text39132","text7914","text66900"),margin = "documents")
write.csv(ans1,file = "a2.csv")
ans11<-as.list(ans1)
ans111<-sort(ans11$text3555,decreasing = T)
ans111[1:3]

