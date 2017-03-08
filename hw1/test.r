library(plotly)

x <- c(90:104)
random_y <- rawdata[,5]
data <- data.frame(x, random_y)

p <- plot_ly(data, x = ~x, y = ~random_y, 
             type = 'scatter', mode = 'lines')

htmlwidgets::saveWidget(p,"test.html")
