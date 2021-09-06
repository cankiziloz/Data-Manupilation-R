setwd("C:/DataScience")

#Reading the csv file
cuckoos <- read.csv(
  file = "cuckoos.csv",
  header = TRUE,
  sep = ",",
  quote = "\"")

head(cuckoos)

library(dplyr)

#Selecting the length column
temp <- select(
  .data = cuckoos,
  length)

head(temp)

#Filtering the rows
temp <- filter(
  .data = temp,
  length >= 22)

head(temp)

#Computing a new column
temp <- mutate(
  .data = temp,
  estimatedLength = length * 0.85)

head(temp)

#Group by a column
temp <- group_by(
  .data = cuckoos,
  species)

head(temp)

#Calculations on the grouped data
temp <- summarise(
  .data = temp,
  averageLength = mean(length))

head(temp)

#Same operations with chained method
temp <- cuckoos %>%
  select(species, length) %>%
  group_by(species) %>%
  summarise(averageLength = mean(length)) %>%
  as.data.frame()

head(temp)

#Saving the result
write.csv(
  x = temp,
  file = "AverageLength.csv",
  row.names = FALSE)
