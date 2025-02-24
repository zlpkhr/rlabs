data("iris")
summary(iris)

png("2.2_pairs.png", width=1920, height=1080)
pairs(iris[-5], bg=iris$Species, pch=21)
dev.off()

cor(iris[-5])

install.packages("PerformanceAnalytics", repos="http://cran.us.r-project.org")
library(PerformanceAnalytics)

png("2.2_chart_correlation.png", width=1920, height=1080)
chart.Correlation(iris[-5], bg=iris$Species, pch=21)
dev.off() 