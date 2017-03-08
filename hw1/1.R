rm(list = ls(all = TRUE))
library(png)
library(animation)

rawdata = read.csv("1.csv",header = TRUE)

saveGIF(
for(yid in c(1:length(rawdata[,1])))
{
barplot(as.matrix(rawdata[yid,c(-1)]),
        main = paste0(rawdata[yid,1],"醫事人員數目"),
        ylim = c(0, max(rawdata[,-1])))
}, movie.name = "1.gif",
   interval = 0.3,
   ani.width = 1500,
   ani.height = 600
)