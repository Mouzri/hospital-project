outcome <- read.csv(file = "outcome-of-care-measures.csv",colClasses = "character")
df <- outcome[,c(2,7,11,17,23)]
colnames(df) <- c("hospital.name","State","heart_attack","heart_faillure","Pneumonia")
headers <- names(df)[3:5]
head(df)
df[,3] <- as.numeric(df[,3])
df[,4] <- as.numeric(df[,4])
df[,5] <- as.numeric(df[,5])

rank_hospital <- function(st,otc,num){
  
  data_of_state <- df[df$State==st,]
  #ordering the data based on the less outcome. if ties oder by the name of hospital
  ordered_data <- na.omit(data_of_state[order(data_of_state[,otc],data_of_state$hospital.name,na.last = T),])
  #add rank column with cbind
  new_data <- cbind(ordered_data,Rank=1:nrow(ordered_data))
  #return the hospital
  if(num=="best"){rank <- 1}else if(num=="worst"){rank <- nrow(new_data)
  }else if (num>nrow(ordered_data)){ return(NA)} else {rank <- num}
  final_result <- new_data[which(new_data$Rank==rank),]
  return((head(final_result)))
}
