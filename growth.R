library(ecodata)
library(tidyverse)

gdp <- get_ecodata_allcountries_wb("https://data.worldbank.org/indicator/NY.GDP.PCAP.PP.CD")
gdp <- gdp |>
  filter(Date >= "2000-01-01", Date <= "2020-01-01")

# Poorest Countries
ggplot_ecodata_bar(gdp, title = "Poorest Countries",
                   plot_at = "last", lowest = 12, order = "ascend")

# Richest Countries
ggplot_ecodata_bar(gdp, title = "Richest Countries", highest = 12)

# Do I want to allow users to get highest / lowest locations, at a certain date?
# Then we can plot time series of GDP growth for those countries

# Do I want to allow percentage change for all variables?
gdp_growth <- ecodata_compute_pctchange(gdp)
