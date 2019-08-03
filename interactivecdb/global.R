
library(shiny)
library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)
library(scales)
library(fuzzyjoin)
#install.packages("shinycssloaders")
library(shinycssloaders)
getwd()

#write.csv(mergedf6.6, file = "./interactivecdb/Data/mergedf6.6.csv")

#mergedf6.6 <-read.csv("./interactivecdb/Data/mergedf6.6.csv")
mergedf6.6 <-read.csv("./Data/mergedf6.6.csv")
names(mergedf6.6)

mergedf6.6 <- rename(mergedf6.6, "Offset.Project Operator" = "Offset.Project.Operator")
mergedf6.6 <- rename(mergedf6.6, "Offset Designation" = "Offset.Designation")
mergedf6.6 <- rename(mergedf6.6, "Number of Offsets Unretired (Estimated as of 12/18)" = "Number.of.Offsets.Un.retired..Estimated..as.of.Dec..2018.")
mergedf6.6 <- rename(mergedf6.6, "Percent of Offsets Sold (Estimated as of 12/18)" = "Percent.of.Offsets.Sold..Estimated..as.of.Dec..2018.")
mergedf6.6 <- rename(mergedf6.6, "Type of Protocol" = "Type.of.Protocol")
mergedf6.6 <- rename(mergedf6.6, "Invalidation Period End Date" = "Invalidation.Period.End.Date")
mergedf6.6 <- rename(mergedf6.6, "Offsets Issued" = "Offsets.issued")
mergedf6.6 <- rename(mergedf6.6, "Project Type" = "Project.Type")
mergedf6.6 <- rename(mergedf6.6, "Vintage Year" = "Vintage.Year")
mergedf6.6 <- rename(mergedf6.6, "Issuance Date" = "Issuance.Date")

mergedf6.6$`Project Type`[mergedf6.6$`Project Type` == "U.S Forest" ] <- "U.S. Forest"

mergedf6.6$`Vintage Year` <- as.character(mergedf6.6$`Vintage Year`)
mergedf6.6$`Offset Designation` <- as.character(mergedf6.6$`Offset Designation`)
mergedf6.6$`Offset.Project Operator` <- as.character(mergedf6.6$`Offset.Project Operator`)
mergedf6.6$`Project Type` <- as.character(mergedf6.6$`Project Type`)

mergedf6.6 <- subset(mergedf6.6, !is.na(`Offset Designation`))

devnames <- unique(mergedf6.6$`Offset.Project Operator`)
protnames <- unique(mergedf6.6$`Project Type`)
desnamesnames <- unique(mergedf6.6$`Offset Designation`)
vintnames <- unique(mergedf6.6$`Vintage Year`)

mergedf6.6$X <- NULL

mergedf6.6$`Invalidation Period End Date` <- NULL
mergedf6.6$`Type of Protocol` <- NULL
#write.csv(Operatorandurllookup, "Operatorandurllookup.csv")

#Operatorandurllookup<- read.csv("C:/Users/Jordan/Desktop/Operatorandurllookup.csv")

Operatorandurllookup <- read.csv("./Operatorandurllookup.csv")

names(Operatorandurllookup)
names(mergedf6.6)
#Operatorandurllookup <- rename(Operatorandurllookup,"Offset.Project Operator" = "Offset.Project.Operator")
#Operatorandurllookup <- rename(Operatorandurllookup,"Project Type" = "Project.Type")
names(Operatorandurllookup)
names(mergedf6.6)

names(Operatorandurllookup)
mergedf6.6 <- rename(mergedf6.6, "Project.Type" = "Project Type")
mergedf6.6 <- rename(mergedf6.6, "Offset.Project.Operator" = "Offset.Project Operator")

mergedf6.6 <- merge(mergedf6.6, Operatorandurllookup, by = c("Offset.Project.Operator", "Project.Type", "Project.Name"), all.x = TRUE)
mergedf6.6$X <- NULL
mergedf6.6$X.1 <- NULL
mergedf6.6$tot <- NULL

mergedf6.6$`Offset.Project.Operator` <- mergedf6.6$Project.Owner
mergedf6.6$`Offset.Project Operator` <- NULL
mergedf6.6$Project.Owner <- NULL

names(mergedf6.6)


mergedf6.6 <- rename(mergedf6.6, "Project Type" = "Project.Type")
mergedf6.6$Offset.Project.Operator <- replace(mergedf6.6$Offset.Project.Operator, mergedf6.6$Offset.Project.Operator == "A-Gas", "A Gas")

