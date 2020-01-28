#' ---
#' output: github_document
#' ---

## how jenny might do this in a first exploration
## purposely leaving a few things to change later!

#' Which libraries does R search for packages?
.libPaths()

## let's confirm the second element is, in fact, the default library
.Library
identical(.Library, .libPaths()[2])

## Huh? Maybe this is an symbolic link issue?
library(fs)
identical(path_real(.Library), path_real(.libPaths()[2]))

#' Installed packages
library(tidyverse)
ipt <- installed.packages() %>%
  as_tibble()

## how many packages?
nrow(ipt)

# Adding some new lines 

# Some new analyses

df <- iris

df %>% group_by(Species) %>% summarise (Sepal.Length = mean (Sepal.Length),
                                        Sepal.Width = mean (Sepal.Width)) 



df %>% group_by(Species) %>% summarise (Sepal.Length = mean (Sepal.Length),
                                        Sepal.Width = mean (Sepal.Width)) %>% 
  ggplot (aes (x = Species,
               y = Sepal.Length)) + 
  geom_col ()
