outcome <- read.csv(file = "outcome-of-care-measures.csv",colClasses = "character")
df <- outcome[,c(2,7,11,17,23)]
colnames(df) <- c("hospital.name","State","heart_attack","heart_faillure","Pneumonia")
headers <- names(df)[3:5]
head(df)
states <- names(table(df$State))#to get the names of the differsnt states
df[,3] <- as.numeric(df[,3])
df[,4] <- as.numeric(df[,4])
df[,5] <- as.numeric(df[,5])
rankall <- function(otcm,num){
  splt_data <-split(df,df$State)
  hosname <- function(my_dt){
    nw_df <- my_dt[order(my_dt[,otcm],my_dt[,1],na.last = T),]
    result<- cbind(nw_df,Rank=1:nrow(nw_df))
    final_result <- result[result$Rank==num,1]
  }
  hoslist <- sapply(splt_data, hosname)
  output <- data.frame("hospital"=as.matrix( unname(hoslist)),"state"=names(hoslist))
  print(output)
  }


