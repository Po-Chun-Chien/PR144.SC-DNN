#!/bin/sh
PATH=/cygdrive/c/intelFPGA/17.0/quartus/sopc_builder/bin:$PATH
sopc-create-header-files \
"./soc_system.sopcinfo" \
--single hps_0.h \
--module hps_0
