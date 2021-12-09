library(stringr)
library(stringr)
library(lubridate)
library(dplyr)


## String Operations


#Lakers dataset in lubraidate package

data <- lakers
View(data)
summary(lakers)
dim(data)
colSums(is.na(lakers))

#tolower and toupper

data$player <- toupper(data$player)
data$player <- tolower(data$player)


#strsplit

strsplit("my name is Dave"," ")
strsplit("hello"," ")


l <- data$player != ""

data <- data[l,]
View(data)

fun1 <- function(x){
  strsplit(x," ")[[1]][1]
}


fun2 <- function(x){
  strsplit(x," ")[[1]][2]
}

data <- mutate(data,fname = lapply(player, fun1))
data <- mutate(data,lname = lapply(player, fun2))



# sub and gsub


sub("aryan","aman","aryan is a good guy")
sub("dave","aman","dave is a good guy but he is not very strong.dave is also very intelligent")

gsub("dave","aman","dave is a good guy but he is not very strong.dave is also very intelligent")


# nchar

nchar("dave")
nchar("dave hello")

# substr
substr("dave is very proffesional and loves to work hard",5,20)


# paste
s <- c("hello","my","name","is","dave")
print(s)
paste("hello","my","name","is","dave")


#str_trim
str_trim("        hello    everyone        ")


#grep and grepl
grep("hello","hello my name is aryan")
grepl("hello",c("hello","my name is aryan"))
l <- grepl("^[a|d]",data$fname)
data <- data[l,]
View(data)


##############Date Manupulation

s <- date()
print(s)


#Sys.date()

s <- Sys.Date()
class(s)

year(s)
date(s)

#format
format(s,"%A-%b-%Y")


#as.Date()
x <- as.Date("2021-08-31","%Y-%m-%d")
year(x)
x -(x-1)


#################Practice question



#first
data <- lakers
View(data)
data = lakers[lakers$etype=="rebound",]
data <- mutate(data,w = wday(ymd(date),label = T))
data <- group_by(data,w)
summarise(data,c = length(opponent))


## second
data <- lakers[lakers$etype=="rebound",]
data <- group_by(data,player)
data <- summarise(data,n=length(opponent))
arrange(data,desc(n))


## third
data <- lakers
View(data)
data <- data[data$etype=="foul",]
fun1 <- function(x){
  return(as.numeric(str_sub(x,1,4)))
}

x <- mutate(data,year=fun1(date))
table(x$year)


# fourth
data <- lakers
l <- grepl("[^200812]",data$date)
data <- data[l,]
z <- data$etype=="free throw"
sum(z)


# fifth

data <- lakers[lakers$etype=="turnover",]
data <- group_by(data,player)
data <- summarise(data,x = length(opponent))
arrange(data,desc(x))















