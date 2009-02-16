#!/bin/sh
#
#  @(#)xbm2ikon 1.5 94/03/20
#
#  Copyright (c) Steve Kinzler - March 1994.
#
#  Permission is given to distribute these sources, as long as the
#  copyright messages are not removed, and no monies are exchanged.
#
#  No responsibility is taken for any errors on inaccuracies inherent
#  either to the comments or the code of this program, but if reported
#  to me, then an attempt will be made to fix them.

PATH=$PATH:/usr/bin/X11; export PATH

# xbm2ikon - convert an X11 bitmap to a Blit ikon bitmap
# stdin/stdout filter
# requires some bitmap filters from the pbmplus package
# kludge by kinzler@cs.indiana.edu

xbmtopbm |
pbmtoicon |
sed -e 1,2d -e '$s/$/,/' |
tr -d '\011\012' |
tr ',' '\012' |
sed 's/^0x//; s/^/0x/' |
pr -l1 -t -w22 -3 -s, |
sed -e 's/$/,/' -e 's/\(0x....\)\(0x....\)\(0x....\),/\1,\2,\3,/'