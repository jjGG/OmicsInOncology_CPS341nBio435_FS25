getwd()
library(readr)
install.packages("conflicted")
library(tidyverse)
mpg_df <- mpg # this dataset is based in package'tidyvese'- remember to install it first
mpg_df %>% head() # %>% can chain multiple functions
head(mpg_df)
mpg_df %>% ggplot(aes(x = displ, y = cty)) + geom_point()

mpg_df %>% ggplot(aes(x = displ, y = cty)) +
    geom_point(aes(colour = class))

mpg_df %>% ggplot(aes(x = displ, y = cty)) +
    geom_point(aes(colour = class)) +
    geom_smooth(method='lm')

mpg_df %>% ggplot(aes(x = displ, y = cty)) +
    geom_point(aes(colour = class)) +
    geom_smooth(method='lm')  +
    xlim(0,7) + ylim(0,40) +
    xlab('Engine size (L)') +
    ylab('Miles per gallon in the city') +
    ggtitle(label = 'Engine size affects mileage', subtitle = 'Some extra info here too') +
    theme_bw()
