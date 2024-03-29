dotnet publish -r linux-arm -o .\bin\linux-arm
plink -pw "raspberry" -batch root@192.168.10.96 mkdir /home/pi/worker

rem copy only the exe - used for testing
rem pscp -pw raspberry -batch -v -r .\bin\linux-arm\rpiworker.* root@192.168.10.96:/home/pi/worker

rem copy entire directory
pscp -pw raspberry -batch -v -r .\bin\linux-arm\* root@192.168.10.96:/home/pi/worker

plink -pw "raspberry" -batch root@192.168.10.96 chmod 777 /home/pi/worker/rpiworker
