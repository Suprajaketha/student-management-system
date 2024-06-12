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
endlocal
