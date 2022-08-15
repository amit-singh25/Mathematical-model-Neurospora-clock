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
ggplot(dat, aes(x=value, color=variable, fill=variable)) +
geom_histogram(alpha=0.5, binwidth = 0.1) +
#geom_density(alpha=.2)+
     #scale_fill_viridis(discrete=TRUE) +
    #scale_color_viridis(discrete=TRUE) +
    #geom_histogram(alpha=0.2, binwidth = 0.1) +
  theme_ipsum() +
  theme(
  legend.position="none",
  panel.spacing = unit(0.1, "lines"),
  strip.text.x = element_text(size = 8)
  )+
   xlab("") +
   ylab("Slected parameter set") +
  facet_wrap(~variable)


