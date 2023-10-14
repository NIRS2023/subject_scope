library(tidyverse)
library(lme4)
library(lmerTest)

targets = read_csv('experiment_1_targets.csv')

scope_targert=lmer(Answer ~ Aspect*Agreement*Scope 
          + (1|Protocol) + (1|Story), data = targets)
summary(scope_targert)

fillers = read_csv('experiment_1_fillers.csv')

fillers %>%
  filter(Filler_type == 'coordination_island') -> coordination_island
scope_coordination = lmer(Answer ~ Scope + (1|Protocol), data = fillers)
summary(scope_coordination)

fillers %>%
  filter(Filler_type == 'adjuct_island') -> adjuct_island
scope_adjuct = lmer(Answer ~ Scope + (1|Protocol), data = fillers)
summary(scope_adjuct)