#!/usr/local/bin/perl

use strict;
use warnings;
use lib qw(../lib/);
use Gorilla;


use constant PATH => "./";

my $gorilla = Gorilla->new(PATH);
$gorilla->start();
