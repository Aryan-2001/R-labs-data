## loading libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(stringi)
library(stringr)
library(plotly)



## mpg data
data <- mpg


## ggplot


# scatter plot 2 arguments
ggplot(aes(cty,hwy),data=data) + geom_point()
ggplot(aes(cty,hwy),data=data) + geom_point(color="Blue")
ggplot(aes(cty,hwy),data=data) + geom_point(aes(color = year))


# histogram one argument
ggplot(aes(cyl),data = data) + geom_histogram()
ggplot(aes(cyl),data = data) + geom_histogram(color="Red")
ggplot(aes(cyl),data = data) + geom_histogram(bins = 2)
ggplot(aes(cyl),data = data) + geom_histogram(breaks = c(4,4.5,5.5,6.5))
g <- ggplot(aes(cty,hwy),data=data) + geom_point(aes(alpha=year)) 

ggplotly(g)

ggtitle()
xlab()
ylab()
xlim()
ylim()


# line graph
data$year <- as.factor(data$year)
ggplot(aes(cty,hwy),data=data) + geom_line(aes(group=cyl,color=cyl))
ggplot(aes(cty,hwy),data=data) + geom_line(aes(group=cyl,color=cyl),data=data)
ggplot(aes(cty,hwy),data=data) + geom_line(aes(linetype=year),data=data)


#mixing graphs
ggplot(aes(cty,hwy),data=data) + geom_point(aes(color=cyl))+geom_line(aes(col=cyl))


#smoothing
ggplot(aes(cty,hwy),data=data) + geom_smooth() + geom_point()
ggplot(aes(cty,hwy),data=data) + geom_smooth(aes(linetype=year,fill=year)) + geom_point()


# facets
ggplot(aes(cty,hwy),data=data) + geom_point(aes(color = cyl),data = data)
ggplot(aes(cty,hwy),data=data) + facet_grid(.~cyl) +  geom_point(aes(color = cyl),data = data) + geom_smooth()
ggplot(aes(cty,hwy),data=data) + facet_grid(year~cyl) +  geom_point(aes(color = cyl),data = data) + geom_smooth()
ggplot(aes(cty,hwy),data=data) + facet_grid(cyl~.) +  geom_point(aes(color = cyl),data = data) + geom_smooth()


# some extra plotting
geom_bar()
geom_freqpoly()
geom_hline()
geom_vline()
geom_curve()




#################### Practice Questions



## Create a boxplot for the attribute cty with whiskers at 1.25IQR
g <- ggplot(aes(cty),data=data) + geom_boxplot()


## create a plot faceted with year and cyl with each plot a scatter plot cty and hwy
g <- ggplot(aes(cty,hwy),data=data) + facet_wrap(year~cyl) + geom_point() 

ggplotly(g+geom_line())
