use Test2::V0 -no_srand => 1;
use Alien::libnewrelic;
use Test::Alien;

alien_ok 'Alien::libnewrelic';

diag '';
diag '';
diag '';
diag "version = @{[ Alien::libnewrelic->version      ]}";
diag "cflags  = @{[ Alien::libnewrelic->cflags       ]}";
diag "libs    = @{[ Alien::libnewrelic->libs         ]}";
diag "dll     = @{[ Alien::libnewrelic->dynamic_libs ]}";
diag '';
diag '';

my $xs = <<'EOF';
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <libnewrelic.h>

MODULE = TA_MODULE PACKAGE = TA_MODULE

const char* version(class)
    const char *class
  CODE:
    RETVAL = newrelic_version();
  OUTPUT:
    RETVAL
EOF

xs_ok $xs, with_subtest {
  my($nr) = @_;
  my $version = $nr->version;
  is($version, Alien::libnewrelic->version);
};

ffi_ok with_subtest {
  my($ffi) = @_;
  local $@ = '';
  my $nr = eval q{ package NR::FFI;
    local $ENV{FFI_PLATYPUS_DLERROR} = 1;
    use  FFI::CheckLib qw( find_lib );
    use FFI::Platypus::DL qw( dlopen dlerror RTLD_NOW RTLD_GLOBAL );
    my($pcrelib) = find_lib(lib => 'pcre');
    dlopen($pcrelib, RTLD_NOW | RTLD_GLOBAL) || die "error loading $pcrelib @{[ dlerror ]}";
    $ffi->attach(['newrelic_version' => 'version'] => [] => 'string');
    'NR::FFI';
  };
  is $@, '';
  my $version = $nr->version;
  is($version, Alien::libnewrelic->version);
};

done_testing
