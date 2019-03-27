#load refine dataset
refine <- read.csv('./DataWranglingExercise1/refine_original.csv')

differentBrands = c("phillips", "akzo", "van houten", "unilever")
refine$company <- sapply(refine$company,
                         function(val) {
                           agrep(tolower(val),
                                 differentBrands,
                                 max.distance = 3,
                                 value = TRUE)
                         })
