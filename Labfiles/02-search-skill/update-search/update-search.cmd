@echo off

rem Set values for your Search service
set url="https://az-ai-search100.search.windows.net"
set admin_key="joPq5a3T2vaQMOeRWlWq62y3ywckmqn9nDVZit8y6dAzSeD1lHp5"

echo -----
echo Updating the skillset...
call curl -X PUT %url%/skillsets/margies-custom-skillset?api-version=2020-06-30 -H "Content-Type: application/json" -H "api-key: %admin_key%" -d @update-skillset.json

echo -----
echo Updating the index...
call curl -X PUT %url%/indexes/margies-custom-index?api-version=2020-06-30 -H "Content-Type: application/json" -H "api-key: %admin_key%" -d @update-index.json

rem wait
timeout /t 3 /nobreak

echo -----
echo Updating the indexer...
call curl -X PUT %url%/indexers/margies-custom-indexer?api-version=2020-06-30 -H "Content-Type: application/json" -H "api-key: %admin_key%" -d @update-indexer.json

echo -----
echo Resetting the indexer
call curl -X POST %url%/indexers/margies-custom-indexer/reset?api-version=2020-06-30 -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: %admin_key%" 

rem wait
timeout /t 5 /nobreak

echo -----
echo Rerunning the indexer
call curl -X POST %url%/indexers/margies-custom-indexer/run?api-version=2020-06-30 -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: %admin_key%" 

