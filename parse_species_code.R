wd = "C:\\Users\\b9930\\Google ¶³ºÝµwºÐ\\publication\\compile_DATRAS\\"
setwd(wd)

spec_code = data.frame(matrix(nrow=0, ncol=3))
colnames(spec_code) = c("SpecCodeType", "SpecCode", "survey")


### util functions
get_unique_spec_code = function(survey){
    spec_code = unique(subset(get(survey), select=c(SpecCodeType, SpecCode)))
    spec_code["Survey"] = survey
    return(spec_code)
}


### long survey in the North Sea
# BTS: Beam Trawl Survey
# NS-IBTS: North Sea International Bottom Trawl Survey for commercial fish
# SNS: The Dutch Sole Net Survey

survey_north_sea = c("BTSdata", "NSIBTSdata", "SNSdata")
for (data in survey_north_sea){
    survey_path = paste0(file.path(wd, "survey_north_sea", data), ".RData")
    load(survey_path)
    spec_code = rbind(spec_code, get_unique_spec_code(data))
    rm(list=data)
}


### long survey outside the North Sea
# BITS: Baltic International Trawl Survey
# DYFS: The Belgian Demersal Young Fish Survey
# EVHOE: Bay of Biscay
# FR-CGFS: Franch Channel Ground Fish Survey
# IE-IGFS: Irish Ground Fish Survey
# NIGFS: Northern Irland Survey
# PT-IBTS: Portuguese Surveys
# SCOWCGFS: Scottish West Coast Groundfish Survey
# SP-ARSA: Spanish Gulf of Cadiz Bottom Trawl Survey
# SP-NORTH: Spanish North Coast Bottom Trawl Survey
# SP-PORC: Spanish Porcupine Bottom Trawl Survey
# SWC-IBTS: Scottish West Coast Bottom Trawl Survey

survey_outside_north_sea = c("BITSdata", "DYFSdata", "EVHOEdata", "FRCGFSdata",
                             "IEIGFSdata", "NIGFSdata", "PTIBTSdata", "SCOWCGFSdata",
                             "SPARSAdata", "SPNORTHdata", "SPPORCdata", "SWCIBTSdata")
for (data in survey_outside_north_sea){
    survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
    load(survey_path)
    spec_code = rbind(spec_code, get_unique_spec_code(data))
    rm(list=data)
}

rownames(spec_code) = NULL
write.csv(spec_code, "spec_code.csv", row.names=FALSE)

# remove duplicate
row_to_keep = !duplicated(subset(spec_code, select=c(SpecCodeType, SpecCode)))
spec_code = spec_code[row_to_keep, ]

# compared to compiled species code
compiled_spec_code = read.csv("Species code.csv")
spec_code["Name"] = NA
spec_code["CommonName"] = NA

for (i in 1:dim(spec_code)[1]){
    if (spec_code$SpecCode[i] %in% compiled_spec_code$Code){
        idx = which(spec_code$SpecCode[i] == compiled_spec_code$Code)
        spec_name = as.character(compiled_spec_code[idx, "Species.name"])
        common_name = as.character(compiled_spec_code[idx, "Common.name"])
        spec_code[i, c("Name", "CommonName")] = c(spec_name, common_name)
    } else {
        spec_code[i, c("Name", "CommonName")] = c(NA, NA)
    }
}

write.csv(spec_code, "spec_code_compiled.csv", row.names=FALSE)


