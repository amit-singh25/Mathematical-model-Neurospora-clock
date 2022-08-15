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
p<-ggplot(dat, aes(x=value, color=variable, fill=variable)) +
geom_histogram(alpha=0.5, binwidth = 0.1) +
theme_ipsum() +
theme(legend.position="none",panel.spacing = unit(0.1, "lines"),strip.text.x = element_text(size = 8))+
xlab("") +
ylab("Slected parameter set") +
facet_wrap(~variable)
p+ geom_density(aes(x = value)) + facet_wrap(~variable,scales = "free")
#p+geom_density(col = "#1b98e0", size = 1)

