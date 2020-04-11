
library(rvest)

current <- read_html("https://www.beeradvocate.com/beer/profile/31987/") %>% 
  html_nodes(".hr_bottom_light") %>% 
  html_text()

current <- current[seq_along(current) %% 6 == 1]

archive <- read_html("https://www.beeradvocate.com/beer/profile/31987/?view=beers&show=arc") %>% 
  html_nodes(".hr_bottom_light") %>% 
  html_text()

archive <- archive[seq_along(archive) %% 6 == 1]

all <- c(current, archive)

cat(all, sep = "\n", file = "mtbeers.txt")
