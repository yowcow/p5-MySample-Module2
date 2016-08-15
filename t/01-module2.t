use strict;
use utf8;
use warnings;
use MySample::Module2;
use Test::More;

my $mod = MySample::Module2->new;

is $mod->next, 'あ';
is $mod->next, 'い';
is $mod->next, 'う';
is $mod->next, undef;

done_testing;
