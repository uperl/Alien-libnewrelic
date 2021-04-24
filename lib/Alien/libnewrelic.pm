package Alien::libnewrelic;

use strict;
use warnings;
use 5.014;
use base qw( Alien::Base );

# ABSTRACT: Alien to download and install libnewrelic
# VERSION
# ALIEN SYNOPSIS
# ALIEN DESCRIPTION

=head1 SEE ALSO

=over 4

=item L<NewFangle>

Perl level bindings for this SDK.

=item L<NewRelic::Agent::FFI>

This works with the older (no longer supported) NewRelic Agent SDK

=item L<NewRelic::Agent>

This is an even older XS API around the NewRelic Agent SDK, but doesn't link correctly against the NewRelic libraries.

https://github.com/aanari/NewRelic-Agent/issues/2

=back

=cut

1;
