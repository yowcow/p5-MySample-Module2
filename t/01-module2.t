use strict;
use warnings;
use MySample::Module2;
use Test::More;

is(MySample::Module2->foo, 'bar');

done_testing;
