% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/verisr.R
\name{json2veris}
\alias{json2veris}
\title{Read in all the VERIS incidents (JSON files) in a given directory.}
\usage{
json2veris(dir = ".", schema = NULL, progressbar = F)
}
\arguments{
\item{dir}{the directory to list through.  This may be a vector of
directorites, in which case each all the matching files in each
directory will be laoded.}

\item{schema}{a full veris schema with enumerations included.}

\item{progressbar}{a logical value to show (or not show) a progress bar}
}
\description{
This function will iterate through all the JSON files (regex pattern of "json$") in
the given directory and parse it as an encoded VERIS record.  This function
requires that a JSON schema be available for the VERIS data.  If the variable is
not specified, it will attempt to grab the "verisc-merged.json" schema from
https://raw.githubusercontent.com/vz-risk/veris/master/verisc-merged.json.
}
\details{
This will return a verisr object, which is a data.table object and can be
directly accesses as such.

Couple of unique things...  The returned object will have additional fields
for convenience:
  * *actor* will return top level actor categories
  * *action* will return top level action categories
  * *asset.variety* will return top level asset categories
  * *attribute* will return top level asset categories
  * *victim.industry2* will return the first 2 digits of the NAICS code
  * *victim.industry3* same, first 3 digits
  * *victim.orgsize* returns "Large" and "Small" enumerations

The victim.secondary.victim_id, external.actor.region, and any other free
text field that can be repeated is being collapsed into a single string
seperated by a comma at the moment.  If that poses a challnge, open an issue
on it.
}
\examples{
\dontrun{
# load up all the veris files in the "vcdb" directory
# grab the schema off of github.
veris <- json2veris(dir="~/vcdb")

# load up files from multiple directories
veris <- json2veris(dir=c("~/vcdb", "private_data))

# specify a local schema with localized plus section.
veris <- json2veris(dir="~/vcdb",
                    schema="~/veris/verisc-local.json")
}
}
\keyword{json}

