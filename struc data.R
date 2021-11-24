library(readr)
library(tidyverse)
structures <- read_csv("https://raw.githubusercontent.com/simonmig10/M3/main/structures.csv")
View(structures)

min5 = structures %>% filter(Time <= 5) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff_5 = bTowers - rTowers) %>% 
  select(Address, tower_diff_5) %>% ungroup


min10 = structures %>% filter(Time <= 10) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff_10 = bTowers - rTowers) %>% 
  select(Address, tower_diff_10) %>% ungroup


min15 = structures %>% filter(Time <= 15) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff_15 = bTowers - rTowers) %>% 
  select(Address, tower_diff_15) %>% ungroup


min5_in = structures %>% filter(Time <= 5) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(inhib_diff_5 = bInhibs - rInhibs) %>% 
  select(Address, inhib_diff_5) %>% ungroup


min10_in = structures %>% filter(Time <= 10) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n) %>% 
  mutate(inhib_diff_10 = bInhibs - rInhibs) %>% 
  select(Address, inhib_diff_10) %>% ungroup


min15_in = structures %>% filter(Time <= 15) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(inhib_diff_15 = bInhibs - rInhibs) %>% 
  select(Address, inhib_diff_15) %>% ungroup

total_struc = structures %>% 
  count(Address) %>% 
  select(Address) %>% 
  left_join(min5, by = c("Address")) %>% 
  left_join(min10, by = c("Address")) %>% 
  left_join(min15, by = c("Address")) %>% 
  mutate(inhib_diff_5 = 0) %>% 
  mutate(inhib_diff_10 = 0) %>% 
  left_join(min15_in, by = c("Address")) %>% 
  replace_na(list(tower_diff_5 = 0, tower_diff_10 = 0, tower_diff_15 = 0, inhib_diff_15 = 0))
