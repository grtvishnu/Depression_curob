library(gdata)
library(readxl)
library(XML)
library(tidyverse)
library(lubridate)

bana <- readHTMLTable("bana.html")
bri <- readHTMLTable("brinj.html")
cab <- readHTMLTable("cab.html")
paddy <- readHTMLTable("paddy.html")
pepp <- readHTMLTable("pepper.html")


bana <- as.data.frame(bana)
bri <- as.data.frame(bri)
cab <- as.data.frame(cab)
paddy <- as.data.frame(paddy)
pepp <- as.data.frame(pepp)


bana<- bana %>% 
        rename("District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
bri<- bri %>% 
        rename("District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
cab<- cab %>% 
        rename("District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")

paddy<- paddy %>% 
        rename("District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
pepp<- pepp %>% 
        rename("District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
