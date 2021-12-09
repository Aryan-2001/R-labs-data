## first answer


age <- readline(prompt = "Enter Age:")
age <- as.numeric(age)
if(age>=18){print("eligible")}else{print("not eligible")}



## second answer

for(i in seq(1,1000)){
  if(i%%2==0){
    print(i)
    print(i)
  }else{
    print(i)
  }
}



## Third answer

vec <- c(1,2,3,4,5,7,100,30,56,78)
max(vec)
min(vec)



## fourth answer

strings <- c("Aman","Ali","Love","Ajay","Human")

for(i in strings){
  if(nchar(i)%%2==0){print(i)}
}



## fifth answer


mat <- matrix(data=seq(1,9),nrow=3,ncol=3)

for(i in 1:3){
  for(j in 1:3){
    
    x = mat[i,j]
    if(x%%2==0){
      x=x*2
    }else{
      x=x/2
    }
    mat[i,j] = x
  }
}



