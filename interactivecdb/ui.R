#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(shinydashboard)
library(plotly)
library(dplyr)

mergedf6.6<-read.csv("./interactivecdb/Data/mergedf6.6.csv")

mergedf6.6 <- rename(mergedf6.6, "Offset.Project Operator" = "Offset.Project.Operator")
mergedf6.6 <- rename(mergedf6.6, "Offset Designation" = "Offset.Designation")
mergedf6.6 <- rename(mergedf6.6, "Number of Offsets Unretired (Estimated as of 12/18)" = "Number.of.Offsets.Un.retired..Estimated..as.of.Dec..2018.")
mergedf6.6 <- rename(mergedf6.6, "Percent of Offsets Sold (Estimated as of 12/18)" = "Percent.of.Offsets.Sold..Estimated..as.of.Dec..2018.")
mergedf6.6 <- rename(mergedf6.6, "Type of Protocol" = "Type.of.Protocol")
mergedf6.6 <- rename(mergedf6.6, "Invalidation Period End Date" = "Invalidation.Period.End.Date")
mergedf6.6 <- rename(mergedf6.6, "Offsets Issued" = "Offsets.issued")
mergedf6.6 <- rename(mergedf6.6, "Project Type" = "Project.Type")


mergedf6.6$Vintage.Year <- as.character(mergedf6.6$Vintage.Year)
mergedf6.6$`Offset Designation` <- as.character(mergedf6.6$`Offset Designation`)
mergedf6.6$`Offset.Project Operator` <- as.character(mergedf6.6$`Offset.Project Operator`)
mergedf6.6$`Project Type` <- as.character(mergedf6.6$`Project Type`)

devnames <- unique(mergedf6.6$`Offset.Project Operator`)
protnames <- unique(mergedf6.6$`Project Type`)
desnamesnames <- unique(mergedf6.6$`Offset Designation`)
vintnames <- unique(mergedf6.6$Vintage.Year)

mergedf6.6$X <- NULL


# Define UI for application that draws a histogram
shinyUI(dashboardPage(
    dashboardHeader(title = "Emissions Reductions, by Digester Type "),
    dashboardSidebar(selectizeInput('x', label = 'Project Type', multiple = T,
                                    choices = c("All", protnames)),
                     selectizeInput('y', label = 'Offset Designation', multiple = T,
                                    choices = c("All", desnamesnames)),
                     selectizeInput("color", label = "Vintage Year", multiple = T,
                                    choices = c("All", vintnames),
                                    selected = "All"),
                     selectizeInput("dev", label = "Project Developer", multiple = T,
                                    choices = c("All", devnames),
                                    selected = "All")
                     
    ),
    dashboardBody(box(DT::dataTableOutput("mytable"), width = 12)
    )
))
