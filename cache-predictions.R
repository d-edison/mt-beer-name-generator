
files <- list.files("predictions", full.names = TRUE)

predictions <- lapply(files, function(x){
  unique(readLines(x))
})

saveRDS(predictions, "predictions.rds")
