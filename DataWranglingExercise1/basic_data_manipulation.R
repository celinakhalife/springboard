#load refine dataset
refine <- read.csv('./DataWranglingExercise1/refine_original.csv')

# supposedly, we have the list of all brands
differentBrands = c("phillips", "akzo", "van houten", "unilever")
# I', searching for matches to the differentBrands list and 
# replacing the company value with it 
refine$company <- sapply(refine$company,
                         function(val) {
                           agrep(tolower(val),
                                 differentBrands,
                                 max.distance = 3,
                                 value = TRUE)
                         })
