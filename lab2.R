library(dplyr)


################ reading and writing data

data <- data.frame(name = c("aryan","riya","dave","max","kevin") ,
                   age = c(21,21,22,56,45),
                   gender = c("M","F","M","M","M"),
                   isMarried = c(FALSE,FALSE,FALSE,TRUE,TRUE))

write.csv(data,"lab2.csv",row.names = F)

data <- read.csv("lab2.csv",header = T)










#################  subsetting and sorting

data <- mtcars

View(data)








# Subsetting data


data <- mtcars[1:10,c("mpg","cyl")]
View(data)

 
print(mean(mtcars$mpg))
data <- mtcars[mtcars$mpg > mean(mtcars$mpg),]
View(data)








# Sorting Data

data <- mtcars[order(-mtcars$hp),]
data <- mtcars[order(mtcars$mpg),]

# Summary 

summary(mtcars$mpg)
summary(mtcars$gear)

x <- as.character(mtcars$mpg)
summary(x)

y <- x=="21"
summary(c(y))


# Qauntile

quantile(mtcars$hp , 0.35)
table(mtcars$hp)



# Checking for missing values

sum(is.na(mtcars))
colSums(is.na(mtcars))
rowSums(is.na(mtcars))





## select 

colnames(mtcars)
select(mtcars,c(1,3,5))
select(mtcars,-c(7,9))


## filter
filter(mtcars,hp>100)
filter(mtcars,mpg<15)

## arrange
arrange(mtcars,mpg)
arrange(mtcars,desc(mpg))

## rename
rename(mtcars,a=mpg,y=disp)


## mutate
mutate(mtcars, new_column = mpg*100)
mutate(mtcars, new_column = mpg*cyl/disp)


## group_by summarise
data <- mtcars
x <- group_by(mtcars,gear)
summarize(x,y = mean(cyl),z = mean(disp))



## merge 

data1 <-  mtcars[1:10,]
data2 <-  mtcars[20:30,]

#inner join
data3 <- merge(data1,data2,by.x = "gear",by.y = "gear")
print(data3)
View(data3)
#outer join
data3 <- merge(data1,data2,by.x = "gear",by.y = "gear",all = T)
print(data3)

#left join
data3 <- merge(data1,data2,by.x = "gear",by.y = "gear",all.x = T)
print(data3)

#right join
data3 <- merge(data1,data2,by.x = "gear",by.y = "gear",all = T)
print(data3)








# questions

# first

nrow(mtcars)
ncol(mtcars)
dim(mtcars)


data <- mtcars[seq(1,32,2),seq(2,11,2)]
colSums(data)


# Second

data <- filter(mtcars,gear == 4)
data <- arrange(data,desc(mpg))
data[1:3,]





# Third

data <- group_by(mtcars,gear)
data <- summarise(data,mn = mean(mpg),mx = max(hp),md = median(wt))











# fourth

data <- group_by(mtcars,gear)
data <- summarise(data,quart = quantile(disp,0.3))
print(data)









# fifth

data <- mtcars[c(1:10,23:32) , ]
dim(data)
data <- arrange(data,desc(hp))
data <- data[1:16,]
data <- group_by(data,gear)
data <- summarise(data,mn = mean(disp),mdn=median(disp))
data <- mutate(data,new_column = mn+mdn)








## sixth
set.seed(0)
data1 <- data.frame(id = 1:100 , age = as.integer(rnorm(100,30,10)) , sex = sample(c("Male","Female"),100,replace = T))
data2 <- data.frame(id = 1:100 , marks1 = as.integer(rnorm(100,40,10)) , marks2 = as.integer(rnorm(100,50,30)))

View(data1)
View(data2)



data2 <- mutate(data2,total_marks = marks1+marks2)
View(data2)

data3 <- merge(data1,data2,by.x="id",by.y = "id")
View(data3)

data3 <- arrange(data3,desc(total_marks))

data3[1:10,]


data4 <- group_by(data3,sex)
data4 <- summarise(data4,mn1 = mean(total_marks),md1 = median(total_marks),mn2 = mean(age),md2 = median(age))

data4













