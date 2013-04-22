use Modern::Perl;
use Test::More	tests => 2;

use_ok 'App::Dropapp';

my $dropapp = App::Dropapp->new();
isa_ok $dropapp, 'App::Dropapp';
