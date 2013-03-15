# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl SFML.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 1;
BEGIN { use_ok('SFML::Window'); }

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $window = new SFML::Window::Window(new SFML::Window::VideoMode(800,600), "perl-sfml");

my $tm = time + 30;

my $event = new SFML::Window::Event;

while($window->isOpen){
	while($window->pollEvent($event)){
		if($event->type == SFML::Window::Event::Closed || time > $tm){
			$window->close;
		}
	}
	
	$window->display;
}


=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
