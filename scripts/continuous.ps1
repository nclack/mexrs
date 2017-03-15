$root=Split-Path -parent $MyInvocation.MyCommand.Path
$src= join-path (split-path $root) "hello"

$watcher=new-object System.IO.FileSystemWatcher
$watcher.Path = $src
$watcher.Filter = '*.*'
$watcher.IncludeSubDirectories=$true
$watcher.EnableRaisingEvents=$true
$watcher.NotifyFilter="LastAccess,LastWrite,FileName,DirectoryName"
write-output $watcher

# . (join-path $root build_init.ps1)
while(1) {
    $watcher.WaitForChanged("All")
    . (join-path $root "build.ps1")
    write-host "---------------------------"
}
