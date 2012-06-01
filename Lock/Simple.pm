;# $Id
;#
;#  Copyright (c) 1998-1999, Raphael Manfredi
;#  
;#  You may redistribute only under the terms of the Artistic License,
;#  as specified in the README file that comes with the distribution.
;#
;# $Log: Simple.pm,v $
;# Revision 0.2  1999/12/07 20:51:04  ram
;# Baseline for 0.2 release.
;#

use strict;

########################################################################
package LockFile::Lock::Simple;

require LockFile::Lock;

use vars qw(@ISA);

@ISA = qw(LockFile::Lock);

#
# ->make
#
# Creation routine
#
# Attributes:
#
#	scheme		the LockFile::* object that created the lock
#	file		the locked file
#	format		the format used to create the lockfile
#
sub make {
	my $self = bless {}, shift;
	my ($scheme, $file, $format) = @_;
	$self->{'file'} = $file;
	$self->{'format'} = $format;
	$self->_lock_init($scheme);
	return $self;
}

#
# Attribute access
#

sub file	{ $_[0]->{'file'} }
sub format	{ $_[0]->{'format'} }

1;

