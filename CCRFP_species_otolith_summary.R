#########################################################################
### CCFRP species counts by program for otolith request for the
### 2022 fishing season
### Melissa Monk
#########################################################################
rm(list = ls(all = TRUE))
graphics.off()

library(RColorBrewer)
library(dplyr)
library(tidyr)
library(ggplot2)

setwd("C:/CCFRP/CCFRP_2007-2020_Database")

#-------------------------------------------------------------------------------
# Read in data and basic cleanup
# Eventually open these directly in access, but it's not behaving
# Extract excel files from the Access database
# read in trip data
trips <- readxl::read_xlsx("C:/CCFRP/CCFRP_2007-2020_Database/Trip.xlsx")
# read in drift data
drifts_all <- readxl::read_xlsx("C:/CCFRP/CCFRP_2007-2020_Database/Drift.xlsx")
# read in catch data
catches <- readxl::read_xlsx("C:/CCFRP/CCFRP_2007-2020_Database/Catch.xlsx")

#Species lookup
Species <- readxl::read_xlsx(("C:/CCFRP/CCFRP_2007-2020_Database/FishSpecies.xlsx"))
Species <- Species %>%
  rename(Species.Code = `Species Code`,
         Common.Name = `Common Name`) %>%
  select(Species.Code, Common.Name, Rockfish)

# read in the two GIS depth spreadsheets from Becky
GIS.start.depth <- readxl::read_xlsx("C:/CCFRP/CCFRP_2007-2020_Database/CCFRP_Start_GIS_Depths.xlsx")
GIS.end.depth <- readxl::read_xlsx("C:/CCFRP/CCFRP_2007-2020_Database/CCFRP_End_GIS_Depths.xlsx")

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
  mutate(AREA = substring(Drift.ID, 1, 2)) %>%
  mutate(Effort = Total...Anglers.Fishing * Drift.Time..hrs.) %>%
  mutate(CPUE = n / Effort)

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

dat$AREA <- factor(dat$AREA, levels = c("CM", "TM", "SP", "BH", "AN", "PL", "BL", "PB", "AI", "CP", "SW", "LB", "LJ", 
                      "BM", "FN", "TD" ,"PC")) #these are not in order but get removed
 
# List of AREAs to drop
# TD, Trinidad - no mpa
# FN, farallons, samples only 2 years
# PC - error?
dat <- dat %>%
  filter(!(AREA %in% c("FN", "PC", "BM", NA))) %>%
  droplevels

with(dat, table(AREA))


# tally the number of drifts in a grid cell
grid_cells_per_AREA <- dat %>%
  group_by(AREA, Grid.Cell.ID) %>%
  tally()



#-------------------------------------------------------------------------------
# Fish time filter
# Give drifts within a cell on the same day a drift number
# See how many drifts and total fished time
Num_drifts_fished <- dat %>%
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

#Subset to just Reference areas since we can't take otoliths from MPAs

dat <- subset(dat, SITE == 'REF')


## Raw cpue
avg.cpue <- dat %>%
  group_by(Common.Name) %>%
  summarise(avg.cpue = mean(CPUE),
            total = sum(n))
write.csv(avg.cpue,"avg.cpue.csv")

# Plot the average cpue by year and reef
# gg4 <- ggplot(aes(YEAR, avg.cpue, colour = as.factor(AREA)), data = avg.cpue.AREA) +
#   geom_line(lwd = 1.05) +
#   theme_bw() +
#   labs(
#     colour = "Area",
#     x = "Year",
#     y = "Raw average CPUE"
#   )
# gg4
# ggsave(paste0(out.dir, "/Average CPUE by Year and SITE.png"),
#   width = 6, height = 4,
#   units = "in"
# )

