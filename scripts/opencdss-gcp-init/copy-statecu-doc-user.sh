#!/bin/sh

# copy-statecu-doc-user
#
# Copy previously uploaded statecu files:
# - from bucket:  static-cdss-state-co-us/statecu
# - to bucket:  opencdss.state.co.us/statecu
# - remove the output first to make sure initial test copy does not leave artifacts
gsutil.cmd -m rm -r gs://opencdss.state.co.us/statecu/13.11/doc-user
# The behavior of cp is different depending on whether the destination folder exists
# - therefore it is safest to use rsync -d
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/statecu/13.11/doc-user gs://opencdss.state.co.us/statecu/13.11/doc-user

gsutil.cmd -m rm -r gs://opencdss.state.co.us/statecu/latest/doc-user
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/statecu/latest/doc-user gs://opencdss.state.co.us/statecu/latest/doc-user
