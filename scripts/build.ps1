cargo build
write-host "Renaming DLL to MEXW64"
Copy-Item .\target\debug\helloworld.dll .\target\debug\helloworld.mexw64
