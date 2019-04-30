#!/bin/sh

# set-bucket-redirect
#
# Set the opencdss.state.co.us URL redirect to opencdss.state.co.us/opencdss
# - a folder is used to keep files separate from other products on the site
# - it is common that someone would go directly to the subdomain URL

gsutil.cmd cp index.html gs://opencdss.state.co.us
