
#Code to make sas datasets

#Before running, a folder with the path data/sas needs to be made, 
#and within in this a folder with identical name to the folder of the raw data
# e.g. "data/raw/sas/_20231011_143125/"


library(tidyverse)
library(glue)
library(haven)
library(labelled)

args <- commandArgs(trailingOnly = TRUE)
if (length(args)==0) {
  export_name <- "_20231011_143125" #Must be the name of the exported data
} else if (length(args) != 0) {
  export_name <- args[1]
}


export_folder <- glue("data/raw/sas/{export_name}/")

raw <- read_rds("data/raw/raw.rds")

tmp <- raw %>% 
  mutate(sasxpname = paste0(export_folder,id,".xpt")) %>% 
  filter(!stringr::str_ends(id,".txt")) %>% 
  filter(!str_ends(id,".sas")) %>% 
  filter(id != "codelist") %>% 
  filter(id != "items")

walk2(tmp$data, tmp$sasxpname, write_xpt)
  
