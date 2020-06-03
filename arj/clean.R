library(gdata)
library(readxl)
library(XML)
library(tidyverse)
library(lubridate)

# Scrap data
gingi<- readHTMLTable("ging.html")
oni<- readHTMLTable("oni.html")
poto<- readHTMLTable("poto.html")
pum<- readHTMLTable("pum.html")
tapi<- readHTMLTable("tapi.html")
tom<- readHTMLTable("tom.html")

#convert Dataframe
gingi <- as.data.frame(gingi)
oni <- as.data.frame(oni)
poto <- as.data.frame(poto)
pum <- as.data.frame(pum)
tapi <- as.data.frame(tapi)
tom <- as.data.frame(tom)

# rename colnames -----------------------------------------------------------------------------

colnames(tom)
renam <- function(data) {
         data %>% 
                rename("Sl no."= "cphBody_GridPriceData.Sl.no.", "District Name"="cphBody_GridPriceData.District.Name",
                       "Market Name"="cphBody_GridPriceData.Market.Name", "Commodity"="cphBody_GridPriceData.Commodity",
                       "Variety"="cphBody_GridPriceData.Variety", "Grade"="cphBody_GridPriceData.Grade",
                       "Min Price (Rs./Quintal)"="cphBody_GridPriceData.Min.Price..Rs..Quintal.",
                       "Max Price (Rs./Quintal)"="cphBody_GridPriceData.Max.Price..Rs..Quintal.",
                       "Modal Price (Rs./Quintal)"="cphBody_GridPriceData.Modal.Price..Rs..Quintal.",
                       "Price Date"="cphBody_GridPriceData.Price.Date")
}
renam1 <- function(data) {
        data %>% 
                rename(sl_no=`Sl no.`,d_name =`District Name`,mar_name=`Market Name`,min_price=`Min Price (Rs./Quintal)`,max_price=`Max Price (Rs./Quintal)`,
                       model_price=`Modal Price (Rs./Quintal)`)
}

tom<- renam(tom)
gingi<- renam(gingi)
oni<- renam(oni)
poto<- renam(poto)
pum<- renam(pum)
tapi<- renam(tapi)

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

tom <- renam1(tom)
gingi <- renam1(gingi)
oni <- renam1(oni)
poto <- renam1(poto)
pum <- renam1(pum)
tapi <- renam1(tapi)

str(gingi)

str(gingi)

gingi$`Price Date` <- as.Date(gingi$`Price Date`,format = '%d %B %Y')
oni$`Price Date` <- as.Date(oni$`Price Date`,format = '%d %B %Y')
poto$`Price Date` <- as.Date(poto$`Price Date`,format = '%d %B %Y')
pum$`Price Date` <- as.Date(pum$`Price Date`,format = '%d %B %Y')
tapi$`Price Date` <- as.Date(tapi$`Price Date`,format = '%d %B %Y')
tom$`Price Date` <- as.Date(tom$`Price Date`,format = '%d %B %Y')

head(gingi)


# date function -------------------------------------------------------------------------------

datez <- function(data) {
        data %>%
                mutate(year = lubridate::year(`Price Date`), 
                       month = lubridate::month(`Price Date`), 
                       day = lubridate::day(`Price Date`))
}

gingi<- datez(gingi)
oni <- datez(oni)
poto <- datez(poto)
pum <- datez(pum)
tapi <- datez(tapi)
tom <- datez(tom)
 
str(gingi)

# create a fuction ----------------------------------------------------------------------------
organize <- function(data, y,com) {
         data %>% 
                filter(year=={{ y }}) %>% 
                group_by(month) %>% 
                summarise(model_price=mean(model_price),min_price=min(min_price),max_price =max(max_price)) %>% 
                mutate(year = {{ y }}, Commodity = com)
        
}

 t2018<-organize(gingi,2018,"ginger")
 t2020 <- organize(gingi,2020,"ginger")
 t2019 <- organize(gingi,2019,"ginger")
 t2017 <- organize(gingi,2017,"ginger")
 t2016 <- organize(gingi,2016,"ginger")
 t2015 <- organize(gingi,2015,"ginger")
 t2014 <- organize(gingi,2014,"ginger")
 t2013 <- organize(gingi,2013,"ginger")
 t2012 <- organize(gingi,2012,"ginger")
gingi_summ <- rbind(t2012,t2013,t2014,t2015,t2016,t2017,t2018,t2019,t2020)

o2018<-organize(oni,2018,"Onion")
o2020 <- organize(oni,2020,"Onion")
o2019 <- organize(oni,2019,"Onion")
o2017 <- organize(oni,2017,"Onion")
o2016 <- organize(oni,2016,"Onion")
o2015 <- organize(oni,2015,"Onion")
o2014 <- organize(oni,2014,"Onion")
o2013 <- organize(oni,2013,"Onion")
o2012 <- organize(oni,2012,"Onion")
oni_summ <- rbind(o2012,o2013,o2014,o2015,o2016,o2017,o2018,o2019,o2020)

p2018<-organize(poto,2018,"Pototo")
p2020 <- organize(poto,2020,"Pototo")
p2019 <- organize(poto,2019,"Pototo")
p2017 <- organize(poto,2017,"Pototo")
p2016 <- organize(poto,2016,"Pototo")
p2015 <- organize(poto,2015,"Pototo")
p2014 <- organize(poto,2014,"Pototo")
p2013 <- organize(poto,2013,"Pototo")
p2012 <- organize(poto,2012,"Pototo")
poto_summ <- rbind(p2012,p2013,p2014,p2015,p2016,p2017,p2018,p2019,p2020)

tom2020 <- organize(tom,2010,"tom")
tom2019 <- organize(tom,2019,"tom")
tom2018 <- organize(tom,2018,"tom")
tom2017 <- organize(tom,2017,"tom")
tom2016 <- organize(tom,2016,"tom")
tom2015 <- organize(tom,2015,"tom")
tom2014 <- organize(tom,2014,"tom")
tom2013 <- organize(tom,2013,"tom")
tom2012 <- organize(tom,2012,"tom")
tom_summ <- rbind(tom2012,tom2013,tom2014,tom2015,tom2016,tom2017,tom2018,tom2019,tom2020)


rm(tom2012,tom2013,tom2014,tom2015,tom2016,tom2017,tom2018,tom2019,tom2020)
rm(tap2012,tap2013,tap2014,tap2015,tap2016,tap2017,tap2018,tap2019,tap2020)
rm(pum2012,pum2013,pum2014,pum2015,pum2016,pum2017,pum2018,pum2019,pum2020)
rm(p2012,p2013,p2014,p2015,p2016,p2017,p2018,p2019,p2020)
rm(o2012,o2013,o2014,o2015,o2016,o2017,o2018,o2019,o2020)
rm(t2012,t2013,t2014,t2015,t2016,t2017,t2018,t2019,t2020)

main_df <- rbind(gingi_summ,
oni_summ,
poto_summ,
pum_summ,
tap_summ,
tom_summ)

str(main_df)

main_df$model_price <- as.integer(main_df$model_price)
main_df$Commodity <- as.factor(main_df$Commodity)

summary(main_df)

write_csv(main_df,"all_in_one.csv")
