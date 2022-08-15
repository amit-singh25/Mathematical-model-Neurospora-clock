rm(list=ls())
library(dplyr)
library(ggstatsplot)
library(hrbrthemes)
library(reshape)
set.seed(1234)
df<-read.xlsx("Top10_parameter_set.xlsx")
del<-c("kd1","kd2","kd6","kd7","kd8","kd9","kdL","kd10","kd13")
df = df[,!(names(df) %in% del)]
dat<-melt(df)
################################################
ggp3 <- ggplot(dat, aes(x = value)) +   
   geom_histogram(aes(y = ..density..)) +
geom_density(col = "#1b98e0", size = 0.3) +
theme_ipsum() +
theme(
legend.position="none",
panel.spacing = unit(0.1, "lines"),
strip.text.x = element_text(size = 8)
)+
xlab("") +
ylab("Slected parameter set") +
facet_wrap(~variable, scales = "free")
ggp3
