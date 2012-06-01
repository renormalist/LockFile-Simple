#!./perl

# $Id: simple.t,v 0.2 1999/12/07 20:51:05 ram Exp $
#
#  Copyright (c) 1998-1999, Raphael Manfredi
#  
#  You may redistribute only under the terms of the Artistic License,
#  as specified in the README file that comes with the distribution.
#
# $Log: simple.t,v $
# Revision 0.2  1999/12/07 20:51:05  ram
# Baseline for 0.2 release.
#

use LockFile::Simple;

$| = 1;				# We're going to fork
print "1..6\n";

#
# Basic tests made via the OO interface.
#

my $manager = LockFile::Simple->make;

unlink 't.lock';

my $lock = $manager->lock('t');

print "not " unless ref $lock;
print "ok 1\n";

print "not " unless -r 't.lock';
print "ok 2\n";

print "not " if $manager->trylock('t');
print "ok 3\n";

print "not " unless $manager->unlock('t');
print "ok 4\n";

print "not " if -f 't.lock';
print "ok 5\n";

#
# Autocleaning
#

sub mark {
	my ($msg) = join(' ', @_);
	open(MARK, ">t.mark");
	print MARK "$msg\n";
	close MARK;
}

$manager = LockFile::Simple->make(-autoclean => 1, -wfunc => \&mark);

unlink 't.mark';

if (0 == fork()) {
	$manager->lock('t');
	exit 0;
}

wait;

print "not " unless -r 't.mark';
print "ok 6\n";

