library(tidyverse)
df = read_csv("train.csv")
ggplot(df, aes(LotArea, SalePrice)) + geom_point()
# shows the distribution of prices based on the style of the house (number of
# stories, bathrooms, etc.). Could further split up the categories with dplyr
# to more directly compare two categories. Initial observation is that houses
# with one and a half stories, and the second level unfinished, are generally
# the cheapest.
ggplot(df, aes(SalePrice, ..density.., color = HouseStyle)) + 
  geom_freqpoly(binwidth = 100000)
# 1.5 story unfinished second floors are usually the cheapest
one_story <- df %>% filter(HouseStyle == c("1.5Fin", "1.5Unf", "1Story"))
ggplot(one_story, aes(SalePrice, ..density.., color = HouseStyle)) + 
  geom_freqpoly(binwidth = 30000)
# Houses with excellent exterior material quality are the most expensive.
ggplot(df, aes(ExterQual, SalePrice)) + geom_boxplot()
# The average overall quality falls on the higher side
ggplot(df, aes(OverallQual)) + geom_histogram()
# Average quality is 6.1, on a scale of 1 to 10
df %>% summarize(avg = mean(OverallQual))
