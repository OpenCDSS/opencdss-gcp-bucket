#!/bin/sh

# set-bucket-special-pages
#
# Set the opencdss.state.co.us bucket special pages
# - index.html is used at top level, otherwise the index.html in a folder is used
# - error.html is used globally

gsutil.cmd web set -m index.html -e 404.html gs://opencdss.state.co.us
