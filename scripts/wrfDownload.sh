#!/bin/bash

day=$(date +"%d")
month=$(date +"%m")
year=$(date +"%Y")
prefix="wrfout_d01_"
sufix="_00.nc" 
inter="-"
day2=$(date -d "+5 days" +"%d")
month2=$(date -d "+5 days" +"%m")
year2=$(date -d "+5 days" +"%Y")

fileName=$prefix$year$inter$month$inter$day$sufix
path="data/wrf/"
interd='_'
slash="/"

if [ $month = "01" ]; then 
	monthnew="enero"
elif [ $month = "02" ]; then
        monthnew="febrero"
elif [ $month = "03" ]; then
        monthnew="marzo"
elif [ $month = "04" ]; then
        monthnew="abril"
elif [ $month = "05" ]; then
        monthnew="mayo"
elif [ $month = "06" ]; then
        monthnew="junio"
elif [ $month = "07" ]; then
        monthnew="julio"
elif [ $month = "08" ]; then
        monthnew="agosto"
elif [ $month = "09" ]; then
        monthnew="septiembre"
elif [ $month = "10" ]; then
        monthnew="octubre"
elif [ $month = "11" ]; then
        monthnew="noviembre"

else 
	monthnew="diciembre"
fi

monthpath=$month$interd$monthnew
finalpath=$path$monthpath$slash$fileName
url="https://pronosticos.atmosfera.unam.mx:8443/thredds/ncss/pwrf/"
urlvar="?var=U10,V10,XLAT,XLONG&disableLLSubset=on&disableProjSubset=on&horizStride=1&time_start="
urlendtime="T00%3A00%3A00Z&time_end="
urlend="T00%3A00%3A00Z&timeStride=1&vertCoord=&accept=netcdf"
urlpath=$url$year$slash$month$interd$monthnew$slash$fileName$urlvar$year$inter$month$inter$day$urlendtime$year2$inter$month2$inter$day2$urlend
wget -O "$path$fileName" "$urlpath"

rmday=$(date -d "1 day ago" +"%d")
rmmonth=$(date -d "1 day ago" +"%m")
rmyear=$(date -d "1 day ago" +"%Y")

fileNamerm=$prefix$rmyear$inter$rmmonth$inter$rmday$sufix
finalpathrm=$path$fileNamerm
rm $finalpathrm

