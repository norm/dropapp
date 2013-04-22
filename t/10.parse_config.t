use Modern::Perl;
use Test::More	tests => 1;

use App::Dropapp;
my $dropapp = App::Dropapp->new();


subtest 'Test example config file' => sub {
    my $config   = $dropapp->parse_config( 't/example.conf' );
    my $expected = {
            Preferences => {
                dir  => [],
                file => [ 'com.apple.Dock.plist', ],
            },
            'Application Support' => {
                dir  => [ 'Dock', ],
                file => [],
            },
        };
    
    is_deeply( $config, $expected )
        or diag explain $config;
};
