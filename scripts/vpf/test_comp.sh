#!/bin/sh

#
# Usage: test_comp.sh new_file test_name
#
# eg. 
#  % test_comp.sh temp_texas texas-2
#

TEST_NAME=$2

NEW_FILE=${TEST_NAME}.new
OLD_FILE=${TEST_NAME}.out
DIFF_FILE=${TEST_NAME}.diff

mv $1 $NEW_FILE

if test ! -f $OLD_FILE ; then
  echo "No existing file $OLD_FILE, adopting current output."
  mv $NEW_FILE $OLD_FILE
  exit
fi

rm -f $DIFF_FILE
diff $OLD_FILE $NEW_FILE | head -200 > $DIFF_FILE
if test ! -s $DIFF_FILE ; then
  echo "Test $TEST_NAME passed."
  rm -f $DIFF_FILE $NEW_FILE
  exit
fi

echo "*******************************************************************"
echo "Test $TEST_NAME failed."
echo "The current output can be found in $NEW_FILE."
echo "The expected output can be found in $OLD_FILE."
echo "The first 100 lines of diffs can be found in $DIFF_FILE."
echo
echo "Please review the differences, and if acceptable move"
echo "$NEW_FILE to $OLD_FILE to indicate it is now the expected result."
echo "*******************************************************************"



