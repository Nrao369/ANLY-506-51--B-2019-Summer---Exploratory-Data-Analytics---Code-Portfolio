#Week2
#Nikhil Rao

#check for current working directory
getwd()

#changing the directory
setwd(dir = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio")

#Removing any current objects in my current workspace
ls()

#creating a new object
study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study1.df)

study1.htest <- t.test(score ~ sex, 
                       data = study1.df)
#Checking to see if new objects are created available in workspace
ls()

#save object as Rdata file
save(study1.df, score.by.sex, study1.htest,
     file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio")

save(study1.df, score.by.sex, study1.htest,
     file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/study1.RData")

# Save my workspace image in data folder of my working directory
save.image(file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/projectimage.RData")

#loading object study1 in current workspace
load(file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/study1.RData")

# Loading objects projectimage.RData in current workspace
load(file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/projectimage.RData")

#removing object study1
rm(study1.df)

#removing all objects from workspace
rm(list=ls())

# writing table in file pirates as tab-delimited text file

pirates.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        Age= c(51, 20, 67, 52, 42))
ls()

#setting directory again for Pirates
setwd(dir = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio")
getwd()
#save Pirates file in directory
save(pirates.df,
     file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/study1.RData")

write.table(x = pirates.df,
           file = "pirates.txt",  
           sep = "\t")    

# saving file in different location with different name
write.table(x = pirates.df,
            file = "/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/pirates1.txt",  
            sep = "\t")    
#read file from computer
mydata <- read.table(file = '/Users/nikhilrao/Documents/Harrisburg University/Code Portfolio/mydata.txt',    # file is in a data folder in my working directory
                     sep = '\t',                  # file tab--delimited
                     header = TRUE,               # the first row is a header row
                     stringsAsFactors = FALSE)    

#read file from website
fromweb <- read.table(file = 'http://goo.gl/jTNf6PD',
                      sep = '\t',
                      header = TRUE)

