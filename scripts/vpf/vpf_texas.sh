#!/bin/sh

. ../setup.sh

TEXASH_URL=gltp:$OGDI_HOST/vrf$TEST_DATA/vpf/vm2alv2/texash

rm -f temp_texas

# ----------------------------------------------------------------------------
# This test verifies that selecting the wrong family produces no features,
# but causes no crashes. 
#
# http://sourceforge.net/bugs/?func=detailbug&bug_id=123132&group_id=11181

$OGDI_INFO -u $TEXASH_URL -f Area -l 'contourl@elev(*)' -dl > temp_texas

grep -v "CURRENT DATABASE" temp_texas > temp2_texas

../test_comp.sh temp2_texas texas-1

rm -f temp_texas temp2_texas

# ----------------------------------------------------------------------------
# Test lines and that double quoted query values work properly.
# http://sourceforge.net/bugs/?func=detailbug&bug_id=122597&group_id=11181

$OGDI_INFO -no-dict -u $TEXASH_URL -r 31.25 31.20 -97.5 -97.55 -f Line -l 'contourl@elev(hqc="1")' -sf 3 -dl > temp_texas

../test_comp.sh temp_texas texas-2

# ----------------------------------------------------------------------------
# Test Points.

$OGDI_INFO -no-dict -u $TEXASH_URL -f Point -l 'elevp@elev(*)' -dl > temp_texas

../test_comp.sh temp_texas texas-3

# ----------------------------------------------------------------------------
# Test Areas. 

$OGDI_INFO -no-dict -u $TEXASH_URL -f Area -l 'disposea@ind(*)' -dl >temp_texas

../test_comp.sh temp_texas texas-4



