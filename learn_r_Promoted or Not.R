
setwd("G:/analytics/ISB CBA/R book code")
#student results on each subjects, pass or fail, and if any student
# passes in more than 3 subjects then he or she will be promoted
# to next level - so check it out who all will be promoted.

library(XLConnect)
wb <- loadWorkbook("rtest.xlsx")
data <- readWorksheet(wb,sheet = "Sheet1",header = TRUE)
View(data)

#vector to store final outcome whether the student gets promoted or not
d<- c()
#vector to store final outcome which says in how many subject the
#student has passed.
p<- c()
for(i in c(1:nrow(data))){
  c <- 0
  for(j in c(2:ncol(data)))
    if(data[i,j]=="pass"){
      c = c+1
    }
  p[[i]] <- c
  if(c>=3){
    d[[i]] <- "Promoted"
  }
  else{
    d[[i]] <- "Not Promoted"  
    }
}
data$class = cbind(data,p,d)
data
#In total 3 students are not able to make it to next level.