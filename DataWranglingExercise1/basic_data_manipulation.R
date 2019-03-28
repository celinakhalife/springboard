library(tidyr)
library(dplyr)

#load refine dataset
refine <- read.csv('./DataWranglingExercise1/refine_original.csv')

# supposedly, we have the list of all brands
differentBrands <- c("phillips", "akzo", "van houten", "unilever")
# I'm searching for matches to the differentBrands list and
# replacing the company value with it
refine$company <- sapply(refine$company,
                         function(val) {
                           agrep(tolower(val),
                                 differentBrands,
                                 max.distance = 2,
                                 value = TRUE)[1]
                         })

category <-
  c(p = 'Smartphone',
    v = 'TV',
    x = 'Laptop',
    q = 'Tablet')

# separate product code and number
# then add a product category label
refine <-
  refine %>% separate(2,
                      c('product_code', 'product_number'),
                      sep = "-",
                      remove = FALSE) %>% mutate(product_category = category[product_code])

# create geocoding column by concatenating the three address fields
refine <-
  refine %>% unite(full_address ,
                   address,
                   city,
                   country,
                   sep = ", ",
                   remove = FALSE)

# add dummy variables
brandCodes <- gsub(" ", "_", differentBrands) %>% 
  paste( "company_",., sep="")

for(i in 1:length(brandCodes)) {
  code <- brandCodes[i]
  value <- differentBrands[i]
  
  refine <- refine %>% mutate(!!code :=
                                if_else(company == value, 1, 0))
}


categoryCodes <- category %>% sapply(tolower) %>% 
  paste( "product_",., sep="")

for(i in 1:length(categoryCodes)) {
  code <- categoryCodes[i]
  value <- category[i]
  
  refine <- refine %>% mutate(!!code :=
                                if_else(product_category == value, 1, 0))
}



refine
