library(httr)
library(tibble)
library(purrr)
library(dplyr)
all_results = GET('https://data.cityofchicago.org/resource/pnau-cf66.json')

content(all_results) |> 
  map(~{
    .x$name = .x$link$description
    .x$link = .x$link$url
    
    return(as_tibble(.x))
  }) |> 
  bind_rows()

