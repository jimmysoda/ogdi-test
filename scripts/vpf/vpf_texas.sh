#!/bin/sh

TEXASH_URL=gltp:/vrf/u/iii/test_suite/data/vpf/vm2alv2/texash

rm -f temp_texas

# ----------------------------------------------------------------------------
# This test verifies that selecting the wrong family produces no features,
# but causes no crashes. 
#
# http://sourceforge.net/bugs/?func=detailbug&bug_id=123132&group_id=11181

ogdi_info -u $TEXASH_URL -f Area -l 'contourl@elev(*)' -dl > temp_texas

./test_comp.sh temp_texas texas-1

# ----------------------------------------------------------------------------
# Test lines and that double quoted query values work properly.
# http://sourceforge.net/bugs/?func=detailbug&bug_id=122597&group_id=11181

ogdi_info -no-dict -u $TEXASH_URL -r 31.25 31.20 -97.5 -97.55 -f Line -l 'contourl@elev(hqc="1")' -dl > temp_texas

./test_comp.sh temp_texas texas-2

# ----------------------------------------------------------------------------
# Test Points.

ogdi_info -no-dict -u $TEXASH_URL -f Point -l 'elevp@elev(*)' -dl > temp_texas

./test_comp.sh temp_texas texas-3

# ----------------------------------------------------------------------------
# Test Areas. 

ogdi_info -no-dict -u $TEXASH_URL -f Area -l 'disposea@ind(*)' -dl > temp_texas

./test_comp.sh temp_texas texas-4



