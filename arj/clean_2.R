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
#Rename sl_no and price_date tooo
bana <- bana %>% 
        rename(d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
               model_price=`Modal Price (Rs./Quintal)`)
bri <- bri %>% 
        rename(d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
               model_price=`Modal Price (Rs./Quintal)`)
cab <- cab %>% 
        rename(d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
               model_price=`Modal Price (Rs./Quintal)`)
paddy <- paddy %>% 
        rename(d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
               model_price=`Modal Price (Rs./Quintal)`)
pepp <- pepp %>% 
        rename(d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
               model_price=`Modal Price (Rs./Quintal)`)



bana$min_price <- as.integer(bana$min_price)
bana$max_price <- as.integer(bana$max_price)
bana$model_price<- as.integer(bana$model_price)

bri$min_price <- as.integer(bri$min_price)
bri$max_price <- as.integer(bri$max_price)
bri$model_price<- as.integer(bri$model_price)

cab$min_price <- as.integer(cab$min_price)
cab$max_price <- as.integer(cab$max_price)
cab$model_price<- as.integer(cab$model_price)

paddy$min_price <- as.integer(paddy$min_price)
paddy$max_price <- as.integer(paddy$max_price)
paddy$model_price<- as.integer(paddy$model_price)

pepp$min_price <- as.integer(pepp$min_price)
pepp$max_price <- as.integer(pepp$max_price)
pepp$model_price<- as.integer(pepp$model_price)


