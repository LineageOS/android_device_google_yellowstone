#!/system/bin/sh

# Copyright (c) 2013-2016, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# loop through thermal zones
cdevs=( 0  1  2  3  4  5  6  7  8  9
       10 11 12 13 14 15 16 17 18 19
       20 21 22 23 24 25 26 27 28 29
       30 31 32 33 34 35 36 37 38 39
       40 41 42 43 44 45 46 47 48 49)
skin_temp=""
for tz in /sys/class/thermal/thermal_zone*
do
    chown system ${tz}/temp
    chmod 0444 ${tz}/temp
    chown system ${tz}/trip_point_*_temp 2> /dev/null
    chmod 0664 ${tz}/trip_point_*_temp 2> /dev/null
    chown system ${tz}/trip_point_*_hyst 2> /dev/null
    chmod 0664 ${tz}/trip_point_*_hyst 2> /dev/null

    zname=`cat ${tz}/type`
    if [[ "$zname" = "CPU-therm" ]]; then
        setprop phs.therm.cpu_temp ${tz}/temp
        for i in ${cdevs[@]}
        do
            cdev_name=`cat ${tz}/cdev${i}/type`
            if [[ "$cdev_name" = "tegra-balanced" || "$cdev_name" = "cpu-balanced" ]]; then
                cdev_trip=`cat ${tz}/cdev${i}_trip_point`
                setprop phs.therm.cpu_trip ${tz}/trip_point_${cdev_trip}_temp
                break
            fi
        done
    elif [[ "$zname" = "Tdiode_skin" || ( "$skin_temp" = "" && "$zname" = "therm_est" ) ]]; then
        temp=""
        temp=`cat ${tz}/temp`
        if [[ "$temp" != "" && $temp -ge 0 && $temp -lt 190000 ]]; then
            skin_temp=${tz}/temp
            setprop phs.therm.skin_temp ${skin_temp}
            for i in ${cdevs[@]}
            do
                cdev_name=`cat ${tz}/cdev${i}/type`
                if [[ "$cdev_name" = "skin-balanced" ]]; then
                    cdev_trip=`cat ${tz}/cdev${i}_trip_point`
                    setprop phs.therm.skin_trip ${tz}/trip_point_${cdev_trip}_temp
                    break
                fi
            done
        fi
    elif [[ '1' -eq `echo $zname | grep -c fan` ]]; then
        temp=""
        temp=`cat ${tz}/temp`
        if [[ "$temp" != "" && $temp -ge 0 && $temp -lt 190000 ]]; then
            setprop phs.therm.fan_temp ${tz}/temp
        fi
        for i in ${cdevs[@]}
        do
            cdev_name=`cat ${tz}/cdev${i}/type`
            if [[ "$cdev_name" = "pwm-fan" ]]; then
                cdev_trip=`cat ${tz}/trip_point_${i}_temp`
                if [[ "$cdev_trip" != "" && $cdev_trip -gt 0 ]]; then
                    setprop phs.therm.fan_trip ${tz}/trip_point_${i}_temp
                    break
                fi
            fi
        done
    fi
done

setprop phs.bql.perfmodes.mask 3
