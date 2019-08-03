#Visuals

#Forest Carbon Offsets
library(ggplot2)
library(dplyr)
library(viridis)
library(lubridate)
Sys.setenv("plotly_username"="JWUser")
Sys.setenv("plotly_api_key"="bDNbglK2nb30xtKpxgPt")
library(scales)
library(plotly)
#Total


Totalviz <- subset(mergedf6.6, `Vintage Year` > 2010)
names(Totalviz)
Totalviz <- subset(Totalviz, !is.na(`Project Administrator`))
glimpse(Totalviz)
Totalviz$`Offsets Issued` <- as.numeric(Totalviz$`Offsets Issued`)

Totalviz$`Vintage Year` <- year(Totalviz$`Issuance Date`)

Totalviz1 <- Totalviz %>% group_by(`Project Type`, `Vintage Year`) %>% summarise(OffsetsIssued = sum(`Offsets Issued`))



ptot <- ggplot(data=Totalviz1, aes(y= OffsetsIssued, x= `Vintage Year`, fill = `Project Type`)) + 
  labs(x = "Issuance Year", y = "Carbon Offsets Issued (in millions)")+
  geom_bar(stat="identity") + labs(text = element_text(size=20)) + 
  theme(text = element_text(size=20)) + scale_fill_viridis(discrete = TRUE) + labs(fill = "Project Type") + 
  scale_y_continuous(labels = unit_format(unit = "m", scale = 1e-6)) + theme_light()
ptot
Totalplot <- ggplotly(ptot) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
api_create(Totalplot, filename = "Totalplot")



#Total Project Developer Viz 

Totalviz2 <- Totalviz %>% group_by(`Project Administrator`, `Vintage Year`) %>% summarise(OffsetsIssued = sum(`Offsets Issued`))




ptot2 <- ggplot(data=Totalviz2, aes(y= OffsetsIssued, x= `Vintage Year`, fill = `Project Administrator`)) + 
  labs(x = "Issuance Year", y = "Carbon Offsets Issued (in millions)")+
  geom_bar(stat="identity") + labs(text = element_text(size=20)) + 
  theme(text = element_text(size=20)) + scale_fill_hue() + labs(fill = "Project Type") + 
  scale_y_continuous(labels = unit_format(unit = "m", scale = 1e-6)) + theme_light()
ptot2
Totalplot2 <- ggplotly(ptot2) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
api_create(Totalplot2, filename = "Totalplot2")


sum(Totalviz3$OffsetsIssued)

Totalviz3 <- Totalviz2 %>% group_by(`Project Administrator`) %>% summarise(OffsetsIssued = sum(OffsetsIssued))


totalviz4 <- subset(Totalviz3, OffsetsIssued > 5000000)
sum(totalviz4$OffsetsIssued)

#Forest

forestviz <- subset(mergedf6.6, `Project Type` == "U.S. Forest")
forestviz <- subset(forestviz, `Vintage Year` > 2010)
names(forestviz)
forestviz <- subset(forestviz, !is.na(`Project Administrator`))
glimpse(forestviz)
forestviz$`Offsets Issued` <- as.numeric(forestviz$`Offsets Issued`)
forestviz <- forestviz %>% group_by(`Project Administrator`, `Vintage Year`) %>% summarise(OffsetsIssued = sum(`Offsets Issued`))

forestviz2 <- forestviz %>% group_by(`Project Administrator`) %>% summarise(OffsetsIssued = sum(OffsetsIssued))

forestviz3 <- subset(forestviz, OffsetsIssued >= 50087)


p <- ggplot(data=forestviz3, aes(y= OffsetsIssued, x= `Vintage Year`, fill = `Project Administrator`)) + 
  labs(x = "Vintage Year", y = "Carbon Offsets Issued (in millions)")+
  geom_bar(stat="identity") + labs() + 
  theme_light() + scale_fill_viridis(discrete = TRUE) + labs(fill = "Project Administrator") + scale_y_continuous(labels = unit_format(unit = "m", scale = 1e-6))
p
forestplot <- ggplotly(p) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
api_create(forestplot, filename = "forestplot")

#Livestock

Livestockviz <- subset(mergedf6.6, `Project Type` == "Livestock")
Livestockviz <- subset(Livestockviz, `Vintage Year` > 2010)
names(Livestockviz)
Livestockviz <- subset(Livestockviz, !is.na(`Project Administrator`))
glimpse(Livestockviz)
Livestockviz$`Offsets Issued` <- as.numeric(Livestockviz$`Offsets Issued`)
Livestockviz <- Livestockviz %>% group_by(`Project Administrator`, `Vintage Year`) %>% summarise(OffsetsIssued = sum(`Offsets Issued`))

Livestockviz2 <- Livestockviz %>% group_by(`Project Administrator`) %>% summarise(OffsetsIssued = sum(OffsetsIssued))

Livestockviz3 <- subset(Livestockviz, OffsetsIssued >= 20000)


p <- ggplot(data=Livestockviz3, aes(y= OffsetsIssued, x= `Vintage Year`, fill = `Project Administrator`)) + 
  labs(x = "Vintage Year", y = "Carbon Offsets Issued (in thousands)")+
  geom_bar(stat="identity") + labs() + 
  theme_light() + scale_fill_viridis(discrete = TRUE) + labs(fill = "Project Administrator") + scale_y_continuous(labels = unit_format(unit = "k", scale = 1e-3))
p
Livestockplot <- ggplotly(p) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
Livestockplot
api_create(Livestockplot, filename = "Livestockplot")



#Website visuals

library(plotly)
library(ggplot2)
library(readxl)
library(scales)
library(ggthemes)
library(stringr)
library(xml2)
library(scales)
#install.packages("dygraphs")
library(dygraphs)
library(viridis)
CapandTradeVisuals <- read_excel("C:/Users/Jordan/Documents/E2/CapandTradeVisuals.xlsx")

CapandTradeVisuals4 <- read_excel("C:/Users/Jordan/Documents/E2/CapandTradeVisuals.xlsx", 
                                  sheet = "Sheet4")

CapandTradeVisuals5 <- read_excel("C:/Users/Jordan/Documents/E2/CapandTradeVisuals.xlsx", 
                                  sheet = "Sheet5")


Sys.setenv("plotly_username"="JWUser")
Sys.setenv("plotly_api_key"="bDNbglK2nb30xtKpxgPt")



eecolrs <- c("lightgrey", "#2252A4",  "#C7C8CA", "#939598", "#4D4D4F", "lightblue")

#Participation Graph
ParticipationType <- c('Maximum Use of Offsets','Partial Use of Offsets','No use of Offsets')
Useage <- c(.23, .16, .61)

Participation <- data.frame(ParticipationType, Useage)

p <- ggplot(data=Participation, aes(y= Useage, x= reorder(ParticipationType, -Useage), fill = ParticipationType)) + 
  labs()+
  geom_bar(stat="identity") + labs(x = "") +
  theme_minimal() + theme(axis.text.x=element_blank()) + scale_fill_viridis(discrete = TRUE) + scale_y_continuous(labels = scales::percent)
p
ParticipationPlot <- ggplotly(p) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
api_create(ParticipationPlot, filename = "ParticipationPlot")



#Cost Savings graph
Company <- c('Tesoro', 'Chevron', 'Phillips 66', 'Shell Energy', 'Southern California Gas Company')
CostSavings <- c(16.1, 12.9, 6.7, 5.2, 5.7)
CarbonSequestered <- c(11.7, 9.4, 4.8, 3.8, 4.2)



Savings <- data.frame(Company, CostSavings, CarbonSequestered)

p <- ggplot(data=Savings, aes(y= CostSavings, x= reorder(Company, -CostSavings), fill = Company, text = CostSavings)) + 
  labs()+
  geom_bar(stat="identity") + labs(x = "", y= "Cost Savings (in Millions) During in 2015-17 Compliance Period") +
  theme_minimal() + theme(axis.text.x=element_blank()) + scale_fill_viridis(discrete = TRUE) + scale_y_continuous(labels = scales::dollar)
p
SavingsPlot <- ggplotly(p, tooltip = "text") %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
SavingsPlot
api_create(SavingsPlot, filename = "SavingsPlot")

glimpse()

p <- ggplot(data=Savings, aes(y= CarbonSequestered, x= reorder(Company, -CostSavings), fill = Company, text = CarbonSequestered)) + 
  labs()+
  geom_bar(stat="identity") + labs(x ="", y= "Carbon Sequestered and Avoided through Offset Purchases") +
  theme_minimal() + theme(axis.text.x=element_blank()) + scale_fill_viridis(discrete = TRUE, option = "cividis") + scale_y_continuous(labels = unit_format(unit = "Tons"))
p
CarbonSavingsPlot <- ggplotly(p, tooltip = "text") %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE)) %>% config(showLink = F)
CarbonSavingsPlot
api_create(CarbonSavingsPlot, filename = "CarbonSavingsPlot")

scale_fill_vi





G7 <- ggplot(data = CapandTradeVisuals,
             aes(x=Year, y = Data, fill = Description))+
  geom_bar(stat= "identity", position = "stack") +
  theme_minimal() + labs(x = "Year", y = "Carbon Allowances (in Millions)") + scale_fill_manual(values = eecolrs)# + ggtitle("Allowance and Offset Caps in CA Cap-and-Trade")

G7

P1 <- ggplotly(G7) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE))
api_create(P1, filename = "CarbonAllowances")





G2 <- ggplot(data=CapandTradeVisuals4,aes(x=Year, y=Data, fill=Description, color=Description, alpha=Description)) +
  geom_bar(stat="identity",position ="identity") +
  scale_colour_manual(values=c("#A3B43A","#2252A4")) +
  scale_fill_manual(values=c("#A3B43A","#2252A4")) + theme_light() +
  scale_alpha_manual(values=c(.8, .3)) + labs(x = "Year", y = "Carbon Offsets (in Millions)")

G2

P2 <- ggplotly(G2) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE))
api_create(P2, filename = "CarbonOffsets")


names(CapandTradeVisuals5)

CapandTradeVisuals5 <- rename(CapandTradeVisuals5, "Description" = "X__1")

names(CapandTradeVisuals)

names(CapandTradeVisuals)

G3 <- ggplot(data = CapandTradeVisuals,
             aes(x=Year, y = `Market Opportunity (in Millions of Tons CO2)`))+ scale_x_continuous(limits=c(2018,2030)) +
  geom_bar(stat= "identity", position = "dodge", fill = "#A3B43A") +
  theme_light() + labs(x = "Year", y = "Carbon Offset Potential (In Millions)") + scale_fill_manual(values = "#A3B43A")
G3

P3 <- ggplotly(G3) %>%
  config(displayModeBar = F) %>% layout(xaxis=list(fixedrange=TRUE)) %>% 
  layout(yaxis=list(fixedrange=TRUE))
api_create(P3, filename = "Market Opportunity")



dygraph(CapandTradeVisuals4) %>% dyRangeSelector()

df = data.frame("OffsetUsage" = c("Maximum Offset Use","Some Offset Use","No Offset Use"),
                "share" = c(.23,.16,.61))

library(ggplot2)
install.packages("wesanderson")

library(wesanderson)
# Create a basic bar
pie = ggplot(df, aes(x="", y=share, fill=OffsetUsage)) + geom_bar(stat="identity", width=1)


# Convert to pie (polar coordinates) and add labels
pie = pie + coord_polar("y", start=0) + geom_text(aes(label = paste0(round(share*100), "%")), position = position_stack(vjust = 0.5))

# Add color scale (hex colors)
pie = pie + scale_fill_manual(values = wes_palette(3, "Chevalier1")) 



# Remove labels and add title
pie = pie + labs(x = NULL, y = NULL, fill = NULL, title = "Offset Purchasing Behavior of Companies \n in the California Cap-and-Trade System")

# Tidy up the theme
pie = pie + theme_classic() + theme(axis.line = element_blank(),
                                    axis.text = element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(size = 18, color = "#666666", face = "bold"),
                                    legend.position = "bottom", legend.direction = "vertical",
                                    legend.title=element_text(size=18), 
                                    legend.text=element_text(size=18, color = "#666666"))
pie

install.packages("maptools")
library(maptools)

install.packages("raster")
library(raster)
library(plyr)
library(ggplot2)
library(rgdal)

Iceland<-getData("GADM", country="IS", level=0)
Kenya1<-getData("GADM", country="KE", level=1)

plot(Iceland)
Iceland_df <- fortify(Iceland)

ggplot() + 
  geom_polygon(data=Iceland_df, aes(long,lat,group=group))+
  geom_path(data=Iceland_df, aes(long,lat, group=group), color = "grey") +
  geom_polygon(data=Iceland_df, aes(long,lat,group=group), fill = "#D3DDDC") +
  theme(aspect.ratio=1)+ 
  scale_x_continuous(limits = c(-26, -12))+
  scale_y_continuous(limits = c(60, 67)) +
  labs(x = NULL, y = NULL, fill = NULL, title = "The additional CO2 avoided \n through full Offset market \n participation would be equal \n to twice Iceland's total emissions") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.text = element_blank(),
        axis.line = element_blank(), 
        plot.title = element_text(size = 15, color = "#666666", face = "bold", hjust = 0.5)) 




