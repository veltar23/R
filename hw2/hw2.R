rm(list=ls(all.names=TRUE))
library(XML)
library(RCurl)
library(httr)
urlPath <- "https://www.ptt.cc/bbs/Bio-Job/index.html"
temp    <- getURL(urlPath, encoding = "big5")
xmldoc  <- htmlParse(temp)
title   <- xpathSApply(xmldoc, "//div[@class=\"title\"]", xmlValue)
title   <- gsub("\n", "", title)
title   <- gsub("\t", "", title)
author  <- xpathSApply(xmldoc, "//div[@class='author']", xmlValue)
path    <- xpathSApply(xmldoc, "//div[@class='title']/a//@href")
date    <- xpathSApply(xmldoc, "//div[@class='date']", xmlValue)
response<- xpathSApply(xmldoc, "//div[@class='nrec']", xmlValue)
emptyId <- which(title =="(本文已被刪除) [brukling]")
#empty <- author=="-"
#author = author[!empty]
author = author[-emptyId]
date = date[-emptyId]
response = response[-emptyId]
title = title[-emptyId]
alldata <- data.frame(title, author, path, date, response)

write.table(alldata,"biojob.csv") #你會在此Script資料夾下得到一個.csv