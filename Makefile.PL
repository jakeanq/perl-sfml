use 5.008009;
use ExtUtils::MakeMaker;
use Config;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $clang = `clang -v 2>&1` ne '';
print "Using clang compiler\n" if($clang);
my $gpp = `g++ -v 2>&1` ne '';
my $fallback = $Config{cc} . " -x c++ -Wall -ggdb";

my $compiler = 
WriteMakefile(
	NAME         => 'SFML',
	VERSION_FROM => 'lib/SFML.pm',    # finds $VERSION
	PREREQ_PM    => {},               # e.g., Module::Name => 1.1
	ABSTRACT_FROM => 'lib/SFML.pm',                                                                         # retrieve abstract from module
	AUTHOR        => 'Jake Bott <jakeanq@gmail.com>, Gosha Tugai <whatever.the.correct@email.address.is>',
	CC => ($clang?'clang -x c++ -Wall -ggdb -Wno-duplicate-decl-specifier':
		($gpp? 'g++ -Wall -ggdb':
		$fallback)),
	LD       => $Config{ld}.' -Wall -ggdb',
	XSOPT    => '-C++',
	TYPEMAPS => ['perlobject.map'],
	LIBS     => ['-lGL -lsfml-window -lsfml-system'],                                                               # e.g., '-lm'
	DEFINE   => '',                                                                                                 # e.g., '-DHAVE_SOMETHING'
	INC      => '-I.',                                                                                              # e.g., '-I. -I/usr/include/other'
	                                                                                                                # Un-comment this if you add C files to link with later:
	                                                                                                                # OBJECT            => '$(O_FILES)', # link all the C files too
);

=head1 COPYRIGHT

 ##########################################
 # Copyright 2013 Jake Bott, Gosha Tugai. #
 #=>------------------------------------<=#
 # All Rights Reserved. Part of perl-sfml #
 ##########################################

=cut
