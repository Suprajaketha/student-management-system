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

:: Email configuration
set "GMAIL_USERNAME=kethasupraja57@gmail.com"
set "GMAIL_PASSWORD=Github@123"
set "RECIPIENT_EMAIL=kethasupraja57@gmail.com"
set "SMTP_SERVER=smtp.gmail.com"
set "SMTP_PORT=587"

:: Send the email using mailsend
mailsend -smtp %SMTP_SERVER% -port %SMTP_PORT% -auth -user %GMAIL_USERNAME% -pass %GMAIL_PASSWORD% -t %RECIPIENT_EMAIL% -f %GMAIL_USERNAME% -sub "Deployment Summary Report" -M "Please find the attached deployment summary report." -attach %report_file%

if %errorlevel% neq 0 (
    echo Failed to send the email.
) else (
    echo Email sent successfully.
)

endlocal
