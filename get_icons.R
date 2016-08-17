library(magrittr)
for(i in 1:151){
  url <- "https://df48mbt4ll5mz.cloudfront.net/images/pokemon/" %>% paste0(i, ".png")
  download.file(url, destfile = paste0("icons/", i, ".png"))
}