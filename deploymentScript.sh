#!/bin/bash

docker cp ~/deploymentManager/ExcelSheets/. ac69:/home/aof_api/ExcelSheets/
docker cp ~/deploymentManager/models/. ac69:/home/aof_api/models/
docker cp ~/deploymentManager/routes/authorize/. ac69:/home/aof_api/routes/authorize/
docker cp ~/deploymentManager/routes/unauthorize/. ac69:/home/aof_api/routes/unauthorize/
docker cp ~/deploymentManager/routes/funcations/. ac69:/home/aof_api/routes/funcations/
docker cp ~/deploymentManager/server.js ac69:/home/aof_api/
docker restart ac69

