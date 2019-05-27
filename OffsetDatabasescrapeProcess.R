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
library(rPython)
#first, pull this pdf and convert to Excel in Acrobat. https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/arb_offset_credit_issuance_table.pdf

library(reticulate)
repl_python()
os <- import("os")
os$listdir(".")
py_run_string("import pandas")
repl_python(from tabula import convert_into)
getwd()

py_run_string("from tabula import convert_into")


reticulate::py_run_string("print('hello')")

py_run_string("convert_into('https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/arb_offset_credit_issuance_table.pdf', 'output3.csv', output_format = 'tsv', pages='all'")

import_from_path("dbscrape.py")

use_python("C:/Users/Jordan/AppData/Local/Programs/Python", required = T)

```{python}
import numpy as np
my_python_array = np.array([2,4,6,8])
for item in my_python_array:
  print(item)
```
library(data.table)
arb_offset_credit_issuance_table2 <- read.csv("C:/Users/Jordan/output5.csv", skip = 4)
glimpse(arb_offset_credit_issuance_table2)
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

arb_offset_credit_issuance_table3 <- subset(arb_offset_credit_issuance_table2, !is.na(other))
arb_offset_credit_issuance_table3$Project.Name <- arb_offset_credit_issuance_table3$other

arb_offset_credit_issuance_table3$Type.of.Protocol <- "Compliance"

arb_offset_credit_issuance_table2 <- rbind(arb_offset_credit_issuance_table2, arb_offset_credit_issuance_table3)

#arb_offset_credit_issuance_table <- read_excel("C:/Users/Jordan/Desktop/E2/arb_offset_credit_issuance_table512.xlsx", skip = 4)

arb_offset_credit_issuance_table <- arb_offset_credit_issuance_table2

arb_offset_credit_issuance_table <- subset(arb_offset_credit_issuance_table, Type.of.Protocol != "")
arb_offset_credit_issuance_table <- subset(arb_offset_credit_issuance_table, Project.Name != "")

arb_offset_credit_issuance_table <- subset(arb_offset_credit_issuance_table, `ARB Project ID #` != "ARB Project ID #")

arb_offset_credit_issuance_table$other <- NULL

glimpse(arb_offset_credit_issuance_table)
arb_offset_credit_issuance_table$X <- NULL
#arb_offset_credit_issuance_table$X__2 <- NULL
#arb_offset_credit_issuance_table$X__3 <- NULL
#arb_offset_credit_issuance_table$X__4 <- NULL
#arb_offset_credit_issuance_table$X__5 <- NULL
#arb_offset_credit_issuance_table$X__6 <- NULL


X2015_2017compliancereport <- read_excel("C:/Users/Jordan/Desktop/E2/2015-2017compliancereport.xlsx", 
                                         sheet = "2015-2017 Offset Detail", skip = 4)

#arbcrossreference<- read.csv("C:/Users/Jordan/Desktop/E2/CARxreference.csv")


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

urlcreatorai <- function(ProjectID) {
  url <- paste("https://www.arb.ca.gov/cc/capandtrade/offsets/issuance/",tolower(ProjectID),"-a-i.pdf", sep = "")
  return(tolower(url))
}

#Renaming to match new upload method
names(arb_offset_credit_issuance_table)
arb_offset_credit_issuance_table <- rename(arb_offset_credit_issuance_table, "ARB Project ID #" = "ARB.Project.ID..")


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


#subset of urls "-a"
arb_offset_credit_issuance_table$newurla<- urlcreatora(arb_offset_credit_issuance_table$`ARB Project ID #`)

asub <- as.vector(subset(arb_offset_credit_issuance_table, FirstIssuanceTest == "TRUE"))
urlsavector <- as.vector(asub$newurla)
namesavector <- as.vector(asub$`ARB Project ID #`)
urlsavector

p_walk2(urlsavector, namesavector, download.file, mode = "wb")

raw_text <- purrr::map(namesavector, pdf_text)
raw_text <- str_split(raw_text, "\n", simplify = TRUE)
raw_text <- as.data.frame(raw_text)
raw_texta <- raw_text

#subset of urls "-a-b"

absub <- as.vector(subset(arb_offset_credit_issuance_table, SecondIssuanceTest == "TRUE"))

urlsabvector <- as.vector(absub$newurlab)
namesabvector <- as.vector(absub$`ARB Project ID #`)

p_walk2(urlsabvector, namesabvector, download.file, mode = "wb")

raw_textab <- purrr::map(namesabvector, pdf_text)

raw_textab <- str_split(raw_textab, "\n", simplify = TRUE)

raw_textab <- as.data.frame(raw_textab)

#subset of urls "-a-c"

acsub <- as.vector(subset(arb_offset_credit_issuance_table, ThirdIssuanceTest == "TRUE"))

urlsacvector <- as.vector(acsub$newurlac)
namesacvector <- as.vector(acsub$`ARB Project ID #`)

p_walk2(urlsacvector, namesacvector, download.file, mode = "wb")

raw_textac <- purrr::map(namesacvector, pdf_text)

raw_textac <- str_split(raw_textac, "\n", simplify = TRUE)

raw_textac <- as.data.frame(raw_textac)

#subset of urls "-a-d"

adsub <- as.vector(subset(arb_offset_credit_issuance_table, FourthIssuanceTest == "TRUE"))

urlsadvector <- as.vector(adsub$newurlad)
namesadvector <- as.vector(adsub$`ARB Project ID #`)

p_walk2(urlsadvector, namesadvector, download.file, mode = "wb")

raw_textad <- purrr::map(namesadvector, pdf_text)

raw_textad <- str_split(raw_textad, "\n", simplify = TRUE)

raw_textad <- as.data.frame(raw_textad)


#subset of urls "-a-e"

aesub <- as.vector(subset(arb_offset_credit_issuance_table, FifthIssuanceTest == "TRUE"))

urlsaevector <- as.vector(aesub$newurlae)
namesaevector <- as.vector(aesub$`ARB Project ID #`)

p_walk2(urlsaevector, namesaevector, download.file, mode = "wb")

raw_textae <- purrr::map(namesaevector, pdf_text)

raw_textae <- str_split(raw_textae, "\n", simplify = TRUE)

raw_textae <- as.data.frame(raw_textae)


#subset of urls "-a-f"

afsub <- as.vector(subset(arb_offset_credit_issuance_table, SixthIssuanceTest == "TRUE"))

urlsafvector <- as.vector(afsub$newurlaf)
namesafvector <- as.vector(afsub$`ARB Project ID #`)

p_walk2(urlsafvector, namesafvector, download.file, mode = "wb")

raw_textaf <- purrr::map(namesafvector, pdf_text)

raw_textaf <- str_split(raw_textaf, "\n", simplify = TRUE)

raw_textaf <- as.data.frame(raw_textaf)

#subset of urls "-a-g"

agsub <- as.vector(subset(arb_offset_credit_issuance_table, SeventhIssuanceTest == "TRUE"))

urlsagvector <- as.vector(agsub$newurlag)
namesagvector <- as.vector(agsub$`ARB Project ID #`)

p_walk2(urlsagvector, namesagvector, download.file, mode = "wb")

raw_textag <- purrr::map(namesagvector, pdf_text)

raw_textag <- str_split(raw_textag, "\n", simplify = TRUE)

raw_textag <- as.data.frame(raw_textag)


#subset of urls "-a-h"

ahsub <- as.vector(subset(arb_offset_credit_issuance_table, EighthIssuanceTest == "TRUE"))

urlsahvector <- as.vector(ahsub$newurlah)
namesahvector <- as.vector(ahsub$`ARB Project ID #`)

p_walk2(urlsahvector, namesahvector, download.file, mode = "wb")

raw_textah <- purrr::map(namesahvector, pdf_text)

raw_textah <- str_split(raw_textah, "\n", simplify = TRUE)

raw_textah <- as.data.frame(raw_textah)


#subset of urls "-a-i"

aisub <- as.vector(subset(arb_offset_credit_issuance_table, NinthIssuanceTest == "TRUE"))

urlsaivector <- as.vector(aisub$newurlai)
namesaivector <- as.vector(aisub$`ARB Project ID #`)

p_walk2(urlsaivector, namesaivector, download.file, mode = "wb")

raw_textai <- purrr::map(namesaivector, pdf_text)

raw_textai <- str_split(raw_textai, "\n", simplify = TRUE)

raw_textai <- as.data.frame(raw_textai)


ajsub <- as.vector(subset(arb_offset_credit_issuance_table, TenthIssuanceTest == "TRUE"))

urlsajvector <- as.vector(ajsub$newurlaj)
namesajvector <- as.vector(ajsub$`ARB Project ID #`)

p_walk2(urlsajvector, namesajvector, download.file, mode = "wb")

raw_textaj <- purrr::map(namesajvector, pdf_text)

raw_textaj <- str_split(raw_textaj, "\n", simplify = TRUE)

raw_textaj <- as.data.frame(raw_textaj)


#subset of urls "-a-k"

aksub <- as.vector(subset(arb_offset_credit_issuance_table, EleventhIssuanceTest == "TRUE"))

urlsakvector <- as.vector(aksub$newurlak)
namesakvector <- as.vector(aksub$`ARB Project ID #`)

p_walk2(urlsakvector, namesakvector, download.file, mode = "wb")

raw_textak <- purrr::map(namesakvector, pdf_text)

raw_textak <- str_split(raw_textak, "\n", simplify = TRUE)

raw_textak <- as.data.frame(raw_textak)



Fullbind <- bind_rows(raw_texta, raw_textab, raw_textac, raw_textad, raw_textae, raw_textaf, raw_textag, raw_textah, raw_textai, raw_textaj, raw_textak)

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

names(tableoutput)

names(X2015_2017compliancereport)
offsetssold <- X2015_2017compliancereport %>% group_by(`ARB Project ID #`) %>% dplyr:::summarize(Quantity = sum(Quantity))


offsetssold <- rename(offsetssold, "projectid" = "ARB Project ID #")

tableoutput <- rename(tableoutput, "projectid" = "Project ID")


mergedfinal109 <- merge(tableoutput, offsetssold, by = "projectid", all.x = T)
names(arb_offset_credit_issuance_table)
arboffsets <- arb_offset_credit_issuance_table %>% select(`ARB Project ID #`, Project.Name, Type.of.Protocol, Offset.Project.Operator, Project.Type)

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
                                        Invalidation_start, Quantity, Project.Name, Type.of.Protocol, Offset.Project.Operator, Project.Type)

Issuance1 <- Issuance1 %>% select(projectid, Start_Reporting_Date, End_Reporting_Date, Vintage_Year, Offsets_issued, OffsetsinForestBuffer, Issuance_Date, Invalidation_Length,
                                        Invalidation_start, Quantity, Project.Name, Type.of.Protocol, Offset.Project.Operator, Project.Type)
Issuancetable <- rbind(forestbuffer, Issuance1)

attach(Issuancetable)
Issuancetable2 <- Issuancetable[order(Invalidation_Length),] 

Issuancetable2$dupconcat <- paste(Issuancetable2$projectid, Issuancetable2$Offsets_issued, Issuancetable2$Vintage_Year, Issuancetable2$Start_Reporting_Date)

Issuancetable2$duplicatecheck <- duplicated(Issuancetable2$dupconcat)

viewdup <- subset(Issuancetable2, duplicatecheck == "TRUE")

Issuancetable3 <- subset(Issuancetable2, duplicatecheck != "TRUE")


#identifying duplicates

names(duplicates)

names(Issuancetable3)

Issuancetable3$Offsets_issued <- as.numeric(gsub(",","",Issuancetable3$Offsets_issued))
Issuancetable3$OffsetsinForestBuffer <- as.numeric(gsub(",","",Issuancetable3$OffsetsinForestBuffer))
library(tidyverse)
Issuancetable3$OffsetsinForestBuffer <- replace_na(Issuancetable3$OffsetsinForestBuffer, 0)
Issuancetable3$Quantity <- replace_na(Issuancetable3$Quantity, 0)

Issuancetable3$numberremaining <- (Issuancetable3$Offsets_issued- Issuancetable3$OffsetsinForestBuffer) - Issuancetable3$Quantity

Issuancetable3$percentsold <- Issuancetable3$Quantity/(Issuancetable3$Offsets_issued - Issuancetable3$OffsetsinForestBuffer)

table(Issuancetable3$numberremaining)
table(Issuancetable3$percentsold)



#data clean, now formatting


library(kableExtra)
library(dplyr)
library(devtools)

library(formattable)
library(DT)

mergeddf <- Issuancetable3

mergeddf$IssuanceLetter <- NULL
mergeddf$dupconcat <- NULL
mergeddf$duplicatecheck <- NULL
mergeddf$`Project Type` <- as.factor(mergeddf$Project.Type)
mergeddf$`Offset Project Operator` <- as.factor(mergeddf$Offset.Project.Operator)
mergeddf$`Project Name` <- as.factor(mergeddf$Project.Name)
mergeddf$`Type of Protocol` <- as.factor(mergeddf$Type.of.Protocol)
mergeddf$Vintage_Year <- as.factor(mergeddf$Vintage_Year)


mergeddf2 <- subset(mergeddf, Vintage_Year != "")

head(mergeddf2)

library(lubridate)
library(dplyr)
names(mergeddf2)

mergeddf2$Invalidation_start <- mdy(mergeddf2$Invalidation_start)

mergeddf2$invalidationend <- ymd(mergeddf2$Invalidation_start) + years(mergeddf2$Invalidation_Length)

mergeddf2<- mergeddf2[rev(order(as.Date(mergeddf2$Invalidation_start, format="%m/%d/%Y"))),]

mergeddf2$date <- Sys.Date()


mergeddf2$diff_in_days<- difftime(mergeddf2$date, mergeddf2$Invalidation_start, units = c("days"))
                                  
mergeddf2$diff_in_days <- as.numeric(mergeddf2$diff_in_days)   

mergeddf2$diff_in_year <- mergeddf2$diff_in_days/365


mergeddf2$Invalidation_Length <- as.numeric(mergeddf2$Invalidation_Length)

mergeddf2$Invalidation2 <- ifelse(mergeddf2$diff_in_year > mergeddf2$Invalidation_Length, 0, mergeddf2$Invalidation_Length)

names(mergeddf2)

mergeddf2$date <- NULL
mergeddf2$diff_in_days <- NULL
mergeddf2$diff_in_year <- NULL


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

names(mergeddf2)

mergeddf2$`Project Documentation` <- NULL
#mergeddf2$OffsetsinForestBuffer <- NULL
mergeddf2$`Reporting Start Date` <- NULL
mergeddf2$`Reporting End Date` <- NULL
mergeddf2$`Invalidation Start` <- NULL



names(mergeddf2)

names(mergeddf2)

table(mergeddf2$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`)

mergeddf3 <- mergeddf2 %>% select(`Type of Protocol`, `Project Type`, `Offsets issued`, `Offset Project Operator`, `Vintage Year`, `Offset Designation`, `Invalidation Period End Date`, `Project Name`, `Issuance Date`, `Project ID`, `Invalidation Length`, `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`,  `Percent of Offsets Sold (Estimated, as of Dec. 2018)`, OffsetsinForestBuffer)

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

mergeddf4 <- mergeddf4 %>% select(`Project ID`, Project.Type, `Offset.Project Operator`, `Offset Designation`, `Invalidation Period End Date`, `Offsets issued`, `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`, `Percent of Offsets Sold (Estimated, as of Dec. 2018)`, Project.Name, `Vintage Year`, `Invalidation Length`,  `Type of Protocol`)

mergeddf5 <- mergeddf4

mergeddf5 <- merge(mergeddf5, locationdf2, by = "Project ID", all.x = TRUE)


names(mergeddf5)
mergeddf5 <- mergeddf5 %>% select(`Project ID`, Project.Type, `Offset.Project Operator`, `Offsets issued`, `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`, `Percent of Offsets Sold (Estimated, as of Dec. 2018)`, Project.Name, `Vintage Year`, `Offset Designation`, Project.State.x, `Type of Protocol`, `Invalidation Period End Date`)

mergeddf5 <- rename(mergeddf5, "Vintage.Year" = "Vintage Year")
mergeddf5$`Offset Designation` <- as.factor(mergeddf5$`Offset Designation`)

mergeddf5 <- mergeddf5 %>% dplyr::arrange(desc(Vintage.Year))
mergeddf5 <- mergeddf5 %>% dplyr::rename("Project.State" = "Project.State.x")

carbondatabasebetafeb2019 <-mergeddf5 %>% datatable(filter ='top', selection = 'multiple', rownames = FALSE,
                                             extensions = 'Buttons', options = list(initComplete = JS(
                                               "function(settings, json) {",
                                               "$('body').css({'font-family': 'Calibri'});",
                                               "}"
                                             ), autoWidth = TRUE, pageLength = 20, dom = 'Bfrtip', buttons = c('copy','excel', 'pdf', 'print'), rownames=FALSE,
                                             column = list(list(width = '150px', width = '50px')))) %>%
  DT::formatStyle(columns = c(1:13), fontSize = '75%')


carbondatabasebetafeb2019

namelookup <- mergeddf5 %>% group_by(`Offset.Project Operator`, Project.Name, Project.State) %>% summarise(Offsets = sum(`Offsets issued`))

write.csv(namelookup, "namelookup.csv")
getwd()
namelookup <- read.csv("C:/Users/Jordan/Documents/E2/namelookup.csv")
#establish developer lookup
mergeddf5.5 <- merge(mergeddf5, namelookup , by = c("Project.Name"), all.x = T)

mergeddf6 <- mergeddf5.5

names(mergeddf6)

mergeddf6$ProjectDeveloper <- word(mergeddf6$`Offset.Project Operator`,1,2)

table(mergeddf6$ProjectDeveloper)

mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="ABEC", "California Bioenergy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Ag Power", "Ag Power Llc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="A-Gasa", "A-Gas")

mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Ahtna, Incorporated,", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Allegheny Rural", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Alliance Dairies", "Alliance Dairies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Aurora Ridge", "Aurora Ridge Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Bascom Pacific,", "Bascom Pacific")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Berry Summit,", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Biothermica Coal", "Biothermica Coal Carbon Inc.")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Blue Mountain", "Blue Mountain Biogas.")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Bridgewater Dairy,", "Bridgewater Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Brinkley Melvin", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Brook View", "Brook View Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="California Bioenergy,", "California Bioenergy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Cargill, Inc.", "Cargill, Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Central Sands", "Central Sands Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Coastal Ridges", "Coastal Ridges LLC")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Confederated Tribes", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Congaree TLP,", "Congaree River LLC")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Connecticut Lakes", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Coolgas, Inc.", "A-Gas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Cow Poo,", "Cow Poo LLc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="CSE Operating", "CSE")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="David Family", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Davis Family", "High Island Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="DF-AP#1, LLC", "Big Sky Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Diversified Pure", "A-Gas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Downeast Lakes", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Edaleen Cow", "Edaleen Cow Power")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Edward Mill", "Edward Miller Trust")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Environmental Credit", "Environmental Credit Corp")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="EOS Climate,", "EOS Climate (Blue Source)")

mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Fair Oaks", "Fair Oaks Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Farm Power", "Farm Power Lynden")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Fiscalini Properties,", "Fiscalini Properties")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Fred M.", "Pacific Forest Trust")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Gallo Cattle", "Blue Spruce Energy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="George DeRuyter", "George DeRuyter and Sons Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Gardeau ", "Gardeau Crest Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="GLS Woodlands,", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Goodman Forest,", "Blue Source")
#mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Green", "Green Valley Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Grey K", "Blue Spruce Energy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="GLS Woodlands,", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Grotegut Dairy", "Grotegut Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Hanes Ranch", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Heartwood Forestland", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Hanes Ranch", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Holland M.", "Green Assets")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Holsum Dairies,", "Holsum Dairies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Honeywell", "Honeywell Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Ideal Family", "Ideal Family Farms")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Jackson Timberland", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Keyrock Energy,", "Keyrock Energy Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Lamb Farms,", "Lamb Dairy Digesters")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Lukens Island", "Green Assets")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Maas Energy", "Maas Energy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Mailliard Ranch,", "Mailliard Ranch")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Maple Leaf", "Maple Leaf Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Massachusetts ", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Mattamuskeet", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Ideal", "Ideal Family Farms")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="McElroy Green", "McElroy Green Marketing")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Mescalero Apache", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Michael A.", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Middleton Place,", "Green Assets")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Milbury Plantation", "Green Assets")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="MWF Brimstone", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="National Audubon", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Norfolk Southern", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="North Fork", "Vessels Coal Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Northeast Wilderness", "Northeast Wilderness Trust")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Open Sky", "Open Sky Ranch Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Origin Climate", "Origin Climate Inc.")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Pagel's Ponderosa", "Pagel's Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Passamaquoddy Joint", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Peabody Natural", "Peabody Natural Gas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Perfect Score", "Perfect Score Technologies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Potlatch Forest", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Pure Chem", "A-Gas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Quercus West", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="RapRec Refridgerants,", "Rap Rec Refridgerants")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Reclamation", "A-Gas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Refrigerant Exchange", "Refridgerant Exchange Corp")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="RES Agriculture", "RES Agriculture")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Riverview, LLP", "Riverview LLP")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Roeslein Alternative", "Roeslein Alternative Energy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Ronald Glass", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Ross Bewley", "Bewley Ranches")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Round Valley", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Scenic View", "3Degrees")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Sealaska Corporation", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Shannondale Carbon,", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Sierra Pacific", "Sierra Pacific Industries")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Solar &", "Solar & Renewables Management")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Solvay Chemicals,", "Solvay Chemicals Inc.")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Statz Bros.,", "Statz Bros Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Storms", "Storms Hog Power")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Sunny Knoll", "Sunny Knoll Farms")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Sustainable", "The Conservation Fund")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Synergy Biogas,", "Synergy Biogas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Tennessee River", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Tradewater, LLC", "Tradewater LLC")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Trinity Timberlands,", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Usal", "Redwood Forest Foundation Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="UW-Oshkosh", "Rosendale Foundation")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Van Erk", "Van Erk Digester")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Verdeo McElroy,", "McElroy Green Marketing")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Vessels Coal", "Vessels Coal Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Wabashco, LLC", "Wabashco, Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Western Rivers", "Western Rivers Forestry")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="White Mountain", "White Mountain Apache Tribe")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Willet Dairy,", "Willet Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Willow Point", "Willow Point Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Wilshire Stanford", "Wilshire Stanford Offsets")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Wolf River", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="WTE Wakker,", "WTE Dairies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="WTE Dairyland,", "WTE Dairies")

table(mergeddf6$ProjectDeveloper)
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="3Degrees Group,", "3Degrees")

mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="WTE Deer", "WTE Dairies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="WTE-Dallmann, LLC", "WTE Dairies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="WTE-S&S Ag", "WTE Dairies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Yurok Tribe", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="AMC", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Compatible Lands", "Eco Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="GJ Tevelde", "GJ TeVelde Ranch")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Hudson", "Hudson Technologies")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Irony, Inc", "Irony, Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Mendocino Redwood", "Mendocino Redwood Company")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Nisqually Land", "Washington Environmental Council")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Pacific Forest", "Pacific Rim Dairy Digester")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Philip", "Verwey Hanford Dairy Digester")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Pixley Biogas,", "Pixley Biogas")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="TMF Biofuels,", "TMF Biofuels")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Upper Hudson", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Woodcrest Dairy,", "Woodcrest Dairy Digester")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Rips Redwoods,", "Rips Redwoods")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="GM Gabrych", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="CTB Timberland", "Green Assets")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Corrigan TLP,", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Great Mountain", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Montesol, LLC", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Northwoods ATP,", "Blue Source")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Swiss Valley", "Swiss Family Farms")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Eddie Ranch", "Forest Carbon Partners")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper=="Wisconsin Northern", "Blue Source")

table(mergeddf6$ProjectDeveloper)

mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "Dairy Energy,", "Dairy Energy Inc")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "Dairy Dreams,", "Native Energy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "New Energy", "New Energy One")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "New England", "Finite Carbon")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "The Climate", "The Climate Trust")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "The Conservation", "The Conservation Fund")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "The Nature", "The Nature Conservancy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "Green Valley Dairy,", "Green Valley Dairy")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "Green Diamond", "Green Diamond Resource Company")
mergeddf6$ProjectDeveloper <- replace(mergeddf6$ProjectDeveloper, mergeddf6$ProjectDeveloper == "Arlin Benner", "Yippee Farms")


names(mergeddf6)

mergeddf6$`Offset.Project Operator` <- mergeddf6$ProjectDeveloper

mergeddf6$ProjectDeveloper <- NULL
mergeddf6$ProjectDeveloper2 <- NULL

mergeddfsave <- mergeddf6

mergeddf6 <- mergeddfsave

mergeddf6$`Offset.Project Operator` <- as.factor(mergeddf6$`Offset.Project Operator`)

#mergeddf6$`Number of Offsets Un-retired (Estimated, as of Dec. 2018)`[is.na(mergeddf6$`Number of Offsets Un-retired (Estimated, as of Dec. 2018)`)] <- 0
#mergeddf6$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`[is.na(mergeddf6$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`)] <- 0

mergeddf6$`Number of Offsets Un-retired (Estimated, as of Dec. 2018)` <- as.numeric(mergeddf6$`Number of Offsets Un-retired (Estimated, as of Dec. 2018)`)


#mergeddf6$`Percent of Offsets Sold (Estimated, as of Dec. 2018)` <- as.numeric(mergeddf6$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`)
#mergeddf6$`Percent of Offsets Sold (Estimated, as of Dec. 2018)` <- scales::percent(mergeddf6$`Percent of Offsets Sold (Estimated, as of Dec. 2018)`)

mergeddf6$Project.State <- mergeddf6$Project.State.y

names(mergeddf6)

mergedf6.5 <- mergeddf6 %>% select(`Project ID`, Project.Type, `Offset.Project Operator`, Project.Name, Project.State, `Offsets issued`,
                                   `Number of Offsets Un-retired (Estimated, as of Dec. 2018)`, `Percent of Offsets Sold (Estimated, as of Dec. 2018)`,
                                   Vintage.Year, `Offset Designation`, `Type of Protocol`, `Invalidation Period End Date`
                                   )

mergedf6.6<- mergedf6.5[!duplicated(mergedf6.5[1:3]),]
library(DT)
names(mergedf6.6)
mergedf6.6 <- mergedf6.6[rev(order(mergedf6.6$Vintage.Year)),] 

write.csv(mergedf6.6, "mergedf6.6.csv")

carbondatabasebetamar2019 <-mergedf6.6 %>% datatable(filter ='top', selection = 'multiple', rownames = FALSE,
                                                    extensions = 'Buttons', options = list(initComplete = JS(
                                                      "function(settings, json) {",
                                                      "$('body').css({'font-family': 'Calibri'});",
                                                      "}"
                                                    ), autoWidth = TRUE, pageLength = 20, dom = 'Bfrtip', buttons = c('copy','excel', 'pdf', 'print'), rownames=FALSE,
                                                    column = list(list(width = '150px', width = '50px'))))  %>% 
  DT::formatStyle(columns = c(1:13), fontSize = '75%')


carbondatabasebetamar2019









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
            "Project ID's" = paste((`Project ID`), collapse = ", "),
            "Project Locations" = paste(unique(Project.State), collapse = ", ")) %>% 
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
    
