#!/bin/sh

. ../setup.sh

GLTP=gltp:/rpf$TEST_DATA/rpf/ftdrum/rpf

rm -f info.log

# ----------------------------------------------------------------------------
# Capture view of DTED file.

$OGDI_INFO -u $GLTP -f Matrix -l '10M@2@CIB@DMAAC@0' -sf 100 -dl > info.log

../test_comp.sh info.log rpf-ftdrum-1





