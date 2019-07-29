#create matrices
x <- 1:5
y <- 6:10
z <- 11:15

#create a matrix with x,y,z columns

cbind(x, y, z)

#create a matrix with x,y,z rows

rbind(x, y, z)

#creating matrices converting number to characters

cbind(c(1, 2, 3, 4, 5),
      c("A", "B", "C", "D", "D"))

# Create a matrix of the integers 1-10 with 6 rows and 5 columns

matrix(data = 1:10,
       nrow = 6,
       ncol = 5)

# checking with 2 rows and 5 columns with integers 1-5
matrix(data = 1:5,
       nrow = 2,
       ncol = 5)

# checking with 3 rows and 5 columns,fill by rows instead of columns
matrix(data = 1:15,
       nrow = 3,
       ncol = 5,
       byrow = TRUE)

#create dataframe called survey data
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "none", "f", "f"),
                     "age" = c(30,25,26,29,15))

#viewing the dataframe
str(survey)

# Create a dataframe of survey data removing factors
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "none", "f", "f"),
                     "age" = c(50,40,55,34,44),
                 stringsAsFactors = FALSE)
#print output
survey

#output without factors
str(survey)


#checking head function that shows only head of the few rows
head(ChickWeight)

# checking tail() that shows shows the last few rows
tail(ChickWeight)

# view data frame in other window
View(ChickWeight)

#summary statistics
summary(ToothGrowth)

# print summary toothgrowth
str(ToothGrowth)

#names of column ToothGrowth dataframe
names(ToothGrowth)

# Print the length column ToothGrowth
ToothGrowth$len

#mean length column ToothGrowth
mean(ToothGrowth$len)

# checking table ToothGrowth
table(ToothGrowth$supp)

# Print length AND supplement columns of ToothGrowth
head(ToothGrowth[c("len", "supp")])

#adding new columns
survey <- data.frame("index" = c(1, 2, 43, 4, 5),
                     "age" = c(39,33,35,68,15))
#print new columns
survey

# adding new column sex to matrix
survey$sex <- c("m", "m", "none", "f", "m")
#print new column
survey

names
# trying to change 1st column the name of dataframe
names(survey)[1] <- "participant.number"

#print output
survey

# trying to change 3rd  column the name of dataframe
names(survey)[2] <- "b"

#trying to Change the column name from age to age.year
names(survey)[names(survey) == "age"] <- "year"

#trying the slice the dataframes
ToothGrowth[1:4, c(1,3)]

# Getting 1st row (and all columns) of ToothGrowth
ToothGrowth[1, ]

# trying to get  2nd column (and all rows) of ToothGrowth
ToothGrowth[, 2]

#creating a new dataframe with rows of toothgrowth with supplement=VC
ToothGrowth.VC <- ToothGrowth[ToothGrowth$supp == "VC", ]


#creating a new dataframe with rows of toothgrowth with supplement=OJ and Dose<1

ToothGrowth.OJ.a <- ToothGrowth[ToothGrowth$supp == "OJ" &
                                  ToothGrowth$dose < 1, ]

# Rows of ToothGrowth where length < 20 AND supplement == "OJ" AND dose >= 1
subset(x = ToothGrowth,
       subset = len < 20 &
         supp == "OJ" &
         dose >= 1)

# Rows of ToothGrowth where  length > 30 AND supplement == "VC" -->return the length and dose columns
subset(x = ToothGrowth,
       subset = len > 30 & supp == "VC",
       select = c(len, dose))

# Combining slicing with functions the mean toothlength of Guineapigs=OJ


oj <- subset(x = ToothGrowth,
             subset = supp == "OJ")
# Calculate the mean of the length column new subset

mean(oj$len)

#using same calculations with logical indexing 
oj <- ToothGrowth[ToothGrowth$supp == "OJ",]

#using mean() to get mean length of subset data
mean(oj$len)

#calculations showing mean can be calculated together to column vector
mean(ToothGrowth$len[ToothGrowth$supp == "OJ"])


#creating dataframe Health
health <- data.frame("age" = c(32, 24, 43, 19, 43),
                     "height" = c(1.75, 1.65, 1.50, 1.92, 1.80),
                     "weight" = c(70, 65, 62, 79, 85))

# Calculating bmi
health$weight / health$height ^ 2

#using the with() function
with(health, height / weight ^ 2)

#lines of code that perform identical calculations for same result
#short code
with(health, weight + height / age + 2 * height)
#long code 
health$weight + health$height / health$age + 2 * health$height



#R Pratice 2 - Vectors
# using purr packages 
library(purrr)

library(tidyverse)

#vector basics 
#Atomic vetors--> logical, integer, double,character and raw -->numeric vectors
#Lists-->recursvice vectors contains lists
#difference is homogenous and heterogeneous

#using function Typeof() to determine vector properties
typeof(letters)
##[1] "character"

#using function typeof()
typeof(1:15)
##[1] "integer"

#using length()
x <- list("a","b",1:10)
length(X)

#vectors contain metadata in form of attributes
#factors built on top of integer vectors
#dates and date times built on top of numeric vector
#data frames and tibbles built on top of lists

# Logical vectors is atomic vectors values -->FALSE, TRUE and NA-->these vectors are used as comparison operators

1:10 %% 3 ==0
#Output-->[1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE

c(TRUE, TRUE, FALSE, NA)
#Output-->[1]  TRUE  TRUE FALSE    NA

#numeric vectors Integer and double vectors as numeric vectors
typeof(1)
#output-->[1] "double"
typeof(1L)
#output-->[1] "integer"

#Doubles are approximations. Doubles represent floating point numbers that cannot be represetned wth fixed amount of memory

#checking sqaure root of 4
x <- sqrt(4) ^ 4
x
#output-->[1] 16

x - 2
#output-->[1] 14

#integers have one special value-->NA; Doubles has four NA, NaN, Inf and -Inf 
c(-1,0,1)
#[1] -1  0  1
c(-1,0,1)/0

#output [1] -Inf  NaN  Inf -->all special values arise during divisions
#avoid using == check instead use is.finite(),is.infinite() and is.nan()

#character vectors complex type of amotic vector string contains arbitary aount of data
#using pryr::object_size() to check memory alloation 

x<- "this is a reasonably long string"
pryr:: object_size(x)
#152 B

y<- rep(x,1500)
pryr:: object_size
#12.1 kB

#Missing values each type of atomic vector has own missing value:
#logical vector 
NA
#output [1] NA

#Integer vector
NA_integer_
#output [1] NA

#double vector
NA_real_

#character vector
NA_character_

#Coercion 
#two types of coercion--> explicit coercion and implicit coercion
#explicit coercion--> if vector has wrong type 

#implicit coercion using logical vectors-->true converted to 1 and  false converted to 0 

x<- sample (20,100, replace=TRUE)
y<- x >10
sum(y)
#check how many greater than 10
#output [1] 52

mean(y)
#checking proportion greater than 10
#[1] 0.52

if(length(x))
{x>5}
#[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#[19] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
#[37]  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#[55]  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
#[73]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
#[91]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE#
length(x)>0

#using vectors with multiple types

typeof(c(TRUE, 1L))
#output [1] "integer"

typeof(c(1L, 1.5))
#output [1] "double"
 
typeof(c(1.5,"a"))
#output [1] "character"
#mixing vectors and scalars 
sample(10)+100
runif(10) > 0.5

#Mathematical operations with vectors-->scalar
1:10 + 1:2
#output [1]  2  4  4  6  6  8  8 10 10 12
1:10 + 1:3
#output [1]  2  4  6  5  7  9  8 10 12 11

# vector recycling used to create vectorised functions,using rep()
tibble(x = 1:4, y = 1:2)

tibble(x = 1:4, y = rep(1:2, 2))

tibble(x = 1:4, y = rep(1:2, each = 2))

#trying to name vectors using c()
c(x = 1, y = 2, z = 4)

#also with purrr:: set_names()
set_names(1:3, c ("a","b","c"))

#Subsetting
dplyr::filter()

#subsetting positive integers 
x <- c("one","three","five")
x[c(1,3,5)]

#longer output than input
x[c(1,1,5,5,2)]

#Negative values
x[c(-1,-3,-5)]

#error message
x[0]

x<- c(10,3, NA, 5,8,1,NA)
#checking non missin values of x
x[!is.na(x)]
#checking even values of x
x[x %% 2 == 0]


#vector subset with character vector
x<- c(abc = 1, def = 2,xyz = 5 )
x[c("xyz","def")]

#Learning to use Recursive vectors using list()

x<- list(1,2,3)
x

str(x)

#list() contains mix of objects
y<- list("a", 1L,1.5, TRUE)
str(y)

#List sometimes may containg other lists
z<- list(list(1,2), list(3,4))
str(z)

#visualizing subset
#subset a list
a<- list(a=1:3,b="a string", c = pi, d =list (-1,-5))

str(a[1:2])
str(a[4])

#attributes additional metadata
#attr()

x<- 1:10
attr(x,"greeting")

attr(x, "greeting") <- "Hi!"
attr(x, "farewell") <- "Bye!"
attributes(x)

#Factors categorical data that can take a fixed set of possible values
x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
typeof(x)

#numeric vectors to represent dates and date time
x <- as.Date("2019-07-20")
unclass(x)

typeof(x)
attributes(x)

#tibbles are augmented lists that have class,names rows columns

tb<- tibble:: tibble(x = 1:5, y = 5:1)

typeof(tb)
attributes(tb)

#all functions with tibbles enforce constraint

df<- data.frame(X=1:5, y = 5:1)
typeof(df)
attributes(df)


typeof(tb)
attributes(tb)