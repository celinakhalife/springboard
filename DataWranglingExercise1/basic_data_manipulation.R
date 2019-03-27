library(tidyr)
library(dplyr)

#load refine dataset
refine <- read.csv('./DataWranglingExercise1/refine_original.csv')

# supposedly, we have the list of all brands
differentBrands = c("phillips", "akzo", "van houten", "unilever")
# I'm searching for matches to the differentBrands list and
# replacing the company value with it
refine$company <- sapply(refine$company,
                         function(val) {
                           agrep(tolower(val),
                                 differentBrands,
                                 max.distance = 3,
                                 value = TRUE)
                         })

category <-
  c(p = 'Smartphone',
    v = 'TV',
    x = 'Laptop',
    q = 'Tablet')

# separate product code and number
# then add a product category number
refine <-
  refine %>% separate(2,
                      c('product_code', 'product_number'),
                      sep = "-",
                      remove = FALSE) %>% mutate(product_category = category[product_code])

refine
