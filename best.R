#reading the date from the directory
setwd("rank hospitall project/")
outcome <- read.csv(file = "outcome-of-care-measures.xls.csv",colClasses = "character")
df <- outcome[,c(2,7,11,17,23)]
colnames(df) <- c("hospital.name","State","heart_attack","heart_faillure","Pneumonia")
headers <- names(df)[3:5]
head(df)
df[,3] <- as.numeric(df[,3])
df[,4] <- as.numeric(df[,4])
df[,5] <- as.numeric(df[,5])
best <- function(sta, cause){
  #check the vqlidity of entries
  if(any(df$State==sta&cause%in%headers))
  {
  #selecting based on the state
  mydf <- df[df$State==sta,]
  # removing the NA from the cause
  dfn <-  mydf[!is.na(mydf[,cause]),]
  #fing the min in alogical vector
  spot_min <- dfn[,cause]==min(dfn[,cause])
  result <- dfn[spot_min,1]
  final_result <- result[order(result)]
  return(final_result[1])}
  else if (all(df$State!=sta)){
    return("Error state")
  }
  else{
    return("Error outcome")
  }
}

