wd = "C:/Users/b9930/Google ¶³ºİµwºĞ/publication/compile_DATRAS"
setwd(wd)

source("processing_utils.R")


### parse long survey in the North Sea
# please run util functions in the end of the script
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
# util function
parse_survey = function(survey, years, quarters){
    data_list <<- split_data_by_gear(survey)
    
    spec_stat = data.frame(matrix(nrow=0, ncol=6))
    colnames(spec_stat) = c("spec_code_type", "spec_code", "name", "n", "end_time", "gear")
    for (data_name in data_list){
        temp_spec_stat = compute_length_for_each_sp(data_name, years=years, quarters=quarters)
        temp_spec_stat$gear = strsplit(data_name, split="_")[[1]][2]
        spec_stat = rbind(spec_stat, temp_spec_stat)
    }
    write.csv(spec_stat, file=paste0(survey, '.csv'))
}

split_data_by_gear = function(data_name){
    data = get(data_name)
    data_gear = split(data, f=data$Gear)
    
    data_list = c()
    for (gear_name in names(data_gear)){
        data_gear_name = paste(data_name, gear_name, sep="_")
        assign(data_gear_name, 
               data_gear[[gear_name]],
               envir = .GlobalEnv)
        data_list = c(data_list, data_gear_name)
    }
    return(data_list)
}


## testing code
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