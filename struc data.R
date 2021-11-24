library(readr)
library(tidyverse)
structures <- read_csv("C:/Users/andre/Desktop/structures.csv")
View(structures)

min5 = structures %>% filter(Time <= 5) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup


min10 = structures %>% filter(Time <= 10) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup


min15 = structures %>% filter(Time <= 15) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup


min20 = structures %>% filter(Time <= 20) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup

min25 = structures %>% filter(Time <= 25) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup

min30 = structures %>% filter(Time <= 30) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup

min30a = structures %>% filter(Time > 30) %>%
  group_by(Address) %>%
  count(Team) %>%
  pivot_wider(names_from = Team, values_from = n, values_fill = 0) %>%
  mutate(tower_diff = bTowers - rTowers) %>% 
  select(Address, tower_diff) %>% ungroup
