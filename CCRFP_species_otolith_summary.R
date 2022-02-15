#########################################################################
### CCFRP species counts by program for otolith request for the
### 2022 fishing season
### Melissa Monk
#########################################################################

---
title: CCFRP Notebook
output: html_notebook
---



rm(list = ls(all = TRUE))
graphics.off()

library(RColorBrewer)
library(dplyr)
library(tidyr)
library(ggplot2)
library(kableExtra)

setwd("C:/GitHub/CCFRP")

#-------------------------------------------------------------------------------
# Read in data and basic cleanup
# Eventually open these directly in access, but it's not behaving
# Extract excel files from the Access database
# read in trip data
trips <- read.csv("1-Trip Information.csv", fileEncoding="UTF-8-BOM")
# read in drift data
drifts_all <-read.csv("3-Drift Information.csv", fileEncoding="UTF-8-BOM")
# read in catch data
catches <- read.csv("4-Caught Fishes.csv", fileEncoding="UTF-8-BOM")
#Species lookup
Species <- read.csv("Fish Species.csv", fileEncoding="UTF-8-BOM")
Species <- Species %>%
  select(Species.Code, Common.Name, Rockfish)

#Read in management groups
Areas <- read.csv("Monitoring Areas.csv", fileEncoding="UTF-8-BOM")


# read in the two GIS depth spreadsheets from Becky
GIS.start.depth <- readxl::read_xlsx("CCFRP_Start_GIS_Depths.xlsx")
GIS.end.depth <- readxl::read_xlsx("CCFRP_End_GIS_Depths.xlsx")

# columns have spaces - remove all spaces here
trips <- trips %>% rename_all(make.names)
catches <- catches %>% rename_all(make.names)
drifts_all <- drifts_all %>% rename_all(make.names)

#Add species common names
catches <- left_join(catches, Species, by = 'Species.Code') %>%
  filter(Rockfish == TRUE)

GIS.end.depth <- GIS.end.depth %>%
  rename_all(make.names) %>%
  dplyr::select(DriftID, Depth2mRes, Depth90mRes) %>%
  rename(EDepth2mRes = Depth2mRes, EDepth90mRes = Depth90mRes)

GIS.start.depth <- GIS.start.depth %>%
  rename_all(make.names) %>%
  dplyr::select(DriftID, Depth2mRes, Depth90mRes) %>%
  rename(SDepth2mRes = Depth2mRes, SDepth90mRes = Depth90mRes)
GIS.depths <- left_join(GIS.start.depth, GIS.end.depth)
GIS.depths <- GIS.depths %>% rename(Drift.ID = DriftID)

# select final columns from trip table
trips <- trips %>%
  dplyr::select(Trip.ID, Month, Day, Year.Automatic, Vessel) %>%
  rename(YEAR = Year.Automatic)
# join drifts and trip info
drifts_all <- left_join(drifts_all, trips)
drifts_all <- left_join(drifts_all, GIS.depths)


# Pull only relevent column names from the drifts
drifts <- drifts_all %>%
  dplyr::select(
    Drift.ID, Trip.ID, ID.Cell.per.Trip, Grid.Cell.ID,
    Site..MPA..REF., Drift.Time..hrs., Total...Anglers.Fishing,
    Start.Depth..ft., End.Depth..ft., Excluded.Drift.Comment,
    ST_LatDD, ST_LonDD, Month, Day, YEAR, Vessel,
    SDepth2mRes, EDepth2mRes, SDepth90mRes, EDepth90mRes
  ) %>%
  mutate(
    SDepth2mRes = na_if(SDepth2mRes, -9999),
    EDepth2mRes = na_if(EDepth2mRes, -9999),
    SDepth90mRes = na_if(SDepth90mRes, -9999),
    EDepth90mRes = na_if(EDepth90mRes, -9999)
  ) %>%
  rename(SITE = Site..MPA..REF.) %>%
  filter(!is.na(Drift.Time..hrs.))

# Need to change 7's to july and 8's to august
drifts$Month[drifts$Month == 7] <- "July"
drifts$Month[drifts$Month == 8] <- "August"

meters_to_feet <- function(x) (-x * 3.281)
drifts <- drifts %>%
  mutate_at(
    vars(SDepth2mRes, EDepth2mRes, SDepth90mRes, EDepth90mRes),
    meters_to_feet
  )


# check depth info
summary(drifts$SDepth90mRes)
summary(drifts$EDepth90mRes)
summary(drifts$Start.Depth..ft.)

# Collapse catches to drift level
#Target_catches <- subset(catches, Species.Code == ccfrp.species.code)
Drift_catches <- catches %>%
  group_by(Common.Name, Drift.ID) %>%
  tally()
#colnames(Target_catches)[2] <- "Target"

# join drifts and catch info and make NA 0 where target species not observed
dat <- left_join(Drift_catches, drifts)
dat <- dat %>%
  mutate(Area.code = substring(Drift.ID, 1, 2)) %>%
  mutate(Effort = Total...Anglers.Fishing * Drift.Time..hrs.) %>%
  mutate(CPUE = n / Effort)

dat <- left_join(dat, Areas)

# Piedras blancas cells to drop
# BL_drop = c('BL23', 'BL24','BL25', 'BL26', 'BL29', 'BL31',  'BL33', 'BL34', 'BL39', 'BL43', 'BL46')
# fix two data entry errors
levels(dat$Grid.Cell.ID)[levels(dat$Grid.Cell.ID) == "Bl49"] <- "BL49"
levels(dat$Grid.Cell.ID)[levels(dat$Grid.Cell.ID) == "Bl51"] <- "BL51"

# drop cells marked as have the following last two character
#dat <- dat %>% filter(!(grepl("MM", .$Grid.Cell.ID) | grepl("RR", .$Grid.Cell.ID) |
#  grepl("MN", .$Grid.Cell.ID) | grepl("MO", .$Grid.Cell.ID)))

#dat <- droplevels(dat)


#-------------------------------------------------------------------------------
# AREA filters
# tables of grid cells and years
# put AREAs north to south

#dat$AREA <- factor(dat$AREA, levels = c("CM", "TM", "SP", "BH", "AN", "PL", "BL", "PB", "AI", "CP", "SW", "LB", "LJ", 
#                      "BM", "FN", "TD" ,"PC")) #these are not in order but get removed
 
# List of AREAs to drop
# TD, Trinidad - no mpa
# FN, farallons, samples only 2 years
# PC - error?
dat <- dat %>%
  filter(!(Area.code %in% c("FN", "PC", "BM", "LB", "TD"))) %>%
  droplevels

with(dat, table(Area.code))




#-------------------------------------------------------------------------------
# Fish time filter
# Give drifts within a cell on the same day a drift number
# See how many drifts and total fished time
Num_drifts_fished <- dat %>%
  select(YEAR, Drift.ID, ID.Cell.per.Trip, Drift.Time..hrs.) %>%
  unique() %>%
  group_by(YEAR, ID.Cell.per.Trip) %>%
  summarise(
    num.drifts = n(),
    tot_time = sum(Drift.Time..hrs.)
  )
# cells fished at least 15 minutes
Drift_time_keep <- Num_drifts_fished %>% filter(tot_time >= .25)

# Remove cells fished less tan a total of 15 minutes on a day
dat <- dat %>%
  filter(
    ID.Cell.per.Trip %in% Drift_time_keep$ID.Cell.per.Trip,
    `Drift.Time..hrs.` > 0.03333333
  )

 
#-------------------------------------------------------------------------------
                       
#-------------------------------------------------------------------------------


# southern califronia AREAs
# AI = Anacapa Island
# CP Carrington Point
# LB Laguna Beach
# LJ South La Jolla
# PC Point Conception
# SW Swamis
# dat$AREA =  recode_factor(dat$AREA,'AN'='AnoNuevo',
# 'BH' = 'BodegaHead',
# 'BL' = 'PiedrasBlancas',
# 'CM' = 'SouthCapeMendocino',
# 'PB' = 'PointBuchon',
# 'PL' = 'PointLobos',
# 'SP' = 'StewartsPoint',
# 'TD' = 'Trinidad',
# 'TM' = 'TenMile')

#-------------------------------------------------------------------------------
# Figure out how many of each species we can collect during the 2022 season

#Subset to just Reference areas since we can't take otoliths from MPAs
#and only look at 2019-2021
dat_species <- dat %>%
  filter(SITE == 'REF',
         YEAR > 2018) 

# southern_sites = c("AI", "CP", "LJ", "PC", "SW", "LB")
# central_sites = c("AN", "PL", "PB", "BL")
# northern_sites = c("BH", "CM","SP", "TD", "TM")
# dat_species <- dat_species %>%
#   mutate(CA_area = case_when(AREA %in% southern_sites ~ "South",
#                              AREA %in% central_sites ~ "Central",
#                              AREA %in% northern_sites ~ "North")) 
# dat_species$CA_area = as.factor(dat_species$CA_area)
# summary(dat_species$CA_area)

## Get it down to the species there would be enough or or we're interested in
total.fish <- dat_species %>%
  group_by(Common.Name) %>%
  summarise(total = sum(n)) %>%
  filter(total > 50)




dat_species <- dat_species %>%
  filter(Common.Name %in% total.fish$Common.Name) %>%
  filter(!(Common.Name %in% c("Yellowtail Rockfish",
                              "Rosy Rockfish", 
                             # "Kelp Rockfish" ,"Treefish", 
                             # "Honeycomb Rockfish", 
                              "Black-and-Yellow Rockfish",
                              "Yelloweye Rockfish", "Calico Rockfish"))) 
  

fish_numbers <- dat_species %>%
  group_by(Common.Name, Monitoring.Group, YEAR, Region) %>%
  summarise(total_fish = sum(n),
            avg_annual_cpue = mean(CPUE))# %>%
  # group_by(Common.Name, CA_area) %>%
  # summarise(avg_fish = mean(total_fish),
  #           avg_cpue = mean(avg_annual_cpue)) %>%
  # mutate(avg_fish = round(avg_fish,0))
  # 

####SOUTH
south_data = subset(fish_numbers, Region =="South") %>%
  filter(YEAR %in% c(2018, 2019, 2021)) 
# Get the average number of fish by program per year
south0 <- south_data %>%
  group_by(Common.Name, Monitoring.Group) %>%
  summarise(average_fish = mean(total_fish)) %>%
  filter(average_fish > 4)

#Get the percent of the fish collected by each program and multiply by 50 - goal or less
#number of otoliths per species
south_collections <- south0 %>%
  group_by(Common.Name) %>%
  summarise(total = sum(average_fish))
south_collections <- left_join(south_collections, south0) %>%
  mutate(num_to_collect =  if_else(total > 75, ceiling(((average_fish/total)*50)), 
                                    ceiling(((average_fish/total)*(.6*total))))) #%>%


#Check totals for each program to see how they fall out in terms of effort for collecting
south_program_effort <- south_collections %>%
  group_by(Monitoring.Group) %>%
  summarise(total_fish_for_otoliths = sum(num_to_collect))


#####NORTH
north_data = subset(fish_numbers, Region!= "South")  %>%
  filter(YEAR %in% c(2018, 2019, 2021)) 
# Get the average number of fish collected over the last three years by program
north0 <- north_data %>%
  group_by(Common.Name, Monitoring.Group) %>%
  summarise(average_fish = mean(total_fish)) %>%
  filter(average_fish > 4)


#Get the percent of the fish collected by each program and multiply by 60 - goal 
#number of otoliths per species
north_collections <- north0 %>%
  group_by(Common.Name) %>%
  summarise(total = sum(average_fish))
north_collections <- left_join(north_collections, north0) %>%
  mutate(num_to_collect =  if_else(total > 75, ceiling(((average_fish/total)*50)), 
                                   ceiling(((average_fish/total)*(.6*total)))))

#Check totals for each program to see how they fall out in terms of effort for collecting
north_program_effort <- north_collections %>%
  group_by(Monitoring.Group) %>%
  summarise(total_fish_for_otoliths = sum(num_to_collect))

program_effort = rbind(south_program_effort, north_program_effort)

###Bind the collection numbers and make a table
collections <- rbind(north_collections, south_collections) 
collections_final <- collections %>%
  select(Common.Name, Monitoring.Group, num_to_collect) %>%
  pivot_wider(names_from = Monitoring.Group, values_from = num_to_collect, values_fill = 0) %>%
  rowwise(Common.Name) %>%
  mutate(Total = sum(c_across(BML:SIO)))
