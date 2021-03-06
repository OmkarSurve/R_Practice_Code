### Set the working directory where all the data files are stored

setwd("C:/Buss_Analytics/R/Quiz_1_program/rprog_data_specdata")

### Function to caluclate mean for a set of files
pollutantmean <- function(directory, pollutant, id){
      #### pollutant : for which the mean is to be calculated i.e sulphate or nitrate
      #### id: file or files for which mean is to be calculated
      dir <- directory
      sum <- numeric()
      file_dir <- paste(getwd(),"/",dir,sep="")
      setwd(file_dir)
    
    ### setting up names in partucular format for file read    
	  for(i in id){
      name <- as.character(i)
      if (0<i && i<=9){
      infile <- paste("00",name,".csv",sep="")
      }
      else if (9<i && i<=99){
      infile <- paste("0",name,".csv",sep="")
      }
      else{
      infile <- paste(name,".csv",sep="")
      }
    
      
    ### read the csv files  
      data <- read.csv(infile , header = TRUE)
      attach(data)
      if(pollutant=="nitrate"){
      ### removing the na values 
      x<- is.na(nitrate)
      y<-(data$nitrate[!x])
      sum = append(sum, y)
	}
      else{
     x<- is.na(sulfate)
     y<-(data$sulfate[!x])
     sum = append(sum, y)
	}
	}
    return(mean(sum))
}



