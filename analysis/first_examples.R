
ncei_url <- "https://www.ncei.noaa.gov/access/services/data/v1"

global_summary_ex_json <- paste0(ncei_url, "?dataset=global-summary-of-the-year&dataTypes=DP01,DP05,DP10,DSND,DSNW,DT00,DT32,DX32,DX70,DX90,SNOW,PRCP&stations=ASN00084027&startDate=1952-01-01&endDate=1970-12-31&includeAttributes=true&format=json")

response <- httr2::request(global_summary_ex_json) |>
  httr2::req_perform()

httr2::resp_check_status(response)

foo <- httr2::resp_body_json(response, simplifyVector = TRUE)

foo

# ?dataset=daily-summaries

# do not include the `GHCND:` before the station
daily_summaries_ex_json <- paste0(ncei_url, "?dataset=daily-summaries&dataTypes=PRCP&stations=USC00198368&startDate=2022-01-01&endDate=2022-12-31&includeAttributes=false&format=json")

response <- httr2::request(daily_summaries_ex_json) |>
  httr2::req_perform()

httr2::resp_check_status(response)

foo <- httr2::resp_body_json(response, simplifyVector = TRUE)

foo




response <- httr2::request(global_summary_ex_json) |>
  httr2::req_perform()

httr2::resp_check_status(response)

foo <- httr2::resp_body_json(response, simplifyVector = TRUE)

foo




client <- crul::HttpClient$new(global_summary_ex_json)
response <- client$get()
response$raise_for_status()

# Parse the content
response$parse()

jsonlite::fromJSON(response$parse())

crul::ok(global_summary_ex_json)
