#!/bin/bash

for path in /var/www/html/menus/*; do
  if [ -d "${path}" ]
  then
    rm -f "${path}"/*.sh
    upperdirname="$(basename "${path}" | gawk '{print toupper($0);}')"
    lowerdirname="$(basename "${path}" | gawk '{print tolower($0);}')"
    if [[ $upperdirname =~ ".DIS" ]] ; then continue; fi
    for key in $path/*; do
      if [[ $key =~ ".dis" ]] ; then continue; fi
      if [ -d "${key}" ]
      then
        keyname="$(basename "${key}")"
        upperkeyname=$(echo "$keyname" | gawk '{print toupper($0);}')
        lowerkeyname=$(echo "$keyname" | gawk '{print tolower($0);}')
        if [ -f $key ]
        then
          cmd=$(cat $key | tr ' ' ':')
        else
          #if [[ $keyname == "SubMenuConfig.dat" ]] ; then continue; fi # skip SubMenuConfig.dat folder
          if [ "$upperdirname" != "GLOBAL" ]
          then
            echo -en "$upperdirname ${upperkeyname%.SLP}\t$key.sh; \$mute; aplay -q \$audiopath/$lowerdirname.wav; aplay -q \$audiopath/${lowerkeyname%.SLP}.wav; \$umute"
          else
            echo -en "${upperkeyname%.SLP}\t$key.sh; \$mute; aplay -q \$audiopath/${lowerkeyname%.SLP}.wav; \$umute"
          fi
          for file in $key/*; do
            if [ "$(ls -A "${key}" 2>/dev/null)" ]
            then
              cat $file | tr  '\n' ';' >> $key".sh"
            fi
          done
          echo #$key".sh"
          chmod +x $key".sh" 2>/dev/null # if no exec cmd defined skip err msg
        fi
      else
        keyname="$(basename "${key}")"
        upperkeyname=$(echo "$keyname" | gawk '{print toupper($0);}')
        lowerkeyname=$(echo "$keyname" | gawk '{print tolower($0);}')
        if [ ${key: -3} != ".sh" ]
        then
          if [[ $key =~ "*" ]] ; then continue; fi # skip disabled empty menu
          cmdstr=$(echo $(cat $key))
          if [[ $keyname =~ ".dat" ]] || [[ $keyname =~ ".dis" ]] || [[ $upperdirname =~ ".DIS" ]] # skip .dis and .dat files
          then
            continue
          fi
          if [ "$upperdirname" != "GLOBAL" ]
          then
            echo -e "$upperdirname ${upperkeyname%.SLP}\t$key.sh; \$mute; aplay -q \$audiopath/$lowerdirname.wav; aplay -q \$audiopath/${lowerkeyname%.SLP}.wav; \$umute"
          else
            #echo "Global=${lowerkeyname%.slp}:$key.sh"
            echo -e "${upperkeyname%.SLP}\t$key.sh; \$mute; \$audiopath/${lowerkeyname%.SLP}.wav; \$umute"
          fi
          if [ "$cmdstr" != "send" ] && [ "$cmdstr" != "delete" ] && [ "$cmdstr" != "cancel" ] && [ "$cmdstr" != "answer" ] && [ "$cmdstr" != "hangup" ] && [ "$cmdstr" != "dial" ] && [ "$cmdstr" != "additional.dat" ]; then
            echo "#!/bin/bash">$key.sh
            echo "cat $key >>/tmp/sendall.sh">>$key.sh
            echo "truncate --size -1 /tmp/sendall.sh">>$key.sh
            echo "echo \"; sleep 0.3\" >>/tmp/sendall.sh">>$key.sh
            echo "truncate --size -1 /tmp/sendall.sh">>$key.sh
            echo "echo \";\" >>/tmp/sendall.sh">>$key.sh
            echo "chmod a+rwx /tmp/sendall.sh">>$key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "send" ]
          then
            echo "echo sleep 2 >>/tmp/sendall.sh;">$key.sh
            echo "cat /var/www/html/menus/$dirname/additional.dat >>/tmp/sendall.sh;">>$key.sh
            echo "bash /tmp/sendall.sh; echo > /tmp/sendall.sh" >> $key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "btsend" ]
          then
            echo "cat /tmp/sendall.sh | tr -d ';' | sed 's/ sleep 0.3//g' | tr -d '\n'>/tmp/number; chmod a+rw /tmp/number;">$key.sh
            echo "/usr/local/bin/chk_bt && /usr/local/bin/dial-number \`cat /tmp/number\` && echo > /tmp/sendall.sh && chmod a+rwx /tmp/sendall.sh;" >> $key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "delete" ]
          then
            echo "tail -n 1 \"/tmp/sendall.sh\" | wc -c | xargs -I {} truncate \"/tmp/sendall.sh\" -s -{}" > $key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "cancel" ]
          then
            echo "echo > /tmp/sendall.sh" > $key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "hangup" ]
          then
            echo "/usr/local/bin/chk_bt && /usr/local/bin/hangup-all" > $key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "answer" ]
          then
            echo "/usr/local/bin/chk_bt && /usr/local/bin/answer-calls" > $key.sh
            chmod +x $key.sh
          fi
          if [ "$cmdstr" == "dial" ]
          then
            echo "/usr/local/bin/chk_bt && tail -n 1 /tmp/sendall.sh > /tmp/sendall.tmp && chmod a+rwx /tmp/sendall.tmp && cp /tmp/sendall.tmp /tmp/sendall.sh && rm -f /tmp/sendall.tmp && sleep 2 && bash /tmp/sendall.sh && echo > /tmp/sendall.sh && chmod a+rwx /tmp/sendall.sh" > $key.sh
            chmod +x $key.sh
          fi
        fi
      fi
    done
  fi
done
