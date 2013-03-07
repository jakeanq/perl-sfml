# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl SFML.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4 + 3;
BEGIN { use_ok('SFML::Window') }

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $context = new SFML::Window::ContextSettings(1,1,1,2,1);

isa_ok($context, "SFML::Window::ContextSettings");

can_ok($context, qw(setDepthBits setStencilBits setAntialiasingLevel setMajorVersion setMinorVersion));
can_ok($context, qw(getDepthBits getStencilBits getAntialiasingLevel getMajorVersion getMinorVersion));

is($context->getDepthBits, 1, "getDepthBits");
is($context->getStencilBits,1,"getStencilBits");
is($context->getAntialiasingLevel,1,"getAntialiasingLevel");
#is($context->getStencilBits,2,"getMajorVersion");
#is($context->getStencilBits,1,"getMinorVersion"); # Not working properly atm

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
