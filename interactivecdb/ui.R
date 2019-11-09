#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    headerPanel(title = "Regulatory Carbon Offset Database"), 
    fluidRow(column(2, selectizeInput('x', label = 'Project Type',
                                    choices = c("All", protnames))),
                     column(2, selectizeInput('y', label = 'Invalidation Length', 
                                    choices = c("All", desnamesnames))),
                    column(2, selectizeInput("color", label = "Vintage Year", 
                                    choices = c("All", vintnames),
                                    selected = "All")),
             column(2, selectizeInput("reg", label = "Registry", 
                                      choices = c("All", unique(offsets2$Registry)),
                                      selected = "All")),
                   column(3, selectizeInput("dev", label = "Project Developer", 
                                    choices = c("All", devnames),
                                    selected = "All"))
                     
    ), tabsetPanel(type = "tabs",
                        tabPanel("Table", DT::dataTableOutput("mytable")%>% withSpinner(color="#0dc5c1")),
                        tabPanel("Graph", plotlyOutput("trendPlot")))))
    
