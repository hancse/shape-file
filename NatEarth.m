%% clear workspace
clear all
clc

%% Load the shape files
coast = shaperead('ne_110m_coastline\ne_110m_coastline.shp');
h_coast = mapshow(coast, 'Color', 'red');
geolines = shaperead('ne_110m_geographic_lines\ne_110m_geographic_lines.shp');
h_geolines = mapshow(geolines, 'Color', 'black');
land = shaperead('ne_110m_land\ne_110m_land.shp');
h_land = mapshow(land);
oceans = shaperead('ne_110m_ocean\ne_110m_ocean.shp');
h_ocean = mapshow(oceans);

