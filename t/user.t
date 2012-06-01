#!./perl

# $Id: user.t,v 0.2 1999/12/07 20:51:05 ram Exp $
#
#  Copyright (c) 1998-1999, Raphael Manfredi
#  
#  You may redistribute only under the terms of the Artistic License,
#  as specified in the README file that comes with the distribution.
#
# $Log: user.t,v $
# Revision 0.2  1999/12/07 20:51:05  ram
# Baseline for 0.2 release.
#

use LockFile::Simple qw(lock trylock unlock);

print "1..2\n";

my $locker = LockFile::Simple->make(
	-nfs => 1,	# may happen over NFS
	-hold => 0,	# no forced unlocking
);

print "not " unless $locker->hold == 0;
print "ok 1\n";

print "not " unless $locker->nfs == 1;
print "ok 2\n";
