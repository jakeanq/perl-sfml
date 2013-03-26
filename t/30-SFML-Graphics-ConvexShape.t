# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl SFML.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 6;
BEGIN { use_ok('SFML::Graphics') }

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $context = new SFML::Graphics::ConvexShape(100);

isa_ok($context, "SFML::Graphics::ConvexShape");

can_ok($context, qw(setPoint setPointCount setTexture setTextureRect setFillColor setOutlineColor setOutlineThickness));
can_ok($context, qw(getPoint getPointCount getTextureRect getFillColor getOutlineColor getOutlineThickness));
can_ok($context, qw(getLocalBounds getGlobalBounds setPosition getPosition setOrigin getOrigin setRotation getRotation));
can_ok($context, qw(getScale setScale move rotate getTransform getInverseTransform));

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
