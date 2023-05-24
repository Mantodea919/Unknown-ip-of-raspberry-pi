# Unknown ip of raspberry pi?
How to find out IP of raspberry pi without sceen?
There is the way to now ip of running raspberry pi without screen.
If you are using raspberry pi zero ( not wireless) connected to your phone tethering and there's no screen to execute ifconfig on raspberry pi so technically there is no possibility to connect to your raspberry pi if local IP has changed. This script uses led on pin17 to blink as many times as 3rd and 4th sequence of ip. Now you know ip of device asuming it starts with 192.168

Script blinks as many times as in 3rd sequence of IP (192.168.X.Y), sleeps and blinks again the last sequence of IP. 
Now you can connect to your raspberry pi via ssh  tethering.


192.168.[amount of blinks](script sleeps) . [amount  of blinks]

Use: ```bash led_ip.sh```
