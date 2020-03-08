wd = "C:\\Users\\b9930\\Google ¶³ºİµwºĞ\\publication\\compile_DATRAS\\"
setwd(wd)

source("processing_utils.R")


### parse long survey in the North Sea
# BTS: Beam Trawl Survey
data = "BTSdata"
survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
load(survey_path)

years = c(1987:2018)
quarters = c(3)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# NS-IBTS: North Sea International Bottom Trawl Survey for commercial fish
data = "NSIBTSdata"
survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
load(survey_path)

years = c(1991:2018)
quarters = c(1, 3)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# SNS: The Dutch Sole Net Survey
data = "SNSdata"
survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
load(survey_path)

years = c(2002:2018)
quarters = c(3)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))


### parse long survey outside the North Sea
# BITS: Baltic International Trawl Survey
data = "BITSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1991:2018)
quarters = c(1, 4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# DYFS: The Belgian Demersal Young Fish Survey
data = "DYFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2002:2018)
quarters = c(3, 4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# EVHOE: Bay of Biscay
data = "EVHOEdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1997:2018)
quarters = c(4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# FR-CGFS: Franch Channel Ground Fish Survey
data = "FRCGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2006:2018)
quarters = c(4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# IE-IGFS: Irish Ground Fish Survey
data = "IEIGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2003:2018)
quarters = c(4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# NIGFS: Northern Irland Survey
data = "NIGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2008:2018)
quarters = c(1, 4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# PT-IBTS: Portuguese Surveys
data = "PTIBTSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2002:2018)
quarters = c(4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# SCOWCGFS: Scottish West Coast Groundfish Survey
data = "SCOWCGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2011:2018)
quarters = c(1, 4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# SP-ARSA: Spanish Gulf of Cadiz Bottom Trawl Survey
data = "SPARSAdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2003:2018)
quarters = c(1, 4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# SP-NORTH: Spanish North Coast Bottom Trawl Survey
data = "SPNORTHdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1991:2018)
quarters = c(4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# SP-PORC: Spanish Porcupine Bottom Trawl Survey
data = "SPPORCdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2001:2018)
quarters = c(3)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))

# SWC-IBTS: Scottish West Coast Bottom Trawl Survey
data = "SWCIBTSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1986:2018)
quarters = c(1, 4)

parse_survey(data, years, quarters)
rm(list=c(data, data_list))



### Appendix

