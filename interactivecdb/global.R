library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)
library(scales)
library(fuzzyjoin)
library(shinycssloaders)
library(ggmap)
library(tidyverse)
library(dplyr)
library(plotly)
library(leaflet)
library(viridis)
library(readxl)
library(lubridate)
getwd()

newoperatorandurllookup <- read.csv("./Data/newoperatorandurllookup.csv")


temp.file <- paste(tempfile(),".xlsx",sep = "")
download.file("https://ww3.arb.ca.gov/cc/capandtrade/offsets/issuance/arboc_issuance.xlsx", temp.file, mode = "wb")

offsetscomplete <- read_excel(temp.file, sheet = "ARB Offset Credit Issuance")

offsets<- offsetscomplete

offsets$`Issuance Date` <- as.numeric(as.character(offsets$`Issuance Date`))
offsets$`Issuance Date`<- format(as.Date(offsets$`Issuance Date`, "1899-12-30"), "%Y-%m-%d")

offsets$`Start of Invalidation Timeframe` <- as.numeric(as.character(offsets$`Start of Invalidation Timeframe`))
offsets$`Start of Invalidation Timeframe`<- format(as.Date(offsets$`Start of Invalidation Timeframe`, "1899-12-30"), "%Y-%m-%d")

offsets <- rename(offsets, "Project ID" = "CARB Issuance ID")
offsets <- rename(offsets, "Project Name" = "Offset Project Name")
offsets <- rename(offsets, "Offsets Issued" = "ARB Offset Credits Issued")
offsets <- rename(offsets, "Vintage.Year" = "Vintage")
offsets <- rename(offsets, "Offset Designation" = "Invalidation Timeframe")
offsets <- rename(offsets, "Type of Protocol" = "Early Action/ Compliance")
offsets <- rename(offsets, "Invalidation Start" = "Start of Invalidation Timeframe")
offsets <- rename(offsets, "Project.Documentation" = "Project Documentation")

offsets$`Forest Buffer Account Contribution`[offsets$`Forest Buffer Account Contribution` == "n/a"] <- "0"

offsets$offsetsretired <-  (as.numeric(offsets$`Retired Voluntarily`) + as.numeric(offsets$`Forest Buffer Account Contribution`) + as.numeric(offsets$`Retired 1st Compliance Period (CA)`) + as.numeric(offsets$`Retired 2nd Compliance Period (CA)`) + as.numeric(offsets$`Retired for Compliance in Quebec`))

offsets$`Number of Offsets Un-retired (Estimated as of Dec. 2018)` <-as.numeric(offsets$`Offsets Issued`) -  (offsets$`Retired Voluntarily` + as.numeric(offsets$`Forest Buffer Account Contribution`) + offsets$`Retired 1st Compliance Period (CA)` + offsets$`Retired 2nd Compliance Period (CA)` + offsets$`Retired for Compliance in Quebec`)
offsets$`Percent of Offsets Sold (Estimated as of Dec. 2018)` <- offsets$`Number of Offsets Un-retired (Estimated as of Dec. 2018)` / (as.numeric(offsets$`Offsets Issued`) - as.numeric(offsets$`Forest Buffer Account Contribution`))


offsets <- offsets %>% select(`Project ID`, `Project Type`, `Offset Project Operator`, `Project Name`, `Offsets Issued`, `Offset Designation`,
                              `Number of Offsets Un-retired (Estimated as of Dec. 2018)`, `Percent of Offsets Sold (Estimated as of Dec. 2018)`, 
                              `Vintage.Year`, `Invalidation Start`, `Issuance Date`, Project.Documentation, State)

offsets$`Offsets Issued` <- as.numeric(offsets$`Offsets Issued`)


offsets <- rename(offsets, "Vintage Year" = "Vintage.Year")

offsets$`Project Name`[offsets$`Project Name` == "Finite Carbon –"] <- ""
offsets$`Project Type`[offsets$`Project Type` == "U.S Forest" ] <- "U.S. Forest"

offsets$`Vintage Year` <- as.character(offsets$`Vintage Year`)
offsets$`Offset Designation` <- as.character(offsets$`Offset Designation`)
offsets$`Offset Project Operator` <- as.character(offsets$`Offset Project Operator`)
offsets$`Project Type` <- as.character(offsets$`Project Type`)

offsets <- subset(offsets, !is.na(`Offset Designation`))

offsets$X <- NULL

offsets$`Invalidation Period End Date` <- NULL
offsets$`Type of Protocol` <- NULL


offsets <- rename(offsets, "Project.Name" = "Project Name")

offsets <- rename(offsets, "Project.Type" = "Project Type")
offsets <- rename(offsets, "Offset.Project.Operator" = "Offset Project Operator")


names(newoperatorandurllookup)


offsets$Offset.Project.Operator <- str_replace_all(offsets$Offset.Project.Operator, "[^[:alnum:]]", " ")
offsets$Project.Name <- str_replace_all(offsets$Project.Name, "[^[:alnum:]]", " ")

newoperatorandurllookup$Offset.Project.Operator <- str_replace_all(newoperatorandurllookup$Offset.Project.Operator, "[^[:alnum:]]", " ")
newoperatorandurllookup$Project.Name  <- str_replace_all(newoperatorandurllookup$Project.Name, "[^[:alnum:]]", " ")

offsets2 <- merge(offsets, newoperatorandurllookup, by = c("Offset.Project.Operator", "Project.Name"), all.x = TRUE)



offsets2$X <- NULL
offsets2$X.1 <- NULL
offsets2$tot <- NULL
offsets2$State.x <- NULL
offsets2$State.y <- NULL

offsets2$`Offset.Project.Operator` <- offsets2$Project.Owner
offsets2$`Offset.Project Operator` <- NULL
offsets2$Project.Owner <- NULL

offsets2 <- rename(offsets2, "Project Type" = "Project.Type.x")
offsets2$Offset.Project.Operator <- replace(offsets2$Offset.Project.Operator, offsets2$Offset.Project.Operator == "A-Gas", "A Gas")
offsets2$State[offsets2$State == 0] <- "Unknown"

offsets2$State2 <- as.character(offsets2$State2)
locationtable <- offsets2 %>% select(`Offsets Issued`, `Vintage Year`, State2) %>% group_by(State2, `Vintage Year`) %>% summarise(issues =sum(`Offsets Issued`))

locationtable$Percent <- locationtable$issues / sum(locationtable$issues)

substring(offsets2$Project.Documentation, 4)

offsets2$Registry <- substring(offsets2$Project.Documentation, 1, 3)

offsets2$`View Documentation` <- ifelse((offsets2$Registry == "ACR"),
                                          paste0("https://acr2.apx.com/mymodule/reg/prjView.asp?id1=", substring(offsets2$Project.Documentation, 4)), 
                                          ifelse((offsets2$Registry =="CAR"), paste0("https://thereserve2.apx.com/mymodule/reg/prjView.asp?id1=", substring(offsets2$Project.Documentation, 4)), paste0("https://www.vcsprojectdatabase.org/#/home")))
offsets2 <- subset(offsets2, !is.na(Offset.Project.Operator))

offsets2 <- subset(offsets2, `Offsets Issued` != "NA")
offsets2 <- subset(offsets2, `Offset.Project.Operator` != "")

offsets2$Registry <- NULL

offsets2 <- rename(offsets2, "Project Name" = "Project.Name")
offsets2 <- rename(offsets2, "Offset Project Operator" = "Offset.Project.Operator")
offsets2 <- rename(offsets2, "Invalidation Length" = "Offset Designation")

offsets2$`Invalidation Length`[offsets2$`Invalidation Length` == "INVALIDATED"] <- "Invalidated"

offsets2$`Vintage Year` <- as.numeric(offsets2$`Vintage Year`)

offsets2$`Offset Project Operator` <- as.character(offsets2$`Offset Project Operator`)
devnames <- unique(offsets2$`Offset Project Operator`)
protnames <- unique(offsets2$`Project Type`)
desnamesnames <- unique(offsets2$`Invalidation Length`)
vintnames <- unique(offsets2$`Vintage Year`)

offsets2$`Percent of Offsets Sold (Estimated as of Dec. 2018)` <- percent(offsets2$`Percent of Offsets Sold (Estimated as of Dec. 2018)`)

vintnames <- vintnames[order(-vintnames)]

offsets2$State <- offsets2$State2

offsets2$Registry <- ifelse(startsWith(offsets2$Project.Documentation, "https://acr"), "American Carbon Registry",
                            ifelse(startsWith(offsets2$Project.Documentation, "https://thereserve"), "Climate Action Reserve", "Verra"))

registrynames <- unique(offsets2$Registry)

