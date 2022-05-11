################################################################################
### Script to clean up the CCFRP data and get it in 
### A form to use for exploratory analysis
### Melissa Monk
### Feb 2022
################################################################################
rm(list = ls(all = TRUE))
graphics.off()

library(dplyr)
library(tidyr)


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
Species$NMFS_interest = Species$Rockfish
nonrockfish = c("California Scorpionfish", "Kelp Greenling", "Lingcod")
Species <- Species %>%
  mutate(NMFS_interest = replace(NMFS_interest, Common.Name %in% nonrockfish, TRUE))
Species <- Species %>%
  select(Species.Code, Common.Name, Rockfish, NMFS_interest) %>%
  filter(NMFS_interest==TRUE)

#Read in management groups
Areas <- read.csv("Monitoring Areas.csv", fileEncoding="UTF-8-BOM")


# read in the two GIS depth spreadsheets from Becky
GIS.depths <- readxl::read_xlsx("CCFRP_GIS_Depths.xlsx")
GIS.depths <- GIS.depths %>%
         mutate(
        Depth_2m = na_if(Depth_2m, -9999),
        Depth_90m = na_if(Depth_90m, -9999)
)

GIS.depths2m <- GIS.depths %>%
  dplyr::select(Drift_ID, Depth_2m, TYPE) %>%
  rename(Drift.ID = Drift_ID) %>%
  pivot_wider(names_from = TYPE, id_cols = Drift.ID, values_from = Depth_2m) %>%
  rename(Start2mDepth = START, End2mDepth = END)

GIS.depths90m <- GIS.depths %>%
  dplyr::select(Drift_ID, Depth_90m, TYPE) %>%
  rename(Drift.ID = Drift_ID) %>%
  pivot_wider(names_from = TYPE, id_cols = Drift.ID, values_from = Depth_90m) %>%
  rename(Start90mDepth = START, End90mDepth = END)
GIS.depths_all <- inner_join(GIS.depths2m, GIS.depths90m)  

# columns have spaces - remove all spaces here
trips <- trips %>% rename_all(make.names)
catches <- catches %>% rename_all(make.names)
drifts_all <- drifts_all %>% rename_all(make.names)

#Add species common names
catches <- left_join(catches, Species, by = 'Species.Code')
catches <- catches %>%
  filter(!is.na(Common.Name))

# select final columns from trip table
trips <- trips %>%
  dplyr::select(Trip.ID, Month, Day, Year.Automatic, Vessel) %>%
  rename(YEAR = Year.Automatic)
# join drifts and trip info
drifts_all <- left_join(drifts_all, trips)
drifts_all <- left_join(drifts_all, GIS.depths_all)


# Pull only relevent column names from the drifts
drifts <- drifts_all %>%
  dplyr::select(
    Drift.ID, Trip.ID, ID.Cell.per.Trip, Grid.Cell.ID,
    Site..MPA..REF., Drift.Time..hrs., Total...Anglers.Fishing,
    Start.Depth..ft., End.Depth..ft., Excluded.Drift.Comment,
    ST_LatDD, ST_LonDD, Month, Day, YEAR, Vessel,
    Start2mDepth, End2mDepth, Start90mDepth, End90mDepth
  ) %>%
  rename(SITE = Site..MPA..REF.)

# Need to change 7's to july and 8's to august
drifts$Month[drifts$Month == 7] <- "July"
drifts$Month[drifts$Month == 8] <- "August"

meters_to_feet <- function(x) (-x * 3.281)
drifts <- drifts %>%
  mutate_at(
    vars(Start2mDepth, End2mDepth, Start90mDepth, End90mDepth),
    meters_to_feet
  ) %>%
  rename( Start2mDepth_ft = Start2mDepth,
          End2mDepth_ft = End2mDepth,
          Start90mDepth_ft = Start90mDepth,
          End90mDepth_ft = End90mDepth)
    


# Collapse catches to drift level
#Target_catches <- subset(catches, Species.Code == ccfrp.species.code)
Drift_catches <- catches %>%
  group_by(Common.Name, Drift.ID) %>%
  tally()


# join drifts and catch info and calculate cpue
dat <- left_join(Drift_catches, drifts)
dat <- dat %>%
  mutate(Area.code = substring(Drift.ID, 1, 2)) %>%
  mutate(Effort = Total...Anglers.Fishing * Drift.Time..hrs.) %>%
  mutate(CPUE = n / Effort)

dat <- left_join(dat, Areas)

# fix two data entry errors
levels(dat$Grid.Cell.ID)[levels(dat$Grid.Cell.ID) == "Bl49"] <- "BL49"
levels(dat$Grid.Cell.ID)[levels(dat$Grid.Cell.ID) == "Bl51"] <- "BL51"

# drop cells marked as have the following last two character
#dat <- dat %>% filter(!(grepl("MM", .$Grid.Cell.ID) | grepl("RR", .$Grid.Cell.ID) |
#  grepl("MN", .$Grid.Cell.ID) | grepl("MO", .$Grid.Cell.ID)))

#dat <- droplevels(dat)


#-------------------------------------------------------------------------------
#Keep just Cal Poly sampled sites

dat <- dat %>%
  filter(Monitoring.Group=='Cal Poly')

#Remove just the areas not sampled consistently
#remove farralons, Point Conception,  trinidad, Laguna Beach, NA's 'BM" is data entry error
#Also remove all cells with MM and RR - defited outside either the reference area or MPA cells
cells_to_exclude <- c('MM', 'RR', 'MN', 'MO') 
dat <- dat %>%
  filter(!grepl(sprintf('(%s)$', 
                        paste0(cells_to_exclude, collapse = '|')), Grid.Cell.ID)) %>%
  filter(!grepl("Exclude|across|outside",Excluded.Drift.Comment)) %>%
  droplevels

#
# Just drift info up to 2018
drifts_final <- dat %>%
  filter(YEAR<2019,
         !is.na(ST_LonDD),
         !is.na(ST_LatDD)) %>%
  ungroup() %>%
  select(
    Drift.ID, Trip.ID, Grid.Cell.ID, SITE, Name, MPA.Designation, YEAR, Month, 
    Day, Start.Depth..ft., End.Depth..ft., Monitoring.Group,
    Start2mDepth_ft, End2mDepth_ft, Start90mDepth_ft, End90mDepth_ft
  ) %>%
  unique()

# lengths and then join to drift info
species_lengths <- catches %>%
  filter(!is.na(Length..cm.))
species_lengths <- inner_join(species_lengths, drifts_final)









# #-------------------------------------------------------------------------------
# # Fish time filter
# # Give drifts within a cell on the same day a drift number
# # See how many drifts and total fished time
# Time_cell_fished <- dat %>%
#   select(YEAR, Drift.ID, ID.Cell.per.Trip, Drift.Time..hrs.) %>%
#   unique() %>%
#   group_by(YEAR, ID.Cell.per.Trip) %>%
#   summarise(
#     num.drifts = n(),
#     tot_time = sum(Drift.Time..hrs.)
#   )
# # cells fished at least 2 minutes
# Drift_time_keep <- Time_cell_fished %>% filter(tot_time >= (10/60))
# 
# # Remove cells fished less tan a total of 15 minutes on a day
# dat_final <- dat %>%
#   filter(
#     ID.Cell.per.Trip %in% Drift_time_keep$ID.Cell.per.Trip)
# 
# 
# 


