package MySample::Module2;
use strict;
use warnings;

our $VERSION = '0.0.1';

use File::Basename qw(dirname);
use File::Spec;
use Moo;
use strictures 2;
use namespace::clean;

has fh => (
    is      => 'ro',
    default => sub {
        my $path = File::Spec->catfile(dirname(__FILE__), 'Module2', 'data.txt');
        open my $fh, '<', $path or die "Failed opening file: $!";
        binmode $fh, ':utf8';
        $fh;
    },
);

sub next {
    my $self = shift;
    my $fh   = $self->fh;
    my $ret  = <$fh>;
    $ret
        ? do {
        $ret =~ s/\R//sg;
        $ret;
        }
        : undef;
}

1;
