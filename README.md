# Alien::libnewrelic [![Build Status](https://travis-ci.org/plicease/Alien-libnewrelic.svg)](http://travis-ci.org/plicease/Alien-libnewrelic)

Alien to download and install libnewrelic

# SYNOPSIS

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Alien::Base::Wrapper ();

WriteMakefile(
  Alien::Base::Wrapper->new('Alien::libnewrelic')->mm_args2(
    # MakeMaker args
    NAME => 'Kafka::Librd',
    ...
  ),
);
```

In your Build.PL:

```perl
use Module::Build;
use Alien::Base::Wrapper qw( Alien::libnewrelic !export );

my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::libnewrelic' => '0',
    ...
  },
  Alien::Base::Wrapper->mb_args,
  ...
);

$build->create_build_script;
```

In your [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus) script or module:

```perl
use FFI::Platypus;
use Alien::libnewrelic;

my $ffi = FFI::Platypus->new(
  lib => [ Alien::libnewrelic->dynamic_libs ],
);
```

# DESCRIPTION

This distribution provides NewRelic SDK so that it can be used by other
Perl distributions that are on CPAN.  It does this by first trying to
detect an existing install of NewRelic SDK on your system.  If found it
will use that.  If it cannot be found, the source code will be downloaded
from the internet and it will be installed in a private share location
for the use of other modules.

# SEE ALSO

- [NewRelic](https://metacpan.org/pod/NewRelic)

    Perl level bindings for this SDK.

- [NewRelic::Agent::FFI](https://metacpan.org/pod/NewRelic::Agent::FFI)

    This works with the older (no longer supported) NewRelic Agent SDK

- [NewRelic::Agent](https://metacpan.org/pod/NewRelic::Agent)

    This is an even older XS API around the NewRelic Agent SDK, but doesn't link correctly against the NewRelic libraries.

    https://github.com/aanari/NewRelic-Agent/issues/2

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
