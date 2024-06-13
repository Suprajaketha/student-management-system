@echo off
setlocal

:: Set the report file path
set report_file=deployment_summary.txt

:: Create the deployment summary report
echo Deployment Summary Report > %report_file%
echo ======================== >> %report_file%
echo Date: %date% >> %report_file%
echo Time: %time% >> %report_file%
echo ======================== >> %report_file%

:: Add your custom deployment summary details here
echo Application Name: MyApp >> %report_file%
echo Environment: Production >> %report_file%
echo Deployment Status: Success >> %report_file%
echo Deployed By: %username% >> %report_file%
echo Recipient Email: kethasupraja57@gmail.com >> %report_file%

echo Deployment summary report generated successfully.

:: PowerShell script to send email
powershell -Command ^
$SMTPServer = "smtp.gmail.com"; ^
$SMTPPort = 587; ^
$SMTPUser = "kethasupraja57@gmail.com"; ^
$SMTPPass = "Github@123"; ^
$From = "kethasupraja57@gmail.com"; ^
$To = "kethasupraja57@gmail.com"; ^
$Subject = "Deployment Summary Report"; ^
$Body = "Please find the attached deployment summary report."; ^
$Attachment = "%report_file%"; ^
$SMTPMessage = New-Object system.net.mail.mailmessage; ^
$SMTPMessage.From = $From; ^
$SMTPMessage.To.Add($To); ^
$SMTPMessage.Subject = $Subject; ^
$SMTPMessage.Body = $Body; ^
$SMTPAttachment = New-Object System.Net.Mail.Attachment($Attachment); ^
$SMTPMessage.Attachments.Add($SMTPAttachment); ^
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort); ^
$SMTPClient.EnableSsl = $true; ^
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SMTPUser, $SMTPPass); ^
$SMTPClient.Send($SMTPMessage)

if %errorlevel% neq 0 (
    echo Failed to send the email.
) else (
    echo Email sent successfully.
)

endlocal
