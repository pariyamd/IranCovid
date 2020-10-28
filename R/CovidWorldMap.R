#' @title CovidWorldMap
#' @description This function shows visual distribution of death/recovered/confirmed cases over a world map in a spesific date
#' @param day the day of wanted date
#' @param month the month of wanted date
#' @param year the year of wanted date
#' @param type type of data which can be of :"Recovered Cases","Confirmed Cases" and "Death Cases"
#' @return A world map figure which every country is shown by a colored point and the number of cases determines the size of each point
#' @examples IranCovid::CovidWorldMap(2,4,2020,"Death Cases")

library(maptools)
library(maps)
library(stringr)
library(ggmap)
CovidWorldMap<-function(day=1,month=10,year=2020,type="Confirmed Cases"){

  jh_data<-IranCovid::UpdateCovid()

  if (str_length(day)<2){
    day=str_c("0",day)
  }
  if (str_length(month)<2){
    month=str_c("0",month)
  }

  world_date<-jh_data%>%filter(Date==paste(month,day,year,sep='-'))%>%
    filter(Type==type)
  mapWorld <- borders("world", fill="white")
  ggplot() +
    mapWorld+
    geom_point(data=world_date, aes(x=Long, y=Lat,color=Country.Region,size=Num) )+
    theme(legend.position = "none")+
    labs(title = type)
}
