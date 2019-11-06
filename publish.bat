dotnet publish -r linux-arm -o linux-arm /p:ShowLinkerSizeComparison=true 
rem pushd .\linux-arm
plink -pw "raspberry" -batch root@192.168.10.96 mkdir /home/pi/worker
pscp -pw raspberry -batch -v -r .\linux-arm\* root@192.168.10.96:/home/pi/worker
plink -pw "raspberry" -batch root@192.168.10.96 chmod 777 /home/pi/worker/rpiworker
rem popd