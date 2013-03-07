# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl SFML.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 4 + 5;
BEGIN { use_ok('SFML::Window') }

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $context = new SFML::Window::ContextSettings(depthBits => 20, stencilBits => 10, antialiasingLevel => 5, majorVersion => 50, minorVersion => 100);

isa_ok($context, "SFML::Window::ContextSettings");

can_ok($context, qw(setDepthBits setStencilBits setAntialiasingLevel setMajorVersion setMinorVersion));
can_ok($context, qw(getDepthBits getStencilBits getAntialiasingLevel getMajorVersion getMinorVersion));

is($context->getDepthBits,         20,  "getDepthBits");
is($context->getStencilBits,       10,  "getStencilBits");
is($context->getAntialiasingLevel, 5,   "getAntialiasingLevel");
is($context->getMajorVersion,      50,  "getMajorVersion");
is($context->getMinorVersion,      100, "getMinorVersion");        # Not working properly atm

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
