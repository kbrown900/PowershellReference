#SOURCE: https://luka.manojlovic.net/2015/03/05/simple-hyper-v-replica-warning-critical-state-notification/
#Small changes in adding body to email. All credit to listed source
if ((Get-VMReplication | select-string -inputobject {$_.Health} -pattern “Warning”) -like “Warning”)
{
$SMTPServer = “smtp.gmail.com”
$SMTPPort = “587”
$Username = “fromemail@gmail.com”
$Password = “changeme”
$to = “receiveemail@gmail.com”
$subject = “Replica WARNING error on SERVERNAME”
$body = "There is a WARNING on a replica for host SERVERNAME!"
$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.to.add($to)
$message.from = $username

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)
}
if ((Get-VMReplication | select-string -inputobject {$_.Health} -pattern “Critical”) -like “Critical”)
{
$SMTPServer = “smtp.gmail.com”
$SMTPPort = “587”
$Username = “fromemail@gmail.com””
$Password = “changeme”
$to = “receiveemail@gmail.com”
$subject = “Replica CRITICAL error on SERVERNAME”
$body = "There is a CRITICAL error on a replica for host SERVERNAME!"
$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = $body
$message.to.add($to)
$message.from = $username

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)
