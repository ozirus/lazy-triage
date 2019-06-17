rem Lazy Triage v0.3 - by Furkan Caliskan

rem Kanitların konulacagi klasoru olustur
mkdir c:\kanit_%COMPUTERNAME%_%DATE%

rem CSV formatinca PC adi,modeli,aktif user ve domain bilgisini al, systeminfo olarak yaz
wmic computersystem get model,name,username,domain /format:csv > c:\kanit_%COMPUTERNAME%_%DATE%\systeminfo.txt

rem CSV olarak acilista calisan programlari al ve startup olarak yaz
wmic startup list full /format:csv > c:\kanit_%COMPUTERNAME%_%DATE%\startup.txt

rem CSV olarak calisan process'leri id, aciklama ve komut satırlarını al ve process.txt olarak yaz
wmic process get description,processid,parentprocessid,commandline /format:csv > c:\kanit_%COMPUTERNAME%_%DATE%\process.txt

rem CSV olarak calisan servisleri, id, acilis durumu, durumu ve calistigi dizin bilgisin al ve services.txt olarak yaz
wmic service get name,processid,startmode,state,status,pathname /format:csv > c:\kanit_%COMPUTERNAME%_%DATE%\services.txt

rem CSV olarak zamanlanmis gorevleri al ve jobs.txt yaz
wmic job list full /format:csv > c:\kanit_%COMPUTERNAME%_%DATE%\jobs.txt

rem Son cozulen DNS isimlerini cache'ten al
ipconfig /displaydns > c:\kanit_%COMPUTERNAME%_%DATE%\dns_cache.txt

rem Zamanlanmis gorevleri sorgular
CMD /u /c schtasks /query /v /fo list > c:\kanit_%COMPUTERNAME%_%DATE%\schtasks.txt

rem Network socket durumlarını ve ilişkili process'leri listele
CMD /u /c netstat -bona > c:\kanit_%COMPUTERNAME%_%DATE%\netstat_bona.txt

rem Kullacıları al
CMD /u /c net users > c:\kanit_%COMPUTERNAME%_%DATE%\users.txt

rem Local admin grup üyeliklerini al
CMD /u /c net localgroup administrators > c:\kanit_%COMPUTERNAME%_%DATE%\localadmin.txt

rem Local route tablosunu al
CMD /u /c route print > c:\kanit_%COMPUTERNAME%_%DATE%\route_table.txt

rem Local arp tablosunu al
CMD /u /c arp -a > c:\kanit_%COMPUTERNAME%_%DATE%\arp_table.txt
