
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/jarmed.svg?branch=master)](https://travis-ci.org/hrbrmstr/jarmed)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-BSD_3_clause%20+%20file%20LICENSE-blue.svg)

# jarmed

Fingerprint TLS Servers with Salesforece JARM Algorithm

## Description

The Salesforce JARM Tool <https://github.com/salesforce/jarm> is an
active Transport Layer Security (TLS) server fingerprinting tool. JARM
fingerprints can be used to quickly verify that all servers in a group
have the same TLS configuration; group disparate servers on the internet
by configuration, identifying that a server may belong to Google
vs. Salesforce vs. Apple, for example; Identify default applications or
infrastructure; and/or Identify malware command and control
infrastructure and other malicious servers on the Internet. Tools are
provided to generate JARM fingerprints.

## What’s Inside The Tin

The following functions are implemented:

-   `jarm_fingerprint`: Fingerprint a TLS server

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/jarmed.git")
# or
remotes::install_gitlab("hrbrmstr/jarmed")
# or
remotes::install_bitbucket("hrbrmstr/jarmed")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(jarmed)

# current version
packageVersion("jarmed")
## [1] '0.1.0'
```

``` r
(res <- jarm_fingerprint("rud.is"))
##   Host: rud.is
##   Port: 443
##     IP: 172.93.49.183
## Result: 15d2ad16d29d29d00015d2ad15d29dd1c3ca624d74ad1df5cec63008795502
##   JARM: 009e|0303|h2|0000-ff01-0010,c030|0303|h2|0000-ff01-000b-0010,009f|0303|h2|0000-ff01-0010,c02f|0303||0000-ff01-000b,c02f|0303||0000-ff01-000b,|||,009e|0303|h2|0000-ff01-0010,c030|0303|h2|0000-ff01-000b-0010,009e|0303|h2|0000-ff01-0010,c02f|0303|h2|0000-ff01-000b-0010

str(res, 1)
## List of 5
##  $ host  : chr "rud.is"
##  $ port  : int 443
##  $ ip    : chr "172.93.49.183"
##  $ result: chr "15d2ad16d29d29d00015d2ad15d29dd1c3ca624d74ad1df5cec63008795502"
##  $ jarm  : chr "009e|0303|h2|0000-ff01-0010,c030|0303|h2|0000-ff01-000b-0010,009f|0303|h2|0000-ff01-0010,c02f|0303||0000-ff01-0"| __truncated__
##  - attr(*, "class")= chr [1:2] "jarm_result" "list"
```

``` r
library(tidyverse)

c(
  "rud.is",
  "r-project.org",
  "rstudio.com",
  "apple.com"
) -> sites

sites %>% 
  map_df(jarm_fingerprint)
## # A tibble: 4 x 5
##   host       port ip        result                            jarm                                                      
##   <chr>     <int> <chr>     <chr>                             <chr>                                                     
## 1 rud.is      443 172.93.4… 15d2ad16d29d29d00015d2ad15d29dd1… 009e|0303|h2|0000-ff01-0010,c030|0303|h2|0000-ff01-000b-0…
## 2 r-projec…   443 <NA>      07d19d1ad21d21d07c42d43d000000ee… 0033|0303|http/1.1|ff01-0000-0001-0023-0010-0017,00c0|030…
## 3 rstudio.…   443 <NA>      2ad2ad16d2ad2ad00042d42d000000df… c030|0303|h2|ff01-0000-0001-000b-0023-0010-0017,c030|0303…
## 4 apple.com   443 <NA>      29d29d15d29d29d00041d41d000000a5… c02f|0303||ff01-0000-0001-000b-0023-0017,c02f|0303||ff01-…
```

## jarmed Metrics

| Lang | \# Files | (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|----:|----:|-----:|------------:|-----:|---------:|-----:|
| R    |        4 | 0.4 |  27 | 0.29 |          12 | 0.19 |       30 | 0.25 |
| Rmd  |        1 | 0.1 |  19 | 0.21 |          20 | 0.31 |       31 | 0.25 |
| SUM  |        5 | 0.5 |  46 | 0.50 |          32 | 0.50 |       61 | 0.50 |

clock Package Metrics for jarmed

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
