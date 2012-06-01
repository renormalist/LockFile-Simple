# $Id: Makefile.PL,v 0.2 1999/12/07 20:51:05 ram Exp $
#
#  Copyright (c) 1998-1999, Raphael Manfredi
#  
#  You may redistribute only under the terms of the Artistic License,
#  as specified in the README file that comes with the distribution.
#
# $Log: Makefile.PL,v $
# Revision 0.2  1999/12/07 20:51:05  ram
# Baseline for 0.2 release.
#

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'			=> 'LockFile::Simple',
    'VERSION_FROM'	=> 'Simple.pm', # finds $VERSION
    'PMLIBDIRS'		=> [ 'Lock' ],
	'dist'			=> { SUFFIX => 'gz', COMPRESS => 'gzip -f' },
	'clean'			=> {'FILES' => '*%'},
);

