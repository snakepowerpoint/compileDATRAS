wd = "C:/DATRAS_compile"
setwd(wd)

source("processing_utils.R")


### parse long survey in the North Sea
# BTS: Beam Trawl Survey
data = "BTSdata"
survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
load(survey_path)

years = c(1987:2018)
quarters = c(3)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# NS-IBTS: North Sea International Bottom Trawl Survey for commercial fish
data = "NSIBTSdata"
survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
load(survey_path)

years = c(1991:2018)
quarters = c(1, 3)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# SNS: The Dutch Sole Net Survey
data = "SNSdata"
survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
load(survey_path)

years = c(2002:2018)
quarters = c(3)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)


### parse long survey outside the North Sea
# BITS: Baltic International Trawl Survey
data = "BITSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1991:2018)
quarters = c(1, 4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# DYFS: The Belgian Demersal Young Fish Survey
data = "DYFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2002:2018)
quarters = c(3, 4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# EVHOE: Bay of Biscay
data = "EVHOEdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1997:2018)
quarters = c(4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# FR-CGFS: Franch Channel Ground Fish Survey
data = "FRCGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2006:2018)
quarters = c(4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# IE-IGFS: Irish Ground Fish Survey
data = "IEIGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2003:2018)
quarters = c(4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# NIGFS: Northern Irland Survey
data = "NIGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2008:2018)
quarters = c(1, 4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# PT-IBTS: Portuguese Surveys
data = "PTIBTSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2002:2018)
quarters = c(4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# SCOWCGFS: Scottish West Coast Groundfish Survey
data = "SCOWCGFSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2011:2018)
quarters = c(1, 4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# SP-ARSA: Spanish Gulf of Cadiz Bottom Trawl Survey
data = "SPARSAdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2003:2018)
quarters = c(1, 4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# SP-NORTH: Spanish North Coast Bottom Trawl Survey
data = "SPNORTHdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1991:2018)
quarters = c(4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# SP-PORC: Spanish Porcupine Bottom Trawl Survey
data = "SPPORCdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(2001:2018)
quarters = c(3)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)

# SWC-IBTS: Scottish West Coast Bottom Trawl Survey
data = "SWCIBTSdata"
survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
load(survey_path)

years = c(1986:2018)
quarters = c(1, 4)
compute_length_for_each_sp(survey=data, years=years, quarters=quarters)
rm(list=data)


### Appendix (test code)
time_point_species = summarize_time_point(data=get(data), years=years, quarters=quarters)
(test = time_point_species[[1]])

spec_stat = data.frame(matrix(nrow=0, ncol=3))
colnames(spec_stat) = c("spec_code_type", "spec_code", "n")
for (spec_code in names(time_point_species)){
    time_point = time_point_species[[spec_code]]
    spec_code_type = unique(time_point$spec_code_type)
    n = max(time_point$counts)
    spec_stat = rbind(spec_stat, data.frame(spec_code_type, spec_code, n))
}
spec_stat

write.csv(spec_stat, file=paste0(data, '.csv'))