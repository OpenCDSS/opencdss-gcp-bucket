#!/bin/sh

# copy-tstool-doc-dev
#
# Copy previously uploaded TSTool files:
# - from bucket:  static-cdss-state-co-us/tstool
# - to bucket:  opencdss.state.co.us/tstool
# - rename from 12.07.00 to 12.06.00 because 12.07.00 had minimal documentation changes and 12.06.00 is the public release
# - remove the output first to make sure initial test copy does not leave artifacts
gsutil.cmd -m rm -r gs://opencdss.state.co.us/tstool/12.06.00/doc-dev
gsutil.cmd -m rm -r gs://opencdss.state.co.us/tstool/12.07.00/doc-dev
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/tstool/12.07.00/doc-dev gs://opencdss.state.co.us/tstool/12.06.00/doc-dev

gsutil.cmd -m rm -r gs://opencdss.state.co.us/tstool/latest/doc-dev
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/tstool/latest/doc-dev gs://opencdss.state.co.us/tstool/latest/doc-dev
