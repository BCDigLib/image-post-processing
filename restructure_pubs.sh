#!/bin/sh

for fname in *.tif; do
  date_string=$(echo $fname | cut -d '_' -f 2,3);
  year_dir=$(echo $date_string | cut -c 1-4);
  month_dir=$(echo $date_string | cut -c 5-6);
  day_dir=$(echo $date_string | cut -c 7-11);
  if [[ ! -d $year_dir ]]; then
    mkdir $year_dir;
  fi
  if [[ ! -d "$year_dir/$month_dir" ]]; then
    mkdir "$year_dir/$month_dir";
  fi
  if [[ ! -d "$year_dir/$month_dir/$day_dir" ]]; then
    mkdir "$year_dir/$month_dir/$day_dir";
  fi
  mv $fname "$year_dir/$month_dir/$day_dir/"
  rename 's/_0\d_/_/' "$year_dir/$month_dir/$day_dir/$fname"
done