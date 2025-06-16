##script to examine species list from censused trees in summer 2024
##census data provided by Marc G

# install.packages("readxl")
library(readxl)
library(dplyr)
library(tidyverse)
library(janitor)

setwd <- "C:/Users/hmz25/Box/Katz lab/arnot/"

data <- "C:/Users/hmz25/Box/Katz lab/arnot/ForestGeo ha 02 data 2025-06-06.xlsx"

sheet_names <- excel_sheets(data)

df_sheets <- sheet_names[2:6]

species_df <- lapply(df_sheets, function(select_sheet){
  read_excel(data, sheet = select_sheet)
}) %>% 
  bind_rows()

species_df_clean <- species_df %>% 
  drop_na(`Species (4 char)`) %>% 
  clean_names()

species_list <- species_df_clean %>% 
  unique(species_df_clean`Species (4 char)`)

species_list <- unique(species_df_clean$species_4_char)

print(species_list)
