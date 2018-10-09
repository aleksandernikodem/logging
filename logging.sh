#!/bin/bash

LOG_CRITICAL=5
LOG_ERROR=4
LOG_WARNING=3
LOG_INFO=2
LOG_DEBUG=1

LOG_CRITICAL_COLOR="\033[0;31m"
LOG_ERROR_COLOR="\033[0;31m"
LOG_WARNING_COLOR="\033[0;33m"
LOG_INFO_COLOR="\033[0;32m"
LOG_DEBUG_COLOR="\033[0;32m"
LOG_RESET_COLOR="\033[0m"

#CONFIGURATION
LOG_SET_LEVEL=LOG_DEBUG
LOG_TIMESTAMP=TIMESTAMP_HMS
COLORED=false

#Seconds since UNIX epoch
function TIMESTAMP_UNIX {
    echo "$(date +%s)"
}

#YYYY-MM-DD_hh:mm:ss
function TIMESTAMP_TMDHMS {
    echo "$(date +%F_%T)"
}

#hh:mm:ss
function TIMESTAMP_HMS {
    echo "$(date +%T)"
}

function timestamp
{

echo $(${LOG_TIMESTAMP})
}


function log.debug() {
if [ $(( ${LOG_SET_LEVEL} - $LOG_DEBUG)) -le 0 ];then
  if [ ${COLORED} ]; then
    echo -e "["$(timestamp)"]${LOG_DEBUG_COLOR}[debug]${LOG_RESET_COLOR}:" $1
  else
    echo "["$(timestamp)"][debug]:"
  fi
fi
}

function log.info() {
if [ $(( ${LOG_SET_LEVEL} - $LOG_INFO)) -le 0 ];then
  if [ ${COLORED} ]; then
    echo -e "["$(timestamp)"]${LOG_INFO_COLOR}[debug]${LOG_RESET_COLOR}:" $1
  else
    echo "["$(timestamp)"][debug]:"
  fi
fi
}

function log.warning() {
if [ $(( ${LOG_SET_LEVEL} - $LOG_WARNING)) -le 0 ];then
  if [ ${COLORED} ]; then
    echo -e "["$(timestamp)"]${LOG_WARNING}[debug]${LOG_RESET_COLOR}:" $1
  else
    echo "["$(timestamp)"][debug]:"
  fi
fi
}

function log.error() {
if [ $(( ${LOG_SET_LEVEL} - $LOG_ERROR)) -le 0 ];then
  if [ ${COLORED} ]; then
    echo -e "["$(timestamp)"]${LOG_ERROR}[debug]${LOG_RESET_COLOR}:" $1
  else
    echo "["$(timestamp)"][debug]:"
  fi
fi
}

function log.critical() {
if [ $(( ${LOG_SET_LEVEL} - $LOG_CRITICAL)) -le 0 ];then
  if [ ${COLORED} ]; then
    echo -e "["$(timestamp)"]${LOG_CRITICAL_COLOR}[debug]${LOG_RESET_COLOR}:" $1
  else
    echo "["$(timestamp)"][debug]:"
  fi
fi
}



