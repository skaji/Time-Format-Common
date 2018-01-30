package Time::Format::Common;
use strict;
use warnings;

our $VERSION = '0.001';

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

use Exporter 'import';
our @EXPORT_OK = qw(iso8601);

1;
__END__

=encoding utf-8

=head1 NAME

Time::Format::Common - Blah blah blah

=head1 SYNOPSIS

  use Time::Format::Common 'iso8601';

  print iso8601(); #=> 2018-01-31T02:27:52+09:00

=head1 DESCRIPTION

Time::Format::Common is

=head1 AUTHOR

Shoichi Kaji <skaji@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
