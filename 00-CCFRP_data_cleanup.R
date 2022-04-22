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
GIS.start.depth <- readxl::read_xlsx("CCFRP_Start_GIS_Depths.xlsx")
GIS.end.depth <- readxl::read_xlsx("CCFRP_End_GIS_Depths.xlsx")

# columns have spaces - remove all spaces here
trips <- trips %>% rename_all(make.names)
catches <- catches %>% rename_all(make.names)
drifts_all <- drifts_all %>% rename_all(make.names)

#Add species common names
catches <- left_join(catches, Species, by = 'Species.Code')
catches <- catches %>%
  filter(!is.na(Common.Name))

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
  rename(SITE = Site..MPA..REF.)

# Need to change 7's to july and 8's to august
drifts$Month[drifts$Month == 7] <- "July"
drifts$Month[drifts$Month == 8] <- "August"

meters_to_feet <- function(x) (-x * 3.281)
drifts <- drifts %>%
  mutate_at(
    vars(SDepth2mRes, EDepth2mRes, SDepth90mRes, EDepth90mRes),
    meters_to_feet
  ) %>%
  rename( StartGISDepth2mRes_ft = SDepth2mRes,
          EndGISDepth2mRes_ft = EDepth2mRes,
          StartGISDepth90mRes_ft = SDepth90mRes,
          EndGISDepth90mRes_ft = EDepth90mRes)
    


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
# AREA filters

area_counts <- dat %>%
  ungroup() %>%
  select(Trip.ID, YEAR, Name) %>%
  unique() %>%
  group_by(YEAR, Name) %>%
  tally() %>%
  pivot_wider(names_from = Name, values_from = n)

cell_counts <- dat %>%
  ungroup() %>%
  select(Trip.ID, YEAR, Grid.Cell.ID) %>%
  unique() %>%
  group_by(YEAR, Grid.Cell.ID) %>%
  tally() %>%
  pivot_wider(names_from = Grid.Cell.ID, values_from = n)

#Remove just the areas not sampled consistently
#remove farralons, Point Conception,  trinidad, Laguna Beach, NA's 'BM" is data entry error
#Also remove all cells with MM and RR - defited outside either the reference area or MPA cells
cells_to_exclude <- c('MM', 'RR', 'MN', 'MO') 
dat <- dat %>%
  filter(!(Area.code %in% c("FN", "PC", "BM", "LB", "TD", NA))) %>% 
  filter(!grepl(sprintf('(%s)$', 
                        paste0(cells_to_exclude, collapse = '|')), Grid.Cell.ID)) %>%
  filter(!grepl("Exclude|across|outside",Excluded.Drift.Comment)) %>%
  droplevels

with(dat, table(Area.code))

#-------------------------------------------------------------------------------
# Fish time filter
# Give drifts within a cell on the same day a drift number
# See how many drifts and total fished time
Time_cell_fished <- dat %>%
  select(YEAR, Drift.ID, ID.Cell.per.Trip, Drift.Time..hrs.) %>%
  unique() %>%
  group_by(YEAR, ID.Cell.per.Trip) %>%
  summarise(
    num.drifts = n(),
    tot_time = sum(Drift.Time..hrs.)
  )
# cells fished at least 2 minutes
Drift_time_keep <- Time_cell_fished %>% filter(tot_time >= (10/60))

# Remove cells fished less tan a total of 15 minutes on a day
dat_final <- dat %>%
  filter(
    ID.Cell.per.Trip %in% Drift_time_keep$ID.Cell.per.Trip)



# Save
save.image(file = "CCFRP_cleanedup.RData")

