#!/bin/sh

# copy-statemod-software
#
# Copy previously uploaded StateMod files:
# - from bucket:  static-cdss-state-co-us/statemod
# - to bucket:  opencdss.state.co.us/statemod
# - remove the output first to make sure initial test copy does not leave artifacts
gsutil.cmd -m rm -r gs://opencdss.state.co.us/statemod/15.00.14/software
# The behavior of cp is different depending on whether the destination folder exists
# - therefore it is safest to use rsync -d
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/statemod/15.00.14/software gs://opencdss.state.co.us/statemod/15.00.14/software

gsutil.cmd -m rm -r gs://opencdss.state.co.us/statemod/latest/software
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/statemod/latest/software gs://opencdss.state.co.us/statemod/latest/software
