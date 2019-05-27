
library(shiny)
library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)


mergedf6.6<-read.csv("./mergedf6.6.csv")
table(mergedf6.6$`Project Type`)

mergedf6.6 <- rename(mergedf6.6, "Offset.Project Operator" = "Offset.Project.Operator")
mergedf6.6 <- rename(mergedf6.6, "Offset Designation" = "Offset.Designation")
mergedf6.6 <- rename(mergedf6.6, "Number of Offsets Unretired (Estimated as of 12/18)" = "Number.of.Offsets.Un.retired..Estimated..as.of.Dec..2018.")
mergedf6.6 <- rename(mergedf6.6, "Percent of Offsets Sold (Estimated as of 12/18)" = "Percent.of.Offsets.Sold..Estimated..as.of.Dec..2018.")
mergedf6.6 <- rename(mergedf6.6, "Type of Protocol" = "Type.of.Protocol")
mergedf6.6 <- rename(mergedf6.6, "Invalidation Period End Date" = "Invalidation.Period.End.Date")
mergedf6.6 <- rename(mergedf6.6, "Offsets Issued" = "Offsets.issued")
mergedf6.6 <- rename(mergedf6.6, "Project Type" = "Project.Type")

mergedf6.6$`Project Type`[mergedf6.6$`Project Type` == "U.S Forest" ] <- "U.S. Forest"

mergedf6.6$Vintage.Year <- as.character(mergedf6.6$Vintage.Year)
mergedf6.6$`Offset Designation` <- as.character(mergedf6.6$`Offset Designation`)
mergedf6.6$`Offset.Project Operator` <- as.character(mergedf6.6$`Offset.Project Operator`)
mergedf6.6$`Project Type` <- as.character(mergedf6.6$`Project Type`)

devnames <- unique(mergedf6.6$`Offset.Project Operator`)
protnames <- unique(mergedf6.6$`Project Type`)
desnamesnames <- unique(mergedf6.6$`Offset Designation`)
vintnames <- unique(mergedf6.6$Vintage.Year)

mergedf6.6$X <- NULL
