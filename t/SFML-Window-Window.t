# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl SFML.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 5 + 5 + 3;
BEGIN { use_ok('SFML::Window') }

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $vm = SFML::Window::VideoMode->new(800, 600);
isa_ok($vm, 'SFML::Window::VideoMode');
my $window = new SFML::Window::Window($vm, "perl-sfml test window");

isa_ok($window, "SFML::Window::Window");

can_ok($window, qw(create close isOpen getSettings getPosition setPosition getSize setSize setTitle));
can_ok($window, qw(setVisible setIcon setVerticalSyncEnabled setMouseCursorVisible setKeyRepeatEnabled));
can_ok($window, qw(setFramerateLimit setJoystickThreshold setActive display));
#can_ok($window, qw(pollEvent waitEvent));

my $cs = SFML::Window::ContextSettings->new(depthBits => 24, stencilBits => 8, minorVersion => 1);
isa_ok($cs, 'SFML::Window::ContextSettings');
#TODO: Exchange 7 for SFML::Window::Style::Default when constants are finished.
$window->create($vm, "perl-sfml test window", 7, $cs);
isa_ok($window, 'SFML::Window::Window');
my $c = $window->getSettings;
isa_ok($c, "SFML::Window::ContextSettings");

my $d = new SFML::Window::ContextSettings(depthBits => 24, stencilBits => 8, minorVersion => 1);
is($c->getDepthBits,   $d->getDepthBits,   "getSettings DepthBits value check");
is($c->getStencilBits, $d->getStencilBits, "getSettings StencilBits value check");
TODO: {
	local $TODO = 'Some hardware forces particular versions of GL context.';
	is($c->getMajorVersion, $d->getMajorVersion, "getSettings MajorVersion value check");
	is($c->getMinorVersion, $d->getMinorVersion, "getSettings MinorVersion value check");
}

$window->isOpen;

=ignore
$window->setPosition(10, 20);

my ($x, $y) = $window->getPosition;

is($x, 10, "getPosition - x"); #Commented until further info available
is($y, 20, "getPosition - y");

$window->setSize(640, 480);

($x, $y) = $window->getSize;

is($x, 640, "getSize - x"); #Commented until further info available
is($y, 480, "getSize - y");
=cut

$window->setVisible(1);

$window->setVerticalSyncEnabled;
$window->setVerticalSyncEnabled(0);

$window->setMouseCursorVisible(0);
$window->setMouseCursorVisible;

$window->setKeyRepeatEnabled(0);
$window->setKeyRepeatEnabled;

$window->setFramerateLimit(100);
$window->setFramerateLimit(0);

$window->setJoystickThreshold(0.2);

$window->setActive(0);
$window->setActive;

$window->display();
#our %t = qw(Width 800 Height 600 BitsPerPixel 16);
#is(eval '$window->get' . $_, $t{$_}, $_) for keys %t;

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
