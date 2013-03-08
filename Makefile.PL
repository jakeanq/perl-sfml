use 5.008009;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	NAME         => 'SFML',
	VERSION_FROM => 'lib/SFML.pm',    # finds $VERSION
	PREREQ_PM    => {},               # e.g., Module::Name => 1.1
	(
		$] >= 5.005
		?                             ## Add these new keywords supported since 5.005
		  (
			ABSTRACT_FROM => 'lib/SFML.pm',                                                                         # retrieve abstract from module
			AUTHOR        => 'Jake Bott <jakeanq@gmail.com>, Gosha Tugai <whatever.the.correct@email.address.is>'
		  )
		: ()
	),
	CC => 'clang -x c++ -Wall -ggdb -Wno-duplicate-decl-specifier',
	#CC       => 'g++ -Wall -ggdb',
	LD       => 'g++ -Wall -ggdb',
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
