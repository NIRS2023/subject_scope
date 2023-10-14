library(tidyverse)
library(lme4)
library(lmerTest)

targets = read_csv('experiment_2_targets.csv')

scope_targert=lmer(Evaluation ~ Agreement + (1|Protocol) + (1|Story), 
                   data = targets)
summary(scope_targert)

fillers = read_csv('experiment_2_fillers.csv')

scope_filler=lmer(Evaluation ~ Type + (1|Protocol) + (1|Filler), 
                  data = fillers)
summary(scope_filler)