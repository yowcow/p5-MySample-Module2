use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    AUTHOR       => 'Yoko Oyama <yowcow@cpan.org>',
    DISTNAME     => 'MySample-Module2',
    NAME         => 'MySample::Module2',
    VERSION_FROM => 'lib/MySample/Module2.pm',
    LICENSE      => 'perl_5',

    PREREQ_PM      => {},
    BUILD_REQUIRES => {},
    TEST_REQUIRES  => { 'Test::More' => 0, },

    test => { TESTS => 't/*.t t/*/*.t', },
);
