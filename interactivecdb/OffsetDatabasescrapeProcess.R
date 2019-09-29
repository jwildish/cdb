library(stringr)
library(glue)
library(tidyverse)
library(dplyr)
library(purrr)
library(RCurl )
library(pdftools)
library(readxl)
library(pdftools)
library(pdftables)
library(RCurl)
library(reticulate)
library(tabulizer)
library(data.table)
library(kableExtra)
library(dplyr)
library(devtools)
library(formattable)
library(DT)



#use_python("C:/Users/Jordan/Anaconda3/python.exe", required = T)
py_discover_config()

py_install("scipy")
py_install("tabula-py")

py_run_string("pip install tabula-py")

py_run_string("from tabula import convert_into")

py_run_string("tabula.convert_into('https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/arb_offset_credit_issuance_table.pdf', 'output10.csv', output_format = 'csv', pages='all')")


#py_run_file("C:/Users/Jordan/Documents/GetNOAATempData.py")
#py_run_file("C:/Users/Jordan/Desktop/E2/dbscrape.py")

s3 <- read.csv("/Users/istaeheli/Documents/RStudio Files/NOAA Temp Data.csv", header = TRUE)


#first, pull this pdf and convert to Excel in Acrobat. https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/arb_offset_credit_issuance_table.pdf


#arb_offset_credit_issuance_table2 <- read.csv("C:/Users/Jordan/output9.csv", skip = 4)

arb_offset_credit_issuance_table2 <- subset(arb_offset_credit_issuance_table2, ARB.Project.ID..!= "ARB Project ID #")
arb_offset_credit_issuance_table2 <- subset(arb_offset_credit_issuance_table2, ARB.Project.ID..!= "")
glimpse(arb_offset_credit_issuance_table2)
arb_offset_credit_issuance_table2$X.1 <- NULL
arb_offset_credit_issuance_table2$X <- NULL

arb_offset_credit_issuance_table2$X.2 <- NULL
arb_offset_credit_issuance_table2$X.3 <- NULL

arb_offset_credit_issuance_table2$ARB.Project.ID.. <- as.character(arb_offset_credit_issuance_table2$ARB.Project.ID..)

arb_offset_credit_issuance_table2 <- subset(arb_offset_credit_issuance_table2, ARB.Project.ID.. != "ARB Project ID # Project Name")

arb_offset_credit_issuance_table2 <- arb_offset_credit_issuance_table2[arb_offset_credit_issuance_table2$ARB.Project.ID.. %like% "CA", ]

arb_offset_credit_issuance_table2 <- subset(arb_offset_credit_issuance_table2, Project.Documentation != "")

arb_offset_credit_issuance_table2 <- separate(arb_offset_credit_issuance_table2, ARB.Project.ID.., c("ARB Project ID #", "other"), " " )

#arb_offset_credit_issuance_table3 <- subset(arb_offset_credit_issuance_table2, !is.na(other))

arb_offset_credit_issuance_table3 <- arb_offset_credit_issuance_table2

#arb_offset_credit_issuance_table3$Project.Name <- arb_offset_credit_issuance_table3$other


arb_offset_credit_issuance_table3$Type.of.Protocol <- "Compliance"

arb_offset_credit_issuance_table2 <- rbind(arb_offset_credit_issuance_table2, arb_offset_credit_issuance_table3)

#arb_offset_credit_issuance_table <- read_excel("C:/Users/Jordan/Desktop/E2/arb_offset_credit_issuance_table512.xlsx", skip = 4)


arb_offset_credit_issuance_table <- subset(arb_offset_credit_issuance_table, Type.of.Protocol != "")
arb_offset_credit_issuance_table <- subset(arb_offset_credit_issuance_table, Project.Name != "")

arb_offset_credit_issuance_table <- subset(arb_offset_credit_issuance_table, `ARB Project ID #` != "ARB Project ID #")

arb_offset_credit_issuance_table$other <- NULL

glimpse(arb_offset_credit_issuance_table)
arb_offset_credit_issuance_table$X <- NULL


#X2015_2017compliancereport <- read_excel("C:/Users/Jordan/Desktop/E2/2015-2017compliancereport.xlsx", 
 #                                        sheet = "2015-2017 Offset Detail", skip = 4)


#function to write URL
urlcreatora <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a.pdf", sep = "") 
  return(tolower(url))
}

urlcreatorab <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-b.pdf", sep = "")
  return(tolower(url))
}

urlcreatorac <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-c.pdf", sep = "")
  return(tolower(url))
}

urlcreatorad <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-d.pdf", sep = "")
  return(tolower(url))
}

urlcreatorae <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-e.pdf", sep = "")
  return(tolower(url))
}

urlcreatoraf <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-f.pdf", sep = "")
  return(tolower(url))
}

urlcreatorag <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-g.pdf", sep = "")
  return(tolower(url))
}

urlcreatorah <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-h.pdf", sep = "")
  return(tolower(url))
}

urlcreatorai <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-i.pdf", sep = "")
  return(tolower(url))
}

urlcreatoraj <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-j.pdf", sep = "")
  return(tolower(url))
}

urlcreatorak <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-k.pdf", sep = "")
  return(tolower(url))
}

urlcreatoral <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-l.pdf", sep = "")
  return(tolower(url))
}


urlcreatoram <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-m.pdf", sep = "")
  return(tolower(url))
}


#Renaming to match new upload method
names(arb_offset_credit_issuance_table)

names(arb_offset_credit_issuance_table)
#arb_offset_credit_issuance_table <- rename(arb_offset_credit_issuance_table, "ARB Project ID #" = "ARB.Project.ID..")


#removing white space issues
arb_offset_credit_issuance_table$`ARB Project ID #` <- trimws(arb_offset_credit_issuance_table$`ARB Project ID #`)

#generating 'possible' URLs
table(arb_offset_credit_issuance_table$`ARB Project ID #`)

arb_offset_credit_issuance_table$newurla<- urlcreatora(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlab<- urlcreatorab(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlac<- urlcreatorac(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlad<- urlcreatorad(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlae<- urlcreatorae(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlaf<- urlcreatoraf(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlag<- urlcreatorag(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlah<- urlcreatorah(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlaj<- urlcreatoraj(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlak<- urlcreatorak(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlai<- urlcreatorai(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlal<- urlcreatoral(arb_offset_credit_issuance_table$`ARB Project ID #`)
arb_offset_credit_issuance_table$newurlam<- urlcreatoram(arb_offset_credit_issuance_table$`ARB Project ID #`)

#converting possible URLs to character (test -- could be removed?)

arb_offset_credit_issuance_table$newurla <- as.character(arb_offset_credit_issuance_table$newurla)
arb_offset_credit_issuance_table$newurlab <- as.character(arb_offset_credit_issuance_table$newurlab)
arb_offset_credit_issuance_table$newurlac <- as.character(arb_offset_credit_issuance_table$newurlac)
arb_offset_credit_issuance_table$newurlad <- as.character(arb_offset_credit_issuance_table$newurlad)
arb_offset_credit_issuance_table$newurlae <- as.character(arb_offset_credit_issuance_table$newurlae)
arb_offset_credit_issuance_table$newurlaf <- as.character(arb_offset_credit_issuance_table$newurlaf)
arb_offset_credit_issuance_table$newurlag <- as.character(arb_offset_credit_issuance_table$newurlag)
arb_offset_credit_issuance_table$newurlah <- as.character(arb_offset_credit_issuance_table$newurlah)
arb_offset_credit_issuance_table$newurlaj <- as.character(arb_offset_credit_issuance_table$newurlaj)
arb_offset_credit_issuance_table$newurlak <- as.character(arb_offset_credit_issuance_table$newurlak)
arb_offset_credit_issuance_table$newurlai <- as.character(arb_offset_credit_issuance_table$newurlai)
arb_offset_credit_issuance_table$newurlal <- as.character(arb_offset_credit_issuance_table$newurlal)
arb_offset_credit_issuance_table$newurlam <- as.character(arb_offset_credit_issuance_table$newurlam)

#Seeing which urls exist

table(arb_offset_credit_issuance_table$newurla)

arb_offset_credit_issuance_table$FirstIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurla, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$SecondIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlab, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$ThirdIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlac, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$FourthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlad, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$FifthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlae, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$SixthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlaf, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$SeventhIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlag, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$EighthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlah, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$NinthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlai, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$TenthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlaj, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$EleventhIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlak, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$TwelthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlal, function(x) url.exists(as.character(x)))
arb_offset_credit_issuance_table$ThirteenthIssuanceTest <- sapply(arb_offset_credit_issuance_table$newurlam, function(x) url.exists(as.character(x)))



#subset of urls "-a"
arb_offset_credit_issuance_table$newurla<- urlcreatora(arb_offset_credit_issuance_table$`ARB Project ID #`)

asub <- as.vector(subset(arb_offset_credit_issuance_table, FirstIssuanceTest == "TRUE"))
urlsavector <- as.vector(asub$newurla)
namesavector <- as.vector(asub$`ARB Project ID #`)


for (i in 1:length(urlsavector)){
  download.file(urlsavector[i], destfile =  namesavector[i], mode = 'wb')
}


raw_text <- purrr::map(namesavector, pdf_text)
raw_text <- str_split(raw_text, "\n", simplify = TRUE)
raw_text <- as.data.frame(raw_text)
raw_texta <- raw_text

#subset of urls "-a-b"

absub <- as.vector(subset(arb_offset_credit_issuance_table, SecondIssuanceTest == "TRUE"))

urlsabvector <- as.vector(absub$newurlab)
namesabvector <- as.vector(absub$`ARB Project ID #`)


for (i in 1:length(urlsabvector)){
  download.file(urlsabvector[i], destfile =  namesabvector[i], mode = 'wb')
}


raw_textab <- purrr::map(namesabvector, pdf_text)

raw_textab <- str_split(raw_textab, "\n", simplify = TRUE)

raw_textab <- as.data.frame(raw_textab)

#subset of urls "-a-c"

acsub <- as.vector(subset(arb_offset_credit_issuance_table, ThirdIssuanceTest == "TRUE"))

urlsacvector <- as.vector(acsub$newurlac)
namesacvector <- as.vector(acsub$`ARB Project ID #`)


for (i in 1:length(urlsacvector)){
  download.file(urlsacvector[i], destfile =  namesacvector[i], mode = 'wb')
}


raw_textac <- purrr::map(namesacvector, pdf_text)

raw_textac <- str_split(raw_textac, "\n", simplify = TRUE)

raw_textac <- as.data.frame(raw_textac)

#subset of urls "-a-d"

adsub <- as.vector(subset(arb_offset_credit_issuance_table, FourthIssuanceTest == "TRUE"))

urlsadvector <- as.vector(adsub$newurlad)
namesadvector <- as.vector(adsub$`ARB Project ID #`)


for (i in 1:length(urlsadvector)){
  download.file(urlsadvector[i], destfile =  namesadvector[i], mode = 'wb')
}


raw_textad <- purrr::map(namesadvector, pdf_text)

raw_textad <- str_split(raw_textad, "\n", simplify = TRUE)

raw_textad <- as.data.frame(raw_textad)


#subset of urls "-a-e"

aesub <- as.vector(subset(arb_offset_credit_issuance_table, FifthIssuanceTest == "TRUE"))

urlsaevector <- as.vector(aesub$newurlae)
namesaevector <- as.vector(aesub$`ARB Project ID #`)


for (i in 1:length(urlsaevector)){
  download.file(urlsaevector[i], destfile =  namesaevector[i], mode = 'wb')
}


raw_textae <- purrr::map(namesaevector, pdf_text)

raw_textae <- str_split(raw_textae, "\n", simplify = TRUE)

raw_textae <- as.data.frame(raw_textae)


#subset of urls "-a-f"

afsub <- as.vector(subset(arb_offset_credit_issuance_table, SixthIssuanceTest == "TRUE"))

urlsafvector <- as.vector(afsub$newurlaf)
namesafvector <- as.vector(afsub$`ARB Project ID #`)


for (i in 1:length(urlsafvector)){
  download.file(urlsafvector[i], destfile =  namesafvector[i], mode = 'wb')
}


raw_textaf <- purrr::map(namesafvector, pdf_text)

raw_textaf <- str_split(raw_textaf, "\n", simplify = TRUE)

raw_textaf <- as.data.frame(raw_textaf)

#subset of urls "-a-g"

agsub <- as.vector(subset(arb_offset_credit_issuance_table, SeventhIssuanceTest == "TRUE"))

urlsagvector <- as.vector(agsub$newurlag)
namesagvector <- as.vector(agsub$`ARB Project ID #`)


for (i in 1:length(urlsagvector)){
  download.file(urlsagvector[i], destfile =  namesagvector[i], mode = 'wb')
}


raw_textag <- purrr::map(namesagvector, pdf_text)

raw_textag <- str_split(raw_textag, "\n", simplify = TRUE)

raw_textag <- as.data.frame(raw_textag)


#subset of urls "-a-h"

ahsub <- as.vector(subset(arb_offset_credit_issuance_table, EighthIssuanceTest == "TRUE"))

urlsahvector <- as.vector(ahsub$newurlah)
namesahvector <- as.vector(ahsub$`ARB Project ID #`)


for (i in 1:length(urlsahvector)){
  download.file(urlsahvector[i], destfile =  namesahvector[i], mode = 'wb')
}


raw_textah <- purrr::map(namesahvector, pdf_text)

raw_textah <- str_split(raw_textah, "\n", simplify = TRUE)

raw_textah <- as.data.frame(raw_textah)


#subset of urls "-a-i"

aisub <- as.vector(subset(arb_offset_credit_issuance_table, NinthIssuanceTest == "TRUE"))

urlsaivector <- as.vector(aisub$newurlai)
namesaivector <- as.vector(aisub$`ARB Project ID #`)


for (i in 1:length(urlsaivector)){
  download.file(urlsaivector[i], destfile =  namesaivector[i], mode = 'wb')
}


raw_textai <- purrr::map(namesaivector, pdf_text)

raw_textai <- str_split(raw_textai, "\n", simplify = TRUE)

raw_textai <- as.data.frame(raw_textai)

#Subset of urls (-a-j)
ajsub <- as.vector(subset(arb_offset_credit_issuance_table, TenthIssuanceTest == "TRUE"))

urlsajvector <- as.vector(ajsub$newurlaj)
namesajvector <- as.vector(ajsub$`ARB Project ID #`)


for (i in 1:length(urlsajvector)){
  download.file(urlsajvector[i], destfile =  namesajvector[i], mode = 'wb')
}


raw_textaj <- purrr::map(namesajvector, pdf_text)

raw_textaj <- str_split(raw_textaj, "\n", simplify = TRUE)

raw_textaj <- as.data.frame(raw_textaj)


#subset of urls "-a-k"

aksub <- as.vector(subset(arb_offset_credit_issuance_table, EleventhIssuanceTest == "TRUE"))

urlsakvector <- as.vector(aksub$newurlak)
namesakvector <- as.vector(aksub$`ARB Project ID #`)


for (i in 1:length(urlsakvector)){
  download.file(urlsakvector[i], destfile =  namesakvector[i], mode = 'wb')
}


raw_textak <- purrr::map(namesakvector, pdf_text)

raw_textak <- str_split(raw_textak, "\n", simplify = TRUE)

raw_textak <- as.data.frame(raw_textak)

#subset of urls "-a-l"

alsub <- as.vector(subset(arb_offset_credit_issuance_table, TwelthIssuanceTest == "TRUE"))

urlsalvector <- as.vector(alsub$newurlal)
namesalvector <- as.vector(alsub$`ARB Project ID #`)


for (i in 1:length(urlsalvector)){
  download.file(urlsalvector[i], destfile =  namesalvector[i], mode = 'wb')
}


raw_textal <- purrr::map(namesalvector, pdf_text)

raw_textal <- str_split(raw_textal, "\n", simplify = TRUE)

raw_textal <- as.data.frame(raw_textal)


#subset of urls "-a-m"

amsub <- as.vector(subset(arb_offset_credit_issuance_table, ThirteenthIssuanceTest == "TRUE"))

urlsamvector <- as.vector(amsub$newurlam)
namesamvector <- as.vector(amsub$`ARB Project ID #`)


for (i in 1:length(urlsamvector)){
  download.file(urlsamvector[i], destfile =  namesamvector[i], mode = 'wb')
}


raw_textam <- purrr::map(namesamvector, pdf_text)

raw_textam <- str_split(raw_textam, "\n", simplify = TRUE)

raw_textam <- as.data.frame(raw_textam)


Fullbind <- bind_rows(raw_texta, raw_textab, raw_textac, raw_textad, raw_textae, raw_textaf, raw_textag, raw_textah, raw_textai, raw_textaj, raw_textak, raw_textal, raw_textam)

glimpse(Fullbind)

Fullbind$V1 <- NULL
Fullbind$V2 <- NULL
Fullbind$V3 <- NULL
Fullbind$V4 <- NULL
Fullbind$V5 <- NULL
Fullbind$V22 <- NULL
Fullbind$Count_of_Previous_Issuances <- NULL 

V1 <- as.data.frame(Fullbind$V6)
V1 <- rename(V1, "data" = "Fullbind$V6")
V2 <- as.data.frame(Fullbind$V7)
V2 <- rename(V2, "data" = "Fullbind$V7")
V3 <- as.data.frame(Fullbind$V8)
V3 <- rename(V3, "data" = "Fullbind$V8")

V4 <- as.data.frame(Fullbind$V9)
V4 <- rename(V4, "data" = "Fullbind$V9")

V5 <- as.data.frame(Fullbind$V10)
V5 <- rename(V5, "data" = "Fullbind$V10")

V6 <- as.data.frame(Fullbind$V11)
V6 <- rename(V6, "data" = "Fullbind$V11")

V7 <- as.data.frame(Fullbind$V12)
V7 <- rename(V7, "data" = "Fullbind$V12")

V8 <- as.data.frame(Fullbind$V13)
V8 <- rename(V8, "data" = "Fullbind$V13")

V9 <- as.data.frame(Fullbind$V14)
V9 <- rename(V9, "data" = "Fullbind$V14")

V10 <- as.data.frame(Fullbind$V15)
V10 <- rename(V10, "data" = "Fullbind$V15")

V11 <- as.data.frame(Fullbind$V16)
V11 <- rename(V11, "data" = "Fullbind$V16")

V13 <- as.data.frame(Fullbind$V17)
V13 <- rename(V13, "data" = "Fullbind$V17")

V14 <- as.data.frame(Fullbind$V18)
V14 <- rename(V14, "data" = "Fullbind$V18")

V15 <- as.data.frame(Fullbind$V19)
V15 <- rename(V15, "data" = "Fullbind$V19")

V16 <- as.data.frame(Fullbind$V20)
V16 <- rename(V16, "data" = "Fullbind$V20")

V17 <- as.data.frame(Fullbind$V21)
V17 <- rename(V17, "data" = "Fullbind$V21")

Fullbind <- bind_rows(V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V13, V14, V15, V16, V17)

Fullbind2 <- Fullbind <- Fullbind[!apply(is.na(Fullbind) |  Fullbind == "", 1, all),]

Fullbind2 <- as.data.frame(Fullbind2)

Fullbind2 <- rename(Fullbind2, "data" = "Fullbind2")

Fullbind3 <- Fullbind2[!grepl("This page", Fullbind2$data),]

Fullbind3 <- as.data.frame(Fullbind3)

Fullbind3 <- rename(Fullbind3, "thedata" = "Fullbind3")

tableoutput <- separate(Fullbind3, thedata, c("Blank", "Project ID", "Start_Reporting_Date", "End_Reporting_Date", "Vintage_Year", "Offsets_issued", "Issuance_Date", "Invalidation_Length", "years", "Invalidation_start", "OffsetsinForestBuffer", "Extra2", "Extra3"), sep = " +")

offsetssold <- X2015_2017compliancereport %>% group_by(`ARB Project ID #`) %>% dplyr:::summarize(Quantity = sum(Quantity))

offsetssold <- rename(offsetssold, "projectid" = "ARB Project ID #")

tableoutput <- rename(tableoutput, "projectid" = "Project ID")


mergedfinal109 <- merge(tableoutput, offsetssold, by = "projectid", all.x = T)
names(arb_offset_credit_issuance_table)


arboffsets <- arb_offset_credit_issuance_table %>% select(`ARB Project ID #`, Project.Name, Type.of.Protocol, Offset.Project.Operator, Project.Type, Project.Documentation)

mergedfinal109$projectgeneralid <- paste(mergedfinal109$projectid)
test <- separate(mergedfinal109, projectgeneralid, c("genid", "letter"), sep = "-")

mergedfinal109 <- test

arboffsets <- rename(arboffsets, "genid" = "ARB Project ID #")

mergedfinal109v2 <- merge(mergedfinal109, arboffsets, by = "genid")


forestbuffer <- subset(mergedfinal109v2, !is.na(OffsetsinForestBuffer))

forestbuffer <- forestbuffer %>% dplyr::rename("OffsetsinForestBuffer" = "Issuance_Date", "Issuance_Date" = "Invalidation_Length", 
                                               "Invalidation_Length" = "years", "years" = "Invalidation_start", "Invalidation_start" = "OffsetsinForestBuffer")


Issuance1 <- subset(mergedfinal109v2, is.na(OffsetsinForestBuffer))

glimpse(forestbuffer)

forestbuffer <- forestbuffer %>% select(projectid, Start_Reporting_Date, End_Reporting_Date, Vintage_Year, Offsets_issued, OffsetsinForestBuffer, Issuance_Date, Invalidation_Length,
                                        Invalidation_start, Quantity, Project.Name, Type.of.Protocol, Offset.Project.Operator, Project.Type, Project.Documentation)

Issuance1 <- Issuance1 %>% select(projectid, Start_Reporting_Date, End_Reporting_Date, Vintage_Year, Offsets_issued, OffsetsinForestBuffer, Issuance_Date, Invalidation_Length,
                                        Invalidation_start, Quantity, Project.Name, Type.of.Protocol, Offset.Project.Operator, Project.Type, Project.Documentation)
Issuancetable <- rbind(forestbuffer, Issuance1)

attach(Issuancetable)
Issuancetable2 <- Issuancetable[order(Invalidation_Length),] 

Issuancetable2$dupconcat <- paste(Issuancetable2$projectid, Issuancetable2$Offsets_issued, Issuancetable2$Vintage_Year, Issuancetable2$Start_Reporting_Date)

Issuancetable2$duplicatecheck <- duplicated(Issuancetable2$dupconcat)

viewdup <- subset(Issuancetable2, duplicatecheck == "TRUE")

Issuancetable3 <- subset(Issuancetable2, duplicatecheck != "TRUE")


#identifying duplicates

Issuancetable3$Offsets_issued <- as.numeric(gsub(",","",Issuancetable3$Offsets_issued))
Issuancetable3$OffsetsinForestBuffer <- as.numeric(gsub(",","",Issuancetable3$OffsetsinForestBuffer))
Issuancetable3$OffsetsinForestBuffer <- replace_na(Issuancetable3$OffsetsinForestBuffer, 0)
Issuancetable3$Quantity <- replace_na(Issuancetable3$Quantity, 0)

Issuancetable3$numberremaining <- (Issuancetable3$Offsets_issued- Issuancetable3$OffsetsinForestBuffer) - Issuancetable3$Quantity

Issuancetable3$percentsold <- Issuancetable3$Quantity/(Issuancetable3$Offsets_issued - Issuancetable3$OffsetsinForestBuffer)

#data clean, now formatting

mergeddf <- Issuancetable3

mergeddf$`Project Type` <- as.factor(mergeddf$Project.Type)
mergeddf$`Offset Project Operator` <- as.factor(mergeddf$Offset.Project.Operator)
mergeddf$`Project Name` <- as.factor(mergeddf$Project.Name)
mergeddf$`Type of Protocol` <- as.factor(mergeddf$Type.of.Protocol)
mergeddf$Vintage_Year <- as.factor(mergeddf$Vintage_Year)

mergeddf2 <- subset(mergeddf, Vintage_Year != "")

library(lubridate)

mergeddf2$Invalidation_start <- mdy(mergeddf2$Invalidation_start)

mergeddf2$invalidationend <- ymd(mergeddf2$Invalidation_start) + years(mergeddf2$Invalidation_Length)

mergeddf2<- mergeddf2[rev(order(as.Date(mergeddf2$Invalidation_start, format="%m/%d/%Y"))),]

mergeddf2$date <- Sys.Date()


mergeddf2$diff_in_days<- difftime(mergeddf2$date, mergeddf2$Invalidation_start, units = c("days"))
                                  
mergeddf2$diff_in_days <- as.numeric(mergeddf2$diff_in_days)   

mergeddf2$diff_in_year <- mergeddf2$diff_in_days/365

mergeddf2$Invalidation_Length <- as.numeric(mergeddf2$Invalidation_Length)

mergeddf2$Invalidation2 <- ifelse(mergeddf2$diff_in_year > mergeddf2$Invalidation_Length, 0, mergeddf2$Invalidation_Length)


mergeddf2 <- rename(mergeddf2, "Reporting Start Date" = "Start_Reporting_Date")
mergeddf2 <- rename(mergeddf2, "Reporting End Date" = "End_Reporting_Date")
mergeddf2 <- rename(mergeddf2, "Vintage Year" = "Vintage_Year")
mergeddf2 <- rename(mergeddf2, "Issuance Date" = "Issuance_Date")
mergeddf2 <- rename(mergeddf2, "Invalidation Start" = "Invalidation_start")
mergeddf2 <- rename(mergeddf2, "Invalidation Length" = "Invalidation_Length")
mergeddf2 <- rename(mergeddf2, "Offsets issued" = "Offsets_issued")
mergeddf2 <- rename(mergeddf2, "Project ID" = "projectid")
mergeddf2 <- rename(mergeddf2, "Number of Offsets Un-retired (Estimated, as of Dec. 2018)" = "numberremaining")
mergeddf2 <- rename(mergeddf2, "Percent of Offsets Sold (Estimated, as of Dec. 2018)" = "percentsold")
mergeddf2 <- rename(mergeddf2, "Offset Designation" = "Invalidation2")
mergeddf2 <- rename(mergeddf2, "Invalidation Period End Date" = "invalidationend")

mergeddf2$`Offsets issued` <- mergeddf2$`Offsets issued` - mergeddf2$OffsetsinForestBuffer

glimpse(mergeddf2)

mergeddf3 <- mergeddf2 %>% select(`Type of Protocol`, `Project Type`, `Offsets issued`, `Offset Project Operator`, `Vintage Year`, `Offset Designation`, `Invalidation Start`, `Invalidation Period End Date`, `Project Name`, `Issuance Date`, `Project ID`, `Invalidation Length`, `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`,  `Percent of Offsets Sold (Estimated, as of Dec. 2018)`, OffsetsinForestBuffer, Project.Documentation)

library(scales)
mergeddf3$`Offsets issued` <- as.numeric(mergeddf3$`Offsets issued`)
#mergeddf3$`Offsets issued` <- comma(mergeddf3$`Offsets issued`)

library(dplyr)
library(DT)
mergeddf4 <- mergeddf3
table(mergeddf4$`Project Type`)

mergeddf4$`Invalidation Length`[mergeddf4$`Invalidation Length`=="8"] <- "8 Years"
mergeddf4$`Invalidation Length`[mergeddf4$`Invalidation Length`=="3"] <- "3 Years"

mergeddf4$`Offset Designation`[mergeddf4$`Offset Designation`=="3"] <- "CCO-3"
mergeddf4$`Offset Designation`[mergeddf4$`Offset Designation`=="8"] <- "CCO-8"
mergeddf4$`Offset Designation`[mergeddf4$`Offset Designation`=="0"] <- "CCO-0"

mergeddf4 <- rename(mergeddf4, "Project.Type" = "Project Type")
mergeddf4 <- rename(mergeddf4, "Project.Name" = "Project Name")
mergeddf4 <- rename(mergeddf4, "Offset.Project Operator" = "Offset Project Operator")

mergeddf4$Project.Type <- as.character(mergeddf4$Project.Type)


mergeddf4$`Percent of Offsets Sold (Estimated, as of Dec. 2018)` <- percent(mergeddf4$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`)

table(mergeddf4$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`)

table(mergeddf4$Project.Type)

mergeddf4$Project.Type<- replace(mergeddf4$Project.Type, mergeddf4$Project.Type=="Ozone Depleting\r\nSubstances", "Ozone Depleting Substances")
mergeddf4$Project.Type<- replace(mergeddf4$Project.Type, mergeddf4$Project.Type=="Ozone\r\nDepleting Substances", "Ozone Depleting Substances")
mergeddf4$Project.Type<- replace(mergeddf4$Project.Type, mergeddf4$Project.Type=="Ozone", "Ozone Depleting Substances")

mergeddf4 <- mergeddf4 %>% select(`Project ID`, Project.Type, `Offset.Project Operator`, `Offset Designation`,`Invalidation Start`,  `Invalidation Period End Date`, `Offsets issued`, `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`, `Percent of Offsets Sold (Estimated, as of Dec. 2018)`, Project.Name, `Vintage Year`, `Invalidation Length`,  `Type of Protocol`, `Issuance Date`, Project.Documentation)

mergeddf5 <- mergeddf4

mergeddf5 <- mergeddf5 %>% select(`Project ID`, Project.Type, `Offset.Project Operator`, `Offsets issued`, `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`, `Percent of Offsets Sold (Estimated, as of Dec. 2018)`, Project.Name, `Vintage Year`, `Offset Designation`, `Type of Protocol`, `Invalidation Period End Date`, `Invalidation Start`, `Issuance Date`, Project.Documentation)

mergeddf5 <- rename(mergeddf5, "Vintage.Year" = "Vintage Year")
mergeddf5$`Offset Designation` <- as.factor(mergeddf5$`Offset Designation`)

mergeddf5 <- mergeddf5 %>% dplyr::arrange(desc(Vintage.Year))
#mergeddf5 <- mergeddf5 %>% dplyr::rename("Project.State" = "Project.State.x")

mergeddf5$`Issuance Date` <- mdy(mergeddf5$`Issuance Date`)

carbondatabasebetafeb2019 <-mergeddf5 %>% datatable(filter ='top', selection = 'multiple', rownames = FALSE,
                                             extensions = 'Buttons', options = list(initComplete = JS(
                                               "function(settings, json) {",
                                               "$('body').css({'font-family': 'Calibri'});",
                                               "}"
                                             ), autoWidth = TRUE, pageLength = 20, dom = 'Bfrtip', buttons = c('copy','excel', 'pdf', 'print'), rownames=FALSE,
                                             column = list(list(width = '150px', width = '50px')))) %>%
  DT::formatStyle(columns = c(1:13), fontSize = '75%')


carbondatabasebetafeb2019


names(mergeddf5)
mergedf6.5 <- mergeddf5

mergedf6.5 <- mergeddf5 %>% select(`Project ID`, Project.Type, `Offset.Project Operator`, Project.Name, `Offsets issued`,
                                   `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`, `Percent of Offsets Sold (Estimated, as of Dec. 2018)`,
                                   Vintage.Year, `Offset Designation`, `Type of Protocol`, `Invalidation Period End Date`,`Invalidation Start`,  `Issuance Date`, Project.Documentation)

mergedf6.6<- mergedf6.5[!duplicated(mergedf6.5[1:3]),]
mergedf6.6 <- mergedf6.6[rev(order(mergedf6.6$Vintage.Year)),] 
mergedf6.6$Project.Name[mergedf6.6$Project.Name == "Finite Carbon –"] <- ""

mergedf6.6$Project.Name<- gsub("-",":", mergedf6.6$Project.Name)
mergedf6.6$Project.Name<- gsub("–",": ", mergedf6.6$Project.Name)
mergedf6.6$Project.Name<- gsub("Finite Carbon: ","", mergedf6.6$Project.Name)
mergedf6.6$Project.Name<- gsub("Finite Carbon : ","", mergedf6.6$Project.Name)

write.csv(mergedf6.6, file = "./interactivecdb/Data/mergedf6.6.csv")
write.csv(mergedf6.6, file = "./mergedf6.6.csv")
write.csv(mergedf6.6, file = "./interactivecdb/mergedf6.6.csv")
getwd()
carbondatabasebetamar2019 <-mergedf6.6 %>% datatable(filter ='top', selection = 'multiple', rownames = FALSE,
                                                    extensions = 'Buttons', options = list(initComplete = JS(
                                                      "function(settings, json) {",
                                                      "$('body').css({'font-family': 'Calibri'});",
                                                      "}"
                                                    ), autoWidth = TRUE, pageLength = 20, dom = 'Bfrtip', buttons = c('copy','excel', 'pdf', 'print'), rownames=FALSE,
                                                    column = list(list(width = '150px', width = '50px'))))  %>% 
  DT::formatStyle(columns = c(1:13), fontSize = '75%')


carbondatabasebetamar2019


names(mergedfdatetest)
whatstheproblem <- mergedfdatetest %>% select(Project.ID, Project.Name)

names(mergedf6.6)

whatstheproblem$`Project ID` <- whatstheproblem$Project.ID
whatstheproblem$`Project.ID` <- NULL

names(whatstheproblem)
names(mergedf6.6)

test <- merge(mergedf6.6, whatstheproblem, by = "Project ID", all = T)





library(htmlwidgets)

saveWidget(carbondatabasebetamar2019, file = "carbondbupdate.html")

format

#"Find a developer" search tool

mergeddf7 <- mergedf6.5

#count of offset project issuances

#number of invalidations

#Percent of Offsets surrendered

#Years with project issuances 

# Project ID's 

#Project Locations 

#most recent Issuance 

# total offsets issued 

library(dplyr)
library(scales)

glimpse(mergeddf7)
mergeddf8 <- mergeddf7 %>% filter(`Type of Protocol` == "Compliance") %>% arrange(desc(Vintage.Year)) %>% group_by(`Offset.Project Operator`) %>%
  summarise("Offset Protocol(s)" = paste(unique(Project.Type), collapse = ", "),
    "Total Offsets Issuance" = sum(`Offsets issued`),
            "Total Number Unretired" = sum(`Number of Offsets Un-retired (Estimated, as of Dec. 2018)`),
            "Vintage Years" = paste(unique(Vintage.Year), collapse = ", "),
            "Project ID's" = paste((`Project ID`), collapse = ", ")
  mutate("Percent of Offsets Retired" = (`Total Offsets Issuance` - `Total Number Unretired`)/ `Total Offsets Issuance`) 

mergeddf8$`Number of Issuances` <- nchar(mergeddf8$`Project ID's`)
mergeddf8$`Number of Issuances` <- mergeddf8$`Number of Issuances`/11
mergeddf8$`Number of Issuances` <- round(mergeddf8$`Number of Issuances`)

mergeddf8 <- subset(mergeddf8, `Vintage Years` != 2015)
mergeddf9 <- subset(mergeddf8, `Vintage Years` != 2016)

mergeddf9$`Total Number Unretired` <- NULL
mergeddf9$n <- NULL

mergeddf9$`Percent of Offsets Retired` <- percent(mergeddf9$`Percent of Offsets Retired`)
mergeddf9$`Total Offsets Issuance` <- prettyNum(mergeddf9$`Total Offsets Issuance`, big.mark = ",")
mergeddf9$`Percent of Offsets Invalidated` <- "0%"

library(DT)
mergeddf9$`Offset.Project Operator` <- as.factor(mergeddf9$`Offset.Project Operator`)
mergeddf9$`Offset Protocol(s)` <- as.factor(mergeddf9$`Offset Protocol(s)`)
DeveloperDatabase <-mergeddf9 %>% datatable(filter ='top', selection = 'multiple', rownames = FALSE,
                                                    extensions = 'Buttons', options = list(initComplete = JS(
                                                      "function(settings, json) {",
                                                      "$('body').css({'font-family': 'Calibri'});",
                                                      "}"
                                                    ), autoWidth = TRUE, pageLength = 20, dom = 'Bfrtip', buttons = c('copy','excel', 'pdf', 'print'), rownames=FALSE,
                                                    column = list(list(width = '150px', width = '50px')))) %>%
  DT::formatStyle(columns = c(1:13), fontSize = '75%')

DeveloperDatabase


carbondatabasebetafeb2019



#Dairy
#New
#The





#mapping it
library(plotly)
library(sp)
library(sf)
library(tigris)
library(ggiraph)

states <- states(cb=T)
states %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons(popup=~NAME)
names(mergeddf5)

library(dplyr)

mappingdb2 <- mergeddf5 %>%
  group_by(`Vintage Year`) %>%
  summarize(total2=sum(`Offsets issued`))

mappingdb3 <- mergeddf5 %>%
  group_by(`Vintage Year`) %>%
  summarize(total2=sum(`Offsets issued`))




mappingdb <- mergeddf5 %>%
  group_by(Project.State, `Vintage Year`) %>%
  summarize(total2=sum(`Offsets issued`)) %>% 
  # Some quick adjustments to the the dataframe to clean up names
  rename(state=Project.State)

mappingdb$total2<- as.numeric(mappingdb$total2)

glimpse(mappingdb)

states_merged <- geo_join(states, mappingdb, "NAME", "state")
names(mappingdb)
names(states_merged)
table(states_merged$total)

# Creating a color palette based on the number range in the total column
bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("Greens", domain = states_merged$total2)


# Getting rid of rows with NA values
# Using the Base R method of filtering subset() because we're dealing with a SpatialPolygonsDataFrame and not a normal data frame, thus filter() wouldn't work

# Setting up the pop up text
popup_sb <- paste0("Total Offsets Issued: ", as.character(states_merged$total2))

names(states_merged)
table(mappingdb$state)
table(states_merged$NAME)


leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = states_merged,
              fillColor = ~pal(states_merged$total2),
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2,
              popup = ~popup_sb) %>%   
  addLayersControl(
    baseGroups = c("2013", "2014", "2015", "2016", "2017", "2018"),
    options = layersControlOptions(collapsed = FALSE))
    
