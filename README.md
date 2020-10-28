
# IranCovid <img src='man/figures/logo.png' align="right" height="139" />
<!-- badges: start -->
<!-- badges: end -->

The goal of IranCovid is to fetch Covid-19 data from [Johns Hopkins University](https://github.com/CSSEGISandData/COVID-19) Covid-19 Data repository and cleans the data.
you can also plot pretty figures with IranCovid, like plotting a colorful world map of covid-19 cases or plotting number of cases time series during a period of time for an arbitrary country

## Installation

You can install the released version of IranCovid from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("IranCovid")
```

## Example

This is a basic example which shows you how to plot a world map on 10-20-2020 for covid-19 Confirmed Cases:

``` r
library(IranCovid)
## basic example code
IranCovid::CovidWorldMap(10,20,2020,"Confirmed Cases")
```
and here is your world map figure:

![confirmed cases world map](https://github.com/pariyamd/IranCovid/blob/master/confirmed.png)

