#!/bin/sh

. ../setup.sh

GLTP=gltp:/dted$TEST_DATA/dted/toronto/dted

rm -f info.log

# ----------------------------------------------------------------------------
# Capture view of DTED file.

$OGDI_INFO -u $GLTP -f Matrix -l 'DTED(DISK)' -sf 8 -dl > info.log

../test_comp.sh info.log dted-toronto-1

# ----------------------------------------------------------------------------
# Verify we get the same results using DTED(RAM).

$OGDI_INFO -u $GLTP -f Matrix -l 'DTED(RAM)' -sf 8 -dl > info.log

../test_comp.sh info.log dted-toronto-2




