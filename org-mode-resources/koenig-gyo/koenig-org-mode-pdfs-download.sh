#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------------------
# Download and extract the PDFs accompanying Rainer König's org mode
# presentations on YouTube at
# https://www.youtube.com/playlist?list=PLVtKhBrRV_ZkPnBtt_TD1Cs9PJlU0IIdE
#
# The script takes an optional first positional argument can be used to specify
# the destination directory for the files. If no argument is given then the
# files are placed in the working directory.
# ------------------------------------------------------------------------------

# an optional first positional argument can be used to specify the destination
# directory
if (($# == 0)); then
    output_dir=.
else
    output_dir=$1
fi
mkdir -p "$output_dir"

# the various URLs corresponding to the different episodes. These were obtained
# by manually navigating through https://koenig-haunstetten.de/downloads/ in a
# web browser
download_urls=(
    https://koenig-haunstetten.de/download/17/
    https://koenig-haunstetten.de/download/18/
    https://koenig-haunstetten.de/download/19/
    https://koenig-haunstetten.de/download/20/
    https://koenig-haunstetten.de/download/21/
    https://koenig-haunstetten.de/download/22/
    https://koenig-haunstetten.de/download/23/
)

# download each zip file, extract the contents, and then delete the zip file
pushd "$output_dir"
for url in "${download_urls[@]}"; do
    local_path=$(basename "$url").zip
    curl -o "$local_path" "$url"
    unzip -u "$local_path"
    rm "$local_path"
done
popd
