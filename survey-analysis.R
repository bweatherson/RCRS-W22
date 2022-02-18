require(tidyverse)
require(readr)
survey <- read_csv("Good and Bad Abstracts Survey Student Analysis Report.csv")
num_ans <- survey %>% select(2:21)

ggplot(gather(num_ans), aes(value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~key, ncol = 4)

best <- survey %>% select(22) %>% group_by(Best) %>% tally() %>% arrange(-n)

worst <- survey %>% select(23) %>% group_by(Worst) %>% tally() %>% arrange(-n)