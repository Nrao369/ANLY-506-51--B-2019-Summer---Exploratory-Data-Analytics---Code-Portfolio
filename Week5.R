#Week5
#Nikhil Rao

#Loading tidyverse
library(tidyverse)
# A tibble: 6 x 4
table1
# A tibble: 12 x 4
table2
# A tibble: 6 x 3
table3
# Spread across two tibbles
table4a #cases
table4b #population
# Compute rate per 10,000
table1 %>% 
  mutate(rate = cases / population * 10000)
# Compute cases per year
table1 %>% 
  count(year, wt = cases)
# Visualise changes over time
library(ggplot2)
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))
# A tibble: 3 x 3
table4a
# A tibble: 6 x 3 #Cases
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
# A tibble: 6 x 3 #Population
table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)
#Spreading
table2
table2 %>%
  spread(key = type, value = count)
#checking gather and spread are symmetrical
stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`)
#Checking if code fails
table4a %>% 
  gather(1999, 2000, key = "year", value = "cases")
#Adding new column
people <- tribble(
  ~name,             ~key,    ~value,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
#Tidying sample
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
#Separating
table3
table3 %>% 
  separate(rate, into = c("cases", "population"))
#Adding a seprator
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")
table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE)
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
#Unite
table5 %>% 
  unite(new, century, year)
#Removing'_'
table5 %>% 
  unite(new, century, year, sep = "")
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"))

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"))
#Missing values
stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
#Finding N/As
stocks %>% 
  spread(year, return)
#Setting N/A= true
stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`, na.rm = TRUE)
#Using Complete for 
stocks %>% 
  complete(year, qtr)
treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)
treatment %>% 
  fill(person)
#CaseStudy
who
who1 <- who %>% 
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)
who1
who1 %>% 
  count(key)
who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2
#adding separate
who3 <- who2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_")
who3
who3 %>% 
  count(new)
#> # A tibble: 1 x 2
#>   new       n
#>   <chr> <int>
#> 1 new   76046
who4 <- who3 %>% 
  select(-new, -iso2, -iso3)
#separate sexage into sex and age by splitting after the first character
who5 <- who4 %>% 
  separate(sexage, c("sex", "age"), sep = 1)
who5
#who dataset tidy
who %>%
  gather(key, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel")) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)