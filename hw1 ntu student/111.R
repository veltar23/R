rm(list = ls(all = TRUE))
library(png)
library(animation)

rawData = read.csv('1.CSV', header = TRUE)

for(yid in c(1:length(rawData[,1])))
{
  barplot(as.matrix(rawData[yid,c(-1,-2)]),
          main = paste0("國立台灣大學",rawData[yid,1],"年總計",rawData[yid,2],"人")
  )
}


