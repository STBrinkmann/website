load(url("https://userpage.fu-berlin.de/soga/300/30100_data_sets/East_Germany.RData"))
library(raster)
library(gstat)
Rcpp::sourceCpp("IDW_Rcpp.cpp")

dwd_rcpp <- function(aoi = east.germany.states.sp,
                     data = dwd.east.sp,
                     n = nrow(dwd.east.sp), b = 2,
                     resolution = 10000,
                     ncores = 1, progress = FALSE) {
  dwd.sf <- st_as_sf(aoi)
  data_sf <- st_as_sf(data)
  
  dwd.rast <- raster(xmn = st_bbox(dwd.sf)[1],
                     xmx = st_bbox(dwd.sf)[3],
                     ymn = st_bbox(dwd.sf)[2],
                     ymx = st_bbox(dwd.sf)[4],
                     crs = st_crs(dwd.sf)$proj4string,
                     resolution = resolution) %>% 
    rasterize(data, ., "Rainfall", background = NA)
  
  dwd.rast_values <- getValues(dwd.rast)
  
  idw_vals <- IDW_Rcpp(rast = dwd.rast, x = dwd.rast_values,
                       sf_x = sf::st_coordinates(data_sf)[,1],
                       sf_y = sf::st_coordinates(data_sf)[,2],
                       sf_z = data_sf$Rainfall,
                       n = n, b = b, radius = -1, 
                       display_progress = progress, ncores = ncores)
  dwd.rast[] <- idw_vals
  
  dwd.rast <- dwd.rast %>% 
    crop(aoi) %>%
    mask(aoi)
  
  return(dwd.rast)
}


dwd_gstat <- function(aoi = east.germany.states.sp,
                      data = dwd.east.sp,
                      n = nrow(dwd.east.sp), b = 2,
                      resolution = 10000) {
  if(is(aoi, "sf")){
    aoi <- as(aoi, "Spatial")
  }
  if(is(data, "sf")){
    data <- as(data, "Spatial")
  }
  extent.east.germany <- extent(aoi)
  grid.east.germany <- expand.grid(x = seq(from = round(extent.east.germany@xmin),
                                           to = round(extent.east.germany@xmax),
                                           by = resolution),
                                   y = seq(from = round(extent.east.germany@ymin),
                                           to = round(extent.east.germany@ymax),
                                           by = resolution))
  coordinates(grid.east.germany) <- ~x + y
  proj4string(grid.east.germany) <- proj4string(data)
  gridded(grid.east.germany) <- TRUE
  
  data <- spTransform(data, proj4string(grid.east.germany))
  
  # build model
  idw_rain = gstat(formula = Rainfall ~ 1, # intercept only model
                   data = data, 
                   nmax = n, 
                   set = list(idp = b))
  
  # interpolation
  grid.east.germany.rain <- predict(object = idw_rain,
                                    newdata = grid.east.germany,
                                    debug.level = 0)
  # masking
  grid.east.germany.rain <- mask(raster(grid.east.germany.rain), aoi)
  
  return(grid.east.germany.rain)
}