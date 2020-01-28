## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path

library(here)
library(tidyverse)

df <- read_csv (here ("data", "installed-packages.csv"))
## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
apt <- ipt %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)

df_2 <- df %>%
  dplyr::filter (is.na (Priority)) %>%
  select (Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

write_csv(df_2,
          path = here("data", "add-on-packages.csv"))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:

apt_freqtable <- df_2 %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

write_csv (apt_freqtable,
           path = here("data", "add-on-packages-freqtable.csv")
           )


## YES overwrite the files that are there now
## they are old output from me (Jenny)
## they are just examples
