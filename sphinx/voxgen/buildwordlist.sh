#!/bin/bash
for path in /var/www/html/menus/*; do
  if [ -d "${path}" ]
  then
    #rm -f "${path}"/*.sh
    upperdirname="$(basename "${path}" | gawk '{print toupper($0);}')"
    if [[ $upperdirname =~ ".DIS" ]] ; then continue; fi
    for key in $path/*; do
      if [[ $key =~ ".dis" ]] ; then continue; fi
      if [ -d "${key}" ]
      then
        keyname="$(basename "${key}")"
        upperkeyname=$(echo "$keyname" | gawk '{print toupper($0);}')
        if [ -f $key ]
        then
          cmd=$(cat $key | tr ' ' ':')
        else
          #if [[ $keyname == "SubMenuConfig.dat" ]] ; then continue; fi # skip SubMenuConfig.dat folder
          if [ "$upperdirname" != "GLOBAL" ]
          then
            echo -e "$upperdirname\n${upperkeyname%.SLP}"
          else
            echo -e "${upperkeyname%.SLP}"
          fi
        fi
      else
        keyname="$(basename "${key}")"
        upperkeyname=$(echo "$keyname" | gawk '{print toupper($0);}')
        if [ ${key: -3} != ".sh" ]
        then
          if [[ $key =~ "*" ]] ; then continue; fi # skip disabled empty menu
          if [[ $keyname =~ ".dat" ]] || [[ $keyname =~ ".dis" ]] || [[ $upperdirname =~ ".DIS" ]] # skip .dis and .dat files
          then
            continue
          fi
          if [ "$upperdirname" != "GLOBAL" ]
          then
            echo -e "$upperdirname\n${upperkeyname%.SLP}"
          else
            echo -e "${upperkeyname%.SLP}"
          fi
        fi
      fi
    done
  fi
done
