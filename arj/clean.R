library(gdata)
library(readxl)
library(XML)
library(tidyverse)
library(lubridate)

# Scrap data
tapi<- readHTMLTable("ging.html")
oni<- readHTMLTable("oni.html")
poto<- readHTMLTable("poto.html")
pum<- readHTMLTable("pum.html")
tapi<- readHTMLTable("tapi.html")
tom<- readHTMLTable("tom.html")

#convert Dataframe
tapi <- as.data.frame(tapi)
oni <- as.data.frame(oni)
poto <- as.data.frame(poto)
pum <- as.data.frame(pum)
tapi <- as.data.frame(tapi)
tom <- as.data.frame(tom)

#rename colnames
colnames(tom)
tom<- tom %>% 
        rename("Sl no."= "cphBody_GridPriceData.Sl.no.")

tom<- tom %>% 
        rename("District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")

gingi<- gingi %>% 
        rename("Sl no."= "cphBody_GridPriceData.Sl.no.", "District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
oni<- oni %>% 
        rename("Sl no."= "cphBody_GridPriceData.Sl.no.", "District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
poto<- poto %>% 
        rename("Sl no."= "cphBody_GridPriceData.Sl.no.", "District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
pum<- pum %>% 
        rename("Sl no."= "cphBody_GridPriceData.Sl.no.", "District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")
tapi<- tapi %>% 
        rename("Sl no."= "cphBody_GridPriceData.Sl.no.", "District Name"="cphBody_GridPriceData.District.Name",
               "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
               "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
               "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
               "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
               "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
               "Price Date"="cphBody_GridPriceData.Price.Date")


# write_csv(gingi,"gingi.csv")
# write_csv(oni,"oni.csv")
# write_csv(poto,"poto.csv")
# write_csv(pum,"pum.csv")
# write_csv(tapi,"tapi.csv")
# write_csv(tom,"tom.csv")

str(gingi)

gingi$`Min Price (Rs./Quintal)` <- as.integer(gingi$`Min Price (Rs./Quintal)`)
gingi$`Max Price (Rs./Quintal)` <- as.integer(gingi$`Max Price (Rs./Quintal)`)
gingi$`Modal Price (Rs./Quintal)` <- as.integer(gingi$`Modal Price (Rs./Quintal)`)

oni$`Min Price (Rs./Quintal)` <- as.integer(oni$`Min Price (Rs./Quintal)`)
oni$`Max Price (Rs./Quintal)` <- as.integer(oni$`Max Price (Rs./Quintal)`)
oni$`Modal Price (Rs./Quintal)` <- as.integer(oni$`Modal Price (Rs./Quintal)`)

poto$`Min Price (Rs./Quintal)` <- as.integer(poto$`Min Price (Rs./Quintal)`)
poto$`Max Price (Rs./Quintal)` <- as.integer(poto$`Max Price (Rs./Quintal)`)
poto$`Modal Price (Rs./Quintal)` <- as.integer(poto$`Modal Price (Rs./Quintal)`)

pum$`Min Price (Rs./Quintal)` <- as.integer(pum$`Min Price (Rs./Quintal)`)
pum$`Max Price (Rs./Quintal)` <- as.integer(pum$`Max Price (Rs./Quintal)`)
pum$`Modal Price (Rs./Quintal)` <- as.integer(pum$`Modal Price (Rs./Quintal)`)

tapi$`Min Price (Rs./Quintal)` <- as.integer(tapi$`Min Price (Rs./Quintal)`)
tapi$`Max Price (Rs./Quintal)` <- as.integer(tapi$`Max Price (Rs./Quintal)`)
tapi$`Modal Price (Rs./Quintal)` <- as.integer(tapi$`Modal Price (Rs./Quintal)`)

tom$`Min Price (Rs./Quintal)` <- as.integer(tom$`Min Price (Rs./Quintal)`)
tom$`Max Price (Rs./Quintal)` <- as.integer(tom$`Max Price (Rs./Quintal)`)
tom$`Modal Price (Rs./Quintal)` <- as.integer(tom$`Modal Price (Rs./Quintal)`)

str(gingi)

gingi$`Price Date` <- as.Date(gingi$`Price Date`,format = '%d %B %Y')
oni$`Price Date` <- as.Date(oni$`Price Date`,format = '%d %B %Y')
poto$`Price Date` <- as.Date(poto$`Price Date`,format = '%d %B %Y')
pum$`Price Date` <- as.Date(pum$`Price Date`,format = '%d %B %Y')
tapi$`Price Date` <- as.Date(tapi$`Price Date`,format = '%d %B %Y')
tom$`Price Date` <- as.Date(tom$`Price Date`,format = '%d %B %Y')

head(gingi)

 gingi<- gingi %>%
        mutate(year = lubridate::year(`Price Date`), 
                      month = lubridate::month(`Price Date`), 
                      day = lubridate::day(`Price Date`))
 
 oni<- oni %>%
         mutate(year = lubridate::year(`Price Date`), 
                month = lubridate::month(`Price Date`), 
                day = lubridate::day(`Price Date`))
 
 poto<- poto %>%
         mutate(year = lubridate::year(`Price Date`), 
                month = lubridate::month(`Price Date`), 
                day = lubridate::day(`Price Date`))

 pum<- pum %>%
         mutate(year = lubridate::year(`Price Date`), 
                month = lubridate::month(`Price Date`), 
                day = lubridate::day(`Price Date`)) 
 
 tapi<- tapi %>%
         mutate(year = lubridate::year(`Price Date`), 
                month = lubridate::month(`Price Date`), 
                day = lubridate::day(`Price Date`))

 tom<- tom %>%
         mutate(year = lubridate::year(`Price Date`), 
                month = lubridate::month(`Price Date`), 
                day = lubridate::day(`Price Date`)) 
 

 gingi <- gingi %>% 
         rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                model_price=`Modal Price (Rs./Quintal)`)

 oni <- oni %>% 
         rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                model_price=`Modal Price (Rs./Quintal)`)
 poto <- poto %>% 
         rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                model_price=`Modal Price (Rs./Quintal)`)
 pum <- pum %>% 
         rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                model_price=`Modal Price (Rs./Quintal)`)
 tapi <- tapi %>% 
         rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                model_price=`Modal Price (Rs./Quintal)`)
 tom <- tom %>% 
         rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                model_price=`Modal Price (Rs./Quintal)`)
 
 
t2020 <- gingi %>% 
        filter(year==2020) %>% 
         group_by(month) %>% 
         summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Ginger")

t2019 <- gingi %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Ginger")
t2018 <- gingi %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Ginger")
t2017 <- gingi %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Ginger")
t2016 <- gingi %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Ginger")
t2015 <- gingi %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Ginger")
t2014 <- gingi %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Ginger")
t2013 <- gingi %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Ginger")
t2012 <- gingi %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Ginger")
 
gingi_summ <- rbind(t2012,t2013,t2014,t2015,t2016,t2017,t2018,t2019,t2020)


o2020 <- oni %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Onion")

o2019 <- oni %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Onion")
o2018 <- oni %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Onion")
o2017 <- oni %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Onion")
o2016 <- oni %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Onion")
o2015 <- oni %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Onion")
o2014 <- oni %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Onion")
o2013 <- oni %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Onion")
o2012 <- oni %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Onion")

oni_summ <- rbind(o2012,o2013,o2014,o2015,o2016,o2017,o2018,o2019,o2020)



p2020 <- poto %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Potato")

p2019 <- poto %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Potato")
p2018 <- poto %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Potato")
p2017 <- poto %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Potato")
p2016 <- poto %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Potato")
p2015 <- poto %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Potato")
p2014 <- poto %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Potato")
p2013 <- poto %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Potato")
p2012 <- poto %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Potato")

poto_summ <- rbind(p2012,p2013,p2014,p2015,p2016,p2017,p2018,p2019,p2020)


pum2020 <- pum %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Pumpkin")

pum2019 <- pum %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Pumpkin")
pum2018 <- pum %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Pumpkin")
pum2017 <- pum %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Pumpkin")
pum2016 <- pum %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Pumpkin")
pum2015 <- pum %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Pumpkin")
pum2014 <- pum %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Pumpkin")
pum2013 <- pum %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Pumpkin")
pum2012 <- pum %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Pumpkin")

pum_summ <- rbind(pum2012,pum2013,pum2014,pum2015,pum2016,pum2017,pum2018,pum2019,pum2020)


tap2020 <- tapi %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Tapioca")

tap2019 <- tapi %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Tapioca")
tap2018 <- tapi %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Tapioca")
tap2017 <- tapi %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Tapioca")
tap2016 <- tapi %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Tapioca")
tap2015 <- tapi %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Tapioca")
tap2014 <- tapi %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Tapioca")
tap2013 <- tapi %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Tapioca")
tap2012 <- tapi %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Tapioca")

tapi_summ <- rbind(tap2012,tap2013,tap2014,tap2015,tap2016,tap2017,tap2018,tap2019,tap2020)


tom2020 <- tom %>% 
        filter(year==2020) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2020,Commodity="Tomato")

tom2019 <- tom %>% 
        filter(year==2019) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2019,Commodity="Tomato")
tom2018 <- tom %>% 
        filter(year==2018) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2018,Commodity="Tomato")
tom2017 <- tom %>% 
        filter(year==2017) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2017,Commodity="Tomato")
tom2016 <- tom %>% 
        filter(year==2016) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2016,Commodity="Tomato")
tom2015 <- tom %>% 
        filter(year==2015) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2015,Commodity="Tomato")
tom2014 <- tom %>% 
        filter(year==2014) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2014,Commodity="Tomato")
tom2013 <- tom %>% 
        filter(year==2013) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2013,Commodity="Tomato")
tom2012 <- tom %>% 
        filter(year==2012) %>% 
        group_by(month) %>% 
        summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
        mutate(year = 2012,Commodity="Tomato")

tom_summ <- rbind(tom2012,tom2013,tom2014,tom2015,tom2016,tom2017,tom2018,tom2019,tom2020)

main_df <- rbind(gingi_summ,
oni_summ,
poto_summ,
pum_summ,
tapi_summ,
tom_summ)

str(main_df)

main_df$model_price <- as.integer(main_df$model_price)
main_df$Commodity <- as.factor(main_df$Commodity)

summary(main_df)

write_csv(main_df,"all_in_one.csv")



ggplot(main_df, aes(Commodity,model_price, fill=Commodity))+
geom_bar(stat = "identity")        

summary(main_df)
