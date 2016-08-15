use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'MySample::Module2',
    VERSION_FROM => 'lib/MySample/Module2.pm',
    test         => { TESTS => 't/*.t t/*/*.t', },
);
