#!/bin/sh

# copy-statedmi-doc-dev
#
# Copy previously uploaded StateDMI files:
# - from bucket:  static-cdss-state-co-us/statedmi
# - to bucket:  opencdss.state.co.us/statedmi
# - rename from 4.06.00dev to 4.05.00 because 4.06.00dev had minimal documentation changes and 4.05.00 is the public release
# - remove the output first to make sure initial test copy does not leave artifacts
# - make sure that 4.05.00 and latest folders exist so the copy ends up in the correct folder
gsutil.cmd -m rm -r gs://opencdss.state.co.us/statedmi/4.05.00/doc-dev
gsutil.cmd -m rm -r gs://opencdss.state.co.us/statedmi/4.06.00dev/doc-dev
gsutil.cmd -m rm -r gs://opencdss.state.co.us/statedmi/5.00.00dev/doc-dev
# The behavior of cp is different depending on whether the destination folder exists
# - therefore it is safest to use rsync -d
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/statedmi/4.06.00dev/doc-dev gs://opencdss.state.co.us/statedmi/4.05.00/doc-dev

gsutil.cmd -m rm -r gs://opencdss.state.co.us/statedmi/latest/doc-dev
gsutil.cmd -m rsync -r -d gs://static-cdss-state-co-us/statedmi/latest/doc-dev gs://opencdss.state.co.us/statedmi/latest/doc-dev
