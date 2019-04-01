library(tidyr)
library(dplyr)

#load refine dataset
data <- read.csv('./DataWranglingExercise2/titanic_original.csv')

# replace empty embarked values with S
data$embarked[data$embarked == ''] <- "S"

# fill empty age values with age mean
ageMean = mean(data$age, na.rm = TRUE)
data$age[is.na(data$age)] <- ageMean
