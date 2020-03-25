library(dplyr)
library(lubridate)

dates <- seq(as.Date("2010-01-01"), as.Date("2020-03-25"), "day")
links_df <- data.frame(sub_url = 'https://www.gpw.pl/archiwum-notowan?fetch=1&type=10&instrument=&date=',
                       dates)
links_df <- links_df %>% 
  mutate(dates = paste0(day(dates), '-', month(dates), '-', year(dates)),
         url = paste0(sub_url, dates))

for (i in 1:3737) {
  browseURL(links_df[i,3])
}