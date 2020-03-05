wd = "C:/Users/b9930/Google ¶³ºÝµwºÐ/publication/compile_DATRAS"
setwd(wd)

spec_code_compiled = read.csv("spec_code_compiled_fill.csv")


### utility function
# function to parse surveys and save output
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

# function to split data by gear
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

# function to compute time series length for each species in the survey
compute_length_for_each_sp = function(survey, years, quarters){
  time_point_species = summarize_time_point(data=get(survey), years=years, quarters=quarters)
  
  spec_stat = data.frame(matrix(nrow=0, ncol=5))
  colnames(spec_stat) = c("spec_code_type", "spec_code", "name", "n", "end_time")
  for (spec_name in names(time_point_species)){
    time_point = time_point_species[[spec_name]]
    spec_code_type = unique(time_point$spec_code_type)
    spec_code = unique(time_point$spec_code)
    n = max(time_point$counts)
    end_time = time_point$time_point[max(which(time_point$counts == n))]
    spec_stat = rbind(spec_stat, 
                      data.frame(spec_code_type, spec_code, spec_name, n, end_time))
  }
  return(spec_stat)
}

# summarize time series
summarize_time_point = function(data, years, quarters){
  # convert species code to species name
  data$SpecName = NA
  for (x in unique(data$SpecCode)){
    idx = which(x == spec_code_compiled$SpecCode)
    if (length(idx) > 0){
      data$SpecName[which(data$SpecCode == x)] = as.character(spec_code_compiled$Name[idx])
    } else {
      data$SpecName[which(data$SpecCode == x)] = x
    }
  }
  
  data_species = split(data, f=data$SpecName)
  
  time_point = lapply(data_species, FUN=function(x, yr=years, quar=quarters){
    time_point = check_missing_time(x$Year, x$Quarter, yr, quar)
    counts = check_continuous(time_point)
    spec_code_type = paste0(unique(x$SpecCodeType), ";", collapse="")
    spec_code = paste0(unique(x$SpecCode), ";", collapse="")
    return(data.frame(time_point, counts, spec_code_type, spec_code))
  })
  return(time_point)
}
#time_point_species = summarize_time_point(data=get(data), years=years, quarters=quarters)

# function to check missing time point
check_missing_time = function(data_years, data_quarters, years, quarters){
  num_quarter = length(quarters)
  
  time_point = paste(rep(years, each=num_quarter), quarters, sep="Q")
  data_time_point = unique(paste(data_years, data_quarters, sep="Q"))
  
  for (i in 1:length(time_point)){
    if (!time_point[i] %in% data_time_point){
      time_point[i] = NA
    }
  }
  return(time_point)
}
#time_point = check_missing_time(get(data)$Year, get(data)$Quarter, c(1991:2018), c(1,4))

# function to check if time series is continuous
check_continuous = function(time_series){
  counts = 1
  for (i in 2:length(time_series)){
    if (is.na(time_series[i])){
      counts[i] = 0
    } else {
      counts[i] = counts[i-1] + 1
    }
  }
  return(counts)
}
#check_continuous(time_point)

