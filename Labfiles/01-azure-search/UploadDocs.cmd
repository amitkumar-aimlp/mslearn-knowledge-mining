@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id="444ff92b-4391-4963-8fdd-cec940b342a9"
set azure_storage_account="storageac100"
set azure_storage_key="arZtzghTSvtaIC2niCXi7S2W2z7GRP4OzvmoaEh3VD8E+ijoM1qUizKpYN/XUry03igQP+T8bV4Y+AStIkB3Cw=="

echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
