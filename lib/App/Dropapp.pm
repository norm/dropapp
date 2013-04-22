package App::Dropapp;

use Modern::Perl;
use Moose;
use MooseX::Method::Signatures;

use IO::All;



method parse_config( $file ) {
    my $config < io $file;
    my @lines  = split /\n+/, $config;
    
    my %config;
    my $directory = '';
    
    LINE:
    foreach my $line ( @lines ) {
        next if $line =~ m{^\s*#};
        next if $line =~ m{^\s*$};
        
        if ( $line =~ m{^\[(.*)\]\s*$} ) {
            $directory = $1;
            $config{$directory}{'file'} = [];
            $config{$directory}{'dir'}  = [];
            next LINE;
        }
        
        if ( $line =~ m{^\s*file\s+(.*?)\s*$} ) {
            say " -- [$directory] MATCH file '$1'";
            push @{$config{$directory}{'file'}}, $1;
        }
        elsif ( $line =~ m{^\s*dir\s+(.*?)\s*$} ) {
            say " -- [$directory] MATCH dir '$1'";
            push @{$config{$directory}{'dir'}}, $1;
        }
        else {
            say " -- [$directory] $line";
        }
    }
    
    return \%config;
}

1;
