use File::Find;
use Digest::SHA qw(sha1_hex);
our @tests;
find({
		wanted => sub {
			return if not -f;
			/^t\/(\d+)(?:-(\d+))?-SFML(?:-(.*))?\.t$/;
			my ($major, $minor, $sortkey) = ($1, $2, $3);
			my ($l2ns, @rest) = split /-/, $sortkey;
			my $tail = join "-", @rest;
			push @{ $tests[$major] }, { major => $major, minor => $minor, sk => $sortkey, name => $_, sminor => $minor, tail => $tail };
		},
		no_chdir => 1
	},
	't');

foreach (@tests) {
	if (scalar(@$_) > 1) {    #Multiple minors.
		my @new = sort { $a->{sk} cmp $b->{sk} } @$_;
		my $n   = 1;
		my $pad = 1 + int(log(scalar(@new) + $n - 1) / log(10));
		foreach (@new) {
			$_->{minor} = sprintf "%0${pad}i", $n++;
			my $newname = sprintf "t/%s-%s-%s.t", $_->{major}, $_->{minor}, $_->{sk};
			printf "%-40s => %s\n", $_->{name}, $newname;
			system('git', 'mv', $_->{name}, $newname);
		}
	}
}

=head1 COPYRIGHT

 ############################################
 # Copyright 2013 Jake Bott, Georgiy Tugai. #
 #=>--------------------------------------<=#
 #  All Rights Reserved. Part of perl-sfml  #
 ############################################

=cut
