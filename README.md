# Causal effects of population dynamics and environmental changes on spatial variability of marine fishes

This repository is an implementaion for parsing all surveys in the Database of Trawl Surveys (DATRAS) from the International Council for the Exploration of the Sea (ICES) for research work **Causal effects of population dynamics and environmental changes on spatial variability of marine fishes.** 

- For readers who want to quickly parse surveys, please refer to **Quickly Getting Started**. 
- For readers who want to parse surveys from scratch, please refer to **Step by Step Analysis**.

The repository contains:
* Source code for parsing surveys
* Raw data downloaded from DATRAS via the R-package ```icesDatras``` (https://github.com/ices-tools-prod/icesDatras) provided by ICES.
* Compiled species code defined in ICES

# Requirements 
R program with version 3.5.0. R is a free software and publicly available at https://www.r-project.org/. To install R, please follow procedures below:
1. Choose an CRAN Mirrors 
2. Choose your operating system
3. Download binaries for base distribution
4. Install R accordingly

Previous versions are available at https://cran.r-project.org/bin/windows/base/old/. All R-packages and the corresponding versions used in this study are listed below:

* icesDatras 1.3-0

# Quickly Getting Started
1. Open ```parse_survey.r``` in R, and set the working directory ```wd``` to the path where you save the repository.

2. Run code in each survey block in `parse_survey.r`. For example, the following code block is for parsing Baltic International Trawl Survey (BITS). 

    ```
    # BITS: Baltic International Trawl Survey
    data = "BITSdata"
    survey_path = paste0(file.path(wd, "survey_outside_north_sea", data), ".RData")
    load(survey_path)
    
    years = c(1991:2018)
    quarters = c(1, 4)
    
    parse_survey(data, years, quarters)
    rm(list=c(data, data_list))
    ```

    After running the code, a csv file (```survey_name.csv```) will be generated and saved in the repository. This ```.csv``` file summarizes time series data of each species in the survey. We will then filter species and surveys based on these ```.csv``` files.

    We already provided all generated ```.csv``` file for each survey. Please check it in directory ```survey_stat```.

# Step by Step Analysis
1. Use template code in `download_survey.R` to overview surveys in DATRAS.

2. Use template code in `download_survey.R` to download age surveys data in DATRAS. 

    Please save survey data in directory `survey_north_sea` and `survey_outside_north_sea` accordingly.

3. Open `parse_species_code.r` in R, and set the working directory `wd` to the path where you save the repository.

4. Run `parse_species_code.R` to compile species code defined by ICES in each survey.

    We have compiled a species-name chart (`Species code.csv`) to facilitate transformation of species code to Latin name and common name. 

5. Open `parse_survey.r` in R, and set the working directory `wd` to the path where you save the repository.

6. Run code in each survey block in `parse_survey.r` as described in **Quickly Getting Started** above.

# Contact
If you find any bugs or have any questions about the implementation, pelease contact us via r03241220@ntu.edu.tw
