package SFML;

use 5.008009;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use SFML ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = (
	'all' => [ qw(

		  ) ]);

our @EXPORT_OK = (@{ $EXPORT_TAGS{'all'} });

our @EXPORT = qw(

);

our $VERSION = '0.01'; # Alpha!

require XSLoader;
XSLoader::load('SFML', $VERSION);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

SFML - Perl extension that enables the use of the SFML multimedia library.

=head1 SYNOPSIS

  use SFML;

=head1 DESCRIPTION

SFML is a free multimedia C++ API that provides you low and high level access to graphics, input, audio, etc.
The SFML is that, but with Perl!

=head2 EXPORT

None by default.

=head1 SEE ALSO

www.sfml-dev.org

github.com/jakeanq/perl-sfml/

=head1 AUTHOR

Jake Bott, E<lt>jakeanq@gmail.comE<gt>
Gosha Tugai E<lt>whatever.the.correct@email.address.isE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Jake Bott, Gosha Tugai

See the LICENCE file that should have been included with this 

=cut

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
