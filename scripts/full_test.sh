#!/bin/sh

. setup.sh

rm -f ogdi_info.tst
$OGDI_INFO > ogdi_info.tst
if test ! -s ogdi_info.tst ; then
  echo "Executing OGDI_INFO=$OGDI_INFO seems to have failed."
  echo "Perhaps it is not set properly in the "
  echo `pwd`"/setup.sh script."
  rm -f ogdi_info.tst
  exit 1
fi

rm -f ogdi_info.tst

# -----------------------------------------------------------------------------

(cd vpf; ./vpf_texas.sh)

# -----------------------------------------------------------------------------

(cd dted; ./dted_toronto.sh)

# -----------------------------------------------------------------------------

(cd rpf; ./rpf_ftdrum.sh)





