# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl SFML.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 5 + 3;
BEGIN { use_ok('SFML::Window') }

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $context = new SFML::Window::VideoMode(800,600);

isa_ok($context, "SFML::Window::VideoMode");

can_ok($context, qw(isValid getWidth getHeight getBitsPerPixel setWidth setHeight setBitsPerPixel));

can_ok("SFML::Window::VideoMode", qw(getDesktopMode getFullscreenModes));

isa_ok(SFML::Window::VideoMode::getDesktopMode, "SFML::Window::VideoMode");

$context->setBitsPerPixel(16);

our %t = qw(Width 800 Height 600 BitsPerPixel 16);
is(eval '$context->get' . $_, $t{$_}, $_) for keys %t;

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
