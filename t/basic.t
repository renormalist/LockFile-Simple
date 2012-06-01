#!./perl

# $Id: basic.t,v 0.1.1.1 1998/05/12 07:42:20 ram Exp $
#
#  Copyright (c) 1998, Raphael Manfredi
#  
#  You may redistribute only under the terms of the Artistic License,
#  as specified in the README file that comes with the distribution.
#
# $Log: basic.t,v $
# Revision 0.1.1.1  1998/05/12  07:42:20  ram
# patch1: Baseline for first alpha release.
#

use LockFile::Simple qw(lock trylock unlock);

print "1..5\n";

unlink 't.lock';
print "not " unless lock('t');
print "ok 1\n";

print "not " unless -r 't.lock';
print "ok 2\n";

print "not " if trylock('t');
print "ok 3\n";

print "not " unless unlock('t');
print "ok 4\n";

print "not " if -f 't.lock';
print "ok 5\n";

