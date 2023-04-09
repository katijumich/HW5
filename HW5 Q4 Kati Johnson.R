#HW5 Q4
#Kati Johnson

library(tidyr)
library(ggplot2)
library(dplyr)
library(forcats)
library(ggmap)
library(statebins)
library(sf)
library(geofacet)
library(ggspatial)
library(colorspace)
library(cowplot)
library(lubridate)

load("C:\\Users\\kati.johnson\\Desktop\\DATA\\house_prices.rda")

#this gathers the housing price index, date and state columns by key pairs for house price percentage and unemployment rate
house_prices%>%gather(key=measure, value=value, -c(house_price_index, date, state))->house_reshaped

ggplot(house_reshaped, aes(x =date, y =value, color = measure)) +
  geom_line() +
  facet_wrap( ~ state) +
  scale_x_continuous(breaks = ymd(c("1980-01-01",
                                    "2000-01-01", "2020-01-01")), labels = c("80", "00", "20")) 
