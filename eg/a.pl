#!/usr/bin/env perl
use strict;
use warnings;
use Benchmark 'cmpthese';

use blib;
use Time::Format::Common 'iso8601';
use POSIX ();

cmpthese -1, {
    posix => sub {
        my $t = POSIX::strftime("%Y-%m-%d %H:%M:%S", localtime);
    },
    iso8601 => sub {
        my $t = iso8601;
    },
};

