;# $Id
;#
;#  Copyright (c) 1998-1999, Raphael Manfredi
;#  
;#  You may redistribute only under the terms of the Artistic License,
;#  as specified in the README file that comes with the distribution.
;#
;# $Log: Lock.pm,v $
;# Revision 0.2  1999/12/07 20:51:04  ram
;# Baseline for 0.2 release.
;#

use strict;

########################################################################
package LockFile::Lock;

#
# A lock instance -- deferred class.
#

#
# ->_lock_init
#
# Common lock initialization
#
# Attributes:
#
#	scheme		the LockFile::* object that created the lock
#
sub _lock_init {
	my $self = shift;
	my ($scheme) = @_;
	$self->{'scheme'} = $scheme;
}

#
# Common attribute access
#

sub scheme	{ $_[0]->{'scheme'} }

#
# ->release
#
# Release the lock
#
sub release {
	my $self = shift;
	return $self->scheme->release($self);
}

1;

