#' @title UpdateCovid
#' @description this function fetches data from John Hopkins dataset
#' and reformats column names in a way  that each row represents
#' number of cases in a specific country for a specific date
#' @return a clean dataframe computed from John Hopkins dataset

library(dplyr)
library(dplyr)
library(tidyverse)
library(stringr)
library(lubridate)

UpdateCovid<-function(){

confirmed_global_raw=read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"))
recovered_global_raw=read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"))
death_global_raw=read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"))

# reformat column Date names for confirmed cases
columns=colnames(confirmed_global_raw)
columns[str_detect(columns,"^X")]=format(strptime(as.character(columns[str_detect(columns,"^X")]), "X%m.%d.%y"),"%m-%d-%Y")
colnames(confirmed_global_raw)=columns
confirmed_global<-
  confirmed_global_raw%>%
  mutate(Type="Confirmed Cases")

# reformat column Date names for recovered cases
columns=colnames(recovered_global_raw)
columns[str_detect(columns,"^X")]=format(strptime(as.character(columns[str_detect(columns,"^X")]), "X%m.%d.%y"),"%m-%d-%Y")
colnames(recovered_global_raw)=columns
recovered_global<-
  recovered_global_raw%>%
  mutate(Type="Recovered Cases")

# reformat column Date names for Death cases
columns=colnames(death_global_raw)
columns[str_detect(columns,"^X")]=format(strptime(as.character(columns[str_detect(columns,"^X")]), "X%m.%d.%y"),"%m-%d-%Y")
colnames(death_global_raw)=columns
death_global<-
  death_global_raw%>%
  mutate(Type="Death Cases")

output<-rbind(recovered_global,confirmed_global,death_global)
date_columns=c(setdiff(colnames(output),c("Province.State","Country.Region","Lat","Long","Type")))

output<-output%>%gather(Date,Num,date_columns)%>%
  arrange(Country.Region,Date,Type,Num)
return(output)
}
