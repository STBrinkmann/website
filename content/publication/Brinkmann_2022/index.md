---
summary: "Studies from public and environmental health show strong indication of the importance of visible urban green space. However, current approaches for modelling viewshed based greenness visibility still have high computation costs. Therefore, we propose an algorithm for point-based viewshed computation using a novel prototyping approach. Our evaluation shows an average improvement of 34%. We anticipate that these findings lay the groundwork for further optimisation of point-based viewshed computation, improving the feasibility of subsequent comparative studies in the field of public and environmental health."
authors:
- admin
- Dominik Kremer
- Blake Byron Walker
date: "2022-06-10T00:00:00Z"
doi: "10.5194/agile-giss-3-27-2022"
featured: true
image:
  focal_point: ""
  preview_only: true
projects: []
publication: '*AGILE GIScience Series, 3*(27)'
publication_short: ""
publication_types:
- "2"
publishDate: "2022-06-10T00:00:00Z"
tags:
- Viewshed computation
- Greenness visibility
- Urban health
- Optimisation
title: "Modelling eye-level visibility of urban green space: Optimising city-wide point-based viewshed computations through prototyping"
url_code: "https://github.com/STBrinkmann/protoVS"
url_dataset: "https://doi.org/10.5281/zenodo.6421423"
url_pdf: https://agile-giss.copernicus.org/articles/3/27/2022/agile-giss-3-27-2022.pdf
url_poster: ""
url_project: ""
url_slides: ""
url_source: ""
url_video: ""
---
# Abstract
Studies from public and environmental health show strong indication of the importance of visible urban green space. However, current approaches for modelling viewshed based greenness visibility still have high computation costs. As a consequence, comparative studies of city-wide visible greenness, everyday mobility, and individual attention are still at the edge of feasibility. Known optimisations focus on reducing the computation time of single viewsheds. As point-based viewsheds are computed using geospatial data, current approaches seek to accelerate calculation using intelligent data structures or spatial indexes (at the cost of additional memory) or develop approximative heuristic solutions. In contrast, as we aim to process large numbers of viewsheds with fixed parameterisations, we use a prototyping approach preprocessing a single viewshed template to store common prefixes of consecutive lines of sight that can be applied to followup viewsheds by a simple offset operation. Our evaluation shows an average improvement of 34% over the benchmark algorithm (RFVS), with even stronger improvements for large viewsheds. We anticipate that these findings lay the groundwork for further optimisation of point-based viewshed computation, improving the feasibility of subsequent comparative studies in the field of public and environmental health.