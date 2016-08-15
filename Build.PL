use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    dist_name     => 'MySample-Module2',
    module_name   => 'MySample::Module2',
    license       => 'perl',
    dist_author   => 'Yoko Oyama <yowcow@cpan.org>',
    dist_abstract => 'My Sample Module version 2',
    requires      => {
        'File::Spec'       => 0,
        'Moo'              => 0,
        'namespace::clean' => 0,
        'strictures'       => 2,
    },
    configure_requires => { 'Module::Build' => 0, },
    build_requires     => {},
    test_requires      => { 'Test::More'    => 0, },
);

$build->add_build_element('txt');

$build->create_build_script;
