#!/bin/bash

function genService() {
  local appName=$1;
  local workDir=$2;
  echo "work dir: $workDir, app name: $appName";
  
  cd $workDir;
  echo "> create code directory."
  local mainDir="src/main/java";
  mkdir -p "src/test/java";
  mkdir -p $mainDir;
  local childDirs="service commonm mongo mybatis/mapper redis impl util exception config";
  for childDir in $childDirs
  do 
    #echo "create "$mainDir"/cn/edaijia/"$appName"/"$childDir
    mkdir -p $mainDir"/cn/edaijia/"$appName"/"$childDir
  done 

  echo "> create config file"
  cd $workDir;
  local configDir="src/main/resources";
  mkdir -p $configDir;
  cd $configDir
  local files="config-common.properties config-product.properties config-test.properties mybatis-configuration.xml spring-config.xml";
  for configFile in $files
  do
    touch $configFile
    #echo "create "$configFile
  done

  echo "done."
}

function genApi() {
  local appName=$1;
  local workDir=$2;
  echo "work dir: $workDir, app name: $appName";
  
  cd $workDir;
  echo "> create code directory."
  local mainDir="src/main/java";
  mkdir -p "src/test/java";
  mkdir -p $mainDir;
  local childDirs="annotations controller handler interceptor common util exception config";
  for childDir in $childDirs
  do
    mkdir -p $mainDir"/cn/edaijia/api/"$appName"/"$childDir
  done

  echo "> create config file"
  cd $workDir;
  local configDir="src/main/resources";
  mkdir -p $configDir;
  cd $configDir
  local files="api-config.properties";
  for configFile in $files
  do
    touch $configFile
  done
  
  echo "> create web-config file"
  cd $workDir;
  local configDir="src/main/webapp/WEB-INF";
  mkdir -p $configDir;
  cd $configDir
  local files="logback.xml spring-mvc.xml web.xml";
  for configFile in $files
  do
    touch $configFile
  done
  echo "done."
}

workDir=`dirname $0`
workDir=`cd $workDir && pwd`

usage="create app architecture \n\
    -n appName\n\
    -t [s|a] s means service app, a means api app.\n\
    -w app location, default current.\n"
appDir=$workDir;

while getopts n:t:d:h opt;
do
  case $opt in
    n) appName=$OPTARG;;
    t) appType=$OPTARG;;
    d) appDir=$OPTARG;;
    h) echo $usage; exit 1;;
  esac
done

if [ x"$appName" = x ] || [ x"$appType" = x ]; then
  echo $usage;
  exit 1;
fi

if [ "$appType" == "s" ]; then
  echo "create service app architecture.";
  genService $appName $appDir
elif [ "$appType" == "a" ]; then
  echo "create api app architecture.";
  genApi $appName $appDir
else
  echo "unknown app type.";
  echo $usage;
fi

