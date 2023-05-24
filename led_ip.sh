#!/usr/bin/env bash
last_sequence=$(ifconfig | grep 192.168. | cut -d "." -f 4 | cut  -d " " -f 1)
local_ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){2}[0-9]*')
echo $local_ip
sequence=$(echo $local_ip | cut -d '.' -f 5)

echo "192.168.$sequence.$last_sequence"
echo "assuming ip starts 192.168"
# Set up GPIO pin
GPIO=17
echo $GPIO > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$GPIO/direction


# Blink the LED
for ((i=0;i<$sequence;i++))
do
  echo "1" > /sys/class/gpio/gpio$GPIO/value
  sleep 0.5
  echo "0" > /sys/class/gpio/gpio$GPIO/value
  sleep 0.5
done
sleep 10
for ((i=0;i<$last_sequence;i++))
do
  echo "1" > /sys/class/gpio/gpio$GPIO/value
  sleep 0.5
  echo "0" > /sys/class/gpio/gpio$GPIO/value
  sleep 0.5
done


# Clean up GPIO pin
echo $GPIO > /sys/class/gpio/unexport

