#' @title CountryTimeSeries
#' @description shows a figure of covid cases in a period of time for a specific country
#' @param from start of the period with the format of "%m-%d-%Y"
#' @param end end of the period with the format of "%m-%d-%Y"
#' @param country
#' @return plots a figure of covid cases in a period of time in the determied country
library(lubridate)
library(dplyr)
CountryTimeSeries<-function(from="04-20-2020",to="10-28-2020",country="Iran"){

  jh_data<-IranCovid::UpdateCovid()
  period<-jh_data%>%
    filter(as.Date(from,"%m-%d-%Y")<=as.Date(Date,"%m-%d-%Y") & as.Date(Date,"%m-%d-%Y")<=as.Date(to,"%m-%d-%Y"))%>%
    filter(Country.Region==country)%>%
    arrange(Date)

  ggplot(period,aes(x = as.Date(Date,"%m-%d-%Y"), y = Num,color=Type)) +
    geom_line()
  }
