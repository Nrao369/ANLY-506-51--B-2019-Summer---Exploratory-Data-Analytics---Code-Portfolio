#Week3
#Nikhil Rao

#Load library readr to read csv files
library(readr)
# read the csv file
ozone<-read_csv("/Users/nikhilrao/Documents/Harrisburg University/US EPA data 2017.csv")
# view the csv file
View(ozone)

# removes spaces in the column names
names(ozone)<-make.names(names(ozone))
names(ozone)

# Looking at the data in detail
nrow(ozone)
ncol(ozone)
str(ozone)
head(ozone[,c(6:7,10)])
tail(ozone[,c(7:8,11)])
table(ozone$POC)


table(ozone$Longitude)
head(ozone$Longitude,1)

# Find Observations measured at the above Longitude
install.packages(dplyr)
library(dplyr)

# Filter the USEPA Data for the above Longitude and select the 4 Columns
# Observation count, State code, Sample Duration, Arithmetic Mean
filter(ozone, Longitude == head(ozone$Longitude,1)) %>% 
  select(`Observation.Count`,`State.Code`,
         `Sample.Duration`,`Arithmetic.Mean`)

# Filter Selection for State.Code == 01 and find all Observations
filter(ozone, ozone$'State.Code' == "01") %>% 
  select(`Observation.Count`,`State.Code`,
         `Sample.Duration`,`Arithmetic.Mean`) %>% 
  as.data.frame


# Unique States in the DataSet Count and Names

select(ozone, State.Name) %>% 
  unique %>% 
  nrow

# Display unique States
unique(ozone$State.Name)

View(ozone)
# decile of the data
quantile(ozone$Observation.Count, seq(0, 1, 0.1))

# rank the state and counties by Arithmetic.Mean
ranking <- group_by(ozone, State.Name, County.Name) %>%
  summarize(ozone = mean(ozone$Arithmetic.Mean)) %>%
  as.data.frame %>%
  arrange(desc(ozone))

# view head ranking
head(ranking)

# View  bottom 10 tail ranking
tail(ranking,10)

# number of observations for White Pine county in Nevada
filter(ozone, State.Name == "Nevada" & County.Name == "White Pine") %>% 
  nrow