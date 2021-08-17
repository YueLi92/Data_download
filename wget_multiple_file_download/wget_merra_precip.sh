#!/bin/bash
mth=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12")
for yr in {1993..2011}
do
  for ii in {0..11}
  do
    if [ $yr -le 1992 ]; then
      echo "http://goldsmr2.gesdisc.eosdis.nasa.gov/daac-bin/OTF/HTTP_services.cgi?FILENAME=%2Fdata%2FMERRA_MONTHLY%2FMATMNXLND.5.2.0%2F${yr}%2FMERRA100.prod.assim.tavgM_2d_lnd_Nx.${yr}${mth[ii]}.hdf&FORMAT=bmM0Yy8&BBOX=-90%2C-180%2C90%2C180&LABEL=MERRA100.prod.assim.tavgM_2d_lnd_Nx.${yr}${mth[ii]}.SUB.nc4&FLAGS=&SHORTNAME=MATMNXLND&SERVICE=SUBSET_MERRA&LAYERS=&VERSION=1.02&VARIABLES=prectot" >> test.dat
    else
      if [ $yr -le 2000 ]; then
        echo "http://goldsmr2.gesdisc.eosdis.nasa.gov/daac-bin/OTF/HTTP_services.cgi?FILENAME=%2Fdata%2FMERRA_MONTHLY%2FMATMNXLND.5.2.0%2F${yr}%2FMERRA200.prod.assim.tavgM_2d_lnd_Nx.${yr}${mth[ii]}.hdf&FORMAT=bmM0Yy8&BBOX=-90%2C-180%2C90%2C180&LABEL=MERRA200.prod.assim.tavgM_2d_lnd_Nx.${yr}${mth[ii]}.SUB.nc4&FLAGS=&SHORTNAME=MATMNXLND&SERVICE=SUBSET_MERRA&LAYERS=&VERSION=1.02&VARIABLES=prectot" >> test.dat
      else
        echo "http://goldsmr2.gesdisc.eosdis.nasa.gov/daac-bin/OTF/HTTP_services.cgi?FILENAME=%2Fdata%2FMERRA_MONTHLY%2FMATMNXLND.5.2.0%2F${yr}%2FMERRA300.prod.assim.tavgM_2d_lnd_Nx.${yr}${mth[ii]}.hdf&FORMAT=bmM0Yy8&BBOX=-90%2C-180%2C90%2C180&LABEL=MERRA300.prod.assim.tavgM_2d_lnd_Nx.${yr}${mth[ii]}.SUB.nc4&FLAGS=&SHORTNAME=MATMNXLND&SERVICE=SUBSET_MERRA&LAYERS=&VERSION=1.02&VARIABLES=prectot" >> test.dat
      fi
    fi
  wget -O precip_merra_${yr}${mth[ii]}.nc --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --auth-no-challenge=on --keep-session-cookies -i test.dat
  rm -rf test.dat
  done
done
