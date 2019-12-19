library(icesDatras)


##### Surveys
#?icesDatras
#getSurveyList()

# BITS: Baltic International Trawl Survey (V)
# BTS: Beam Trawl Survey      (O)
# BTS-GSA17: Beam Trawl Survey - Adriatic Sea
# BTS-VIII: Bay of Biscay
# DWS: Central North-East Atlantic Deep Water Survey
# DYFS: The Belgian Demersal Young Fish Survey
# EVHOE: Bay of Biscay
# FR-CGFS: Franch Channel Ground Fish Survey (X... but may be)
# IE-IGFS: Irish Ground Fish Survey
# IS-IDPS: International Deep Pelagic Ecosystem Survey in the Irminger Sea
# NIGFS: Northern Irland Survey
# NS-IBTS: North Sea International Bottom Trawl Survey for commercial fish (O)
# NS-IDPS: Norwegian Sea International Deep Pelagic Survey
# PT-IBTS: Portuguese Surveys
# ROCKALL: Rockall
# SCOROC: Scottish rockall survey
# SCOWCGFS: Scottish West Coast Groundfish Survey
# SNS: The Dutch Sole Net Survey (O)
# SP-ARSA: Spanish Gulf of Cadiz Bottom Trawl Survey
# SP-NORTH: Spanish North Coast Bottom Trawl Survey
# SP-PORC: Spanish Porcupine Bottom Trawl Survey
# SWC-IBTS: Scottish West Coast Bottom Trawl Survey


### Overview
getDatrasDataOverview(surveys='BITS')  # 1991-2019 Q1 & 4 (n=58)
getDatrasDataOverview(surveys='BTS')  # 1987-2019 Q3 (n=33) (O)
getDatrasDataOverview(surveys='BTS-GSA17')  # 2016-2018 Q4
getDatrasDataOverview(surveys='BTS-VIII')  # 2011-2018 Q4
getDatrasDataOverview(surveys='DWS')  # 2006-2009 Q3 or 4
getDatrasDataOverview(surveys='DYFS')  # 2002-2018 Q3-4 (n=34)
getDatrasDataOverview(surveys='EVHOE')  # 1997-2018 Q4 (n=22)
getDatrasDataOverview(surveys='FR-CGFS')  # 1988-2018 Q4 (n=31)
getDatrasDataOverview(surveys='IE-IGFS')  #  2003-2018 Q4 (n=16)
getDatrasDataOverview(surveys='IS-IDPS')  # 2009 Q3
getDatrasDataOverview(surveys='NIGFS')  # 2005-2018 Q1 & 4 (n=28)
getDatrasDataOverview(surveys='NS-IBTS')  # 1965-2019 Q1 & 3 (O)
getDatrasDataOverview(surveys='NS-IDPS')  # 2009, 2013, 2016 Q3
getDatrasDataOverview(surveys='PT-IBTS')  # 2002-2017 Q4 (n=15)
getDatrasDataOverview(surveys='ROCKALL')  # 1999-(break)-2009 Q3
getDatrasDataOverview(surveys='SCOROC')  # 2011-2018 Q3
getDatrasDataOverview(surveys='SCOWCGFS')  # 2011-2019 Q1 & 4 (n=17)
getDatrasDataOverview(surveys='SNS')  # 2002-2018 Q3 (n=16) (O)
getDatrasDataOverview(surveys='SP-ARSA')  # 1996, 2000-2018 Q1 & 4 (n=38, with some breaks)
getDatrasDataOverview(surveys='SP-NORTH')  # 1990-2018 Q4 (n=28)
getDatrasDataOverview(surveys='SP-PORC')  # 2001-2018 Q3 (n=18)
getDatrasDataOverview(surveys='SWC-IBTS')  # 1990-2010 Q1 & 4 (n=42, 1985-1989 Q1)


### Long survey in the North Sea
BTSdata <- getDATRAS(record="CA", survey="BTS", years=1987:2018, quarters=1:4)
NSIBTSdata <- getDATRAS(record="CA", survey="NS-IBTS", years=1965:2018, quarters=1:4)
SNSdata = getDATRAS(record='CA', survey='SNS', years=2002:2018, quarters=1:4)


### Long survey not in the North Sea
BITSdata <- getDATRAS(record="CA", survey="BITS", years=1991:2018, quarters=1:4)
DYFSdata <- getDATRAS(record="CA", survey="DYFS", years=1991:2018, quarters=1:4)
EVHOEdata <- getDATRAS(record="CA", survey="EVHOE", years=1997:2018, quarters=1:4)
FRCGFSdata <- getDATRAS(record="CA", survey="FR-CGFS", years=1988:2018, quarters=1:4)
IEIGFSdata <- getDATRAS(record="CA", survey="IE-IGFS", years=2003:2018, quarters=1:4)
NIGFSdata <- getDATRAS(record="CA", survey="NIGFS", years=2005:2018, quarters=1:4)
PTIBTSdata = getDATRAS(record='CA', survey='PT-IBTS', years=2002:2018, quarters=1:4)
SCOWCGFSdata = getDATRAS(record='CA', survey='SCOWCGFS', years=2011:2018, quarters=1:4)
SPARSAdata = getDATRAS(record='CA', survey='SP-ARSA', years=1996:2018, quarters=1:4)
SPNORTHdata = getDATRAS(record='CA', survey='SP-NORTH', years=1990:2018, quarters=1:4)
SPPORCdata = getDATRAS(record='CA', survey='SP-PORC', years=2001:2018, quarters=1:4)
SWCIBTSdata = getDATRAS(record='CA', survey='SWC-IBTS', years=1985:2018, quarters=1:4)

