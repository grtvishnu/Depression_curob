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

paddy <- paddy %>% 
        rename("sl_no"="cphBody_GridPriceData.Sl.no.","price_date"="Price Date" )

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

str(bana)
bana$price_date <- as.Date(bana$price_date,format = '%d %B %Y')
bri$price_date <- as.Date(bri$price_date,format = '%d %B %Y')
cab$price_date <- as.Date(cab$price_date,format = '%d %B %Y')
paddy$price_date <- as.Date(paddy$price_date,format = '%d %B %Y')
pepp$price_date <- as.Date(pepp$price_date,format = '%d %B %Y')

bana<- bana %>%
        mutate(year = lubridate::year(price_date), 
               month = lubridate::month(price_date), 
               day = lubridate::day(price_date))

bri<- bri %>%
        mutate(year = lubridate::year(price_date), 
               month = lubridate::month(price_date), 
               day = lubridate::day(price_date))

cab<- cab %>%
        mutate(year = lubridate::year(price_date), 
               month = lubridate::month(price_date), 
               day = lubridate::day(price_date))
paddy<- paddy %>%
        mutate(year = lubridate::year(price_date), 
               month = lubridate::month(price_date), 
               day = lubridate::day(price_date))
pepp<- pepp %>%
        mutate(year = lubridate::year(price_date), 
               month = lubridate::month(price_date), 
               day = lubridate::day(price_date))

ba2020 <- bana %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Banana")

ba2019 <- bana %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Banana")
ba2018 <- bana %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Banana")
ba2017 <- bana %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Banana")
ba2016 <- bana %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Banana")
ba2015 <- bana %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Banana")
ba2014 <- bana %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Banana")
ba2013 <- bana %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Banana")
ba2012 <- bana %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Banana")


bri2020 <- bri %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Brinju")

bri2019 <- bri %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Brinju")
bri2018 <- bri %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Brinju")
bri2017 <- bri %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Brinju")
bri2016 <- bri %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Brinju")
bri2015 <- bri %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Brinju")
bri2014 <- bri %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Brinju")
bri2013 <- bri %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Brinju")
bri2012 <- bri %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Brinju")


c2020 <- cab %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Cabbage")

c2019 <- cab %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Cabbage")
c2018 <- cab %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Cabbage")
c2017 <- cab %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Cabbage")
c2016 <- cab %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Cabbage")
c2015 <- cab %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Cabbage")
c2014 <- cab %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Cabbage")
c2013 <- cab %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Cabbage")
c2012 <- cab %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Cabbage")


pad2020 <- paddy %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Paddy")

pad2019 <- paddy %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Paddy")
pad2018 <- paddy %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Paddy")
pad2017 <- paddy %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Paddy")
pad2016 <- paddy %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Paddy")
pad2015 <- paddy %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Paddy")
pad2014 <- paddy %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Paddy")
pad2013 <- paddy %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Paddy")
pad2012 <- paddy %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Paddy")



pep2020 <- pepp %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Pepper")

pep2019 <- pepp %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Pepper")
pep2018 <- pepp %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Pepper")
pep2017 <- pepp %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Pepper")
pep2016 <- pepp %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Pepper")
pep2015 <- pepp %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Pepper")
pep2014 <- pepp %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Pepper")
pep2013 <- pepp %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Pepper")
pep2012 <- pepp %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Pepper")


