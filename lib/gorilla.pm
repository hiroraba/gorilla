package Gorilla;

use strict;
use 5.008_005;
our $VERSION = '0.01';

use File::Next;
use Filesys::Notify::Simple;

sub new {
  my ($class, $path) = @_;
  
  my $file_list;
  my $files = File::Next::files($path);
  while (defined(my $file = $files->())) {
    push (@{$file_list}, $file);
  }
  die "Files Not Found." unless (scalar(@{$file_list}) > 0);
  my $self = bless { file_list => $file_list }, $class;
  return $self;
}

sub start {
  my $class = shift;

  my $count = 1;
  while (1) {
    
    print "[gorilla ($count) ] --" . "\n >> ";
    my $watcher_path = &_watcher_gorilla($class->{file_list});
    my $prove_result;
 
    if ($watcher_path =~ /(.*)\.t$/) {
      $prove_result = `prove $watcher_path`;
    } elsif ($watcher_path =~ /((.*)\.pl$)|((.*)\.pm$)/) {
      $prove_result = `prove`;
    }

    print $prove_result unless (!defined($prove_result));
    $count++;

  }
}

sub _watcher_gorilla {
  my ($file_list) = shift;
  my $watcher = Filesys::Notify::Simple->new($file_list);
  $watcher->wait(sub {
      for my $event (@_) {
	return $event->{path};
      }
    });
}

1;
__END__

=encoding utf-8

=head1 NAME

Gorilla - Blah blah blah

=head1 SYNOPSIS

  use Gorilla;

=head1 DESCRIPTION

Gorilla is

=head1 AUTHOR

hiroraba E<lt>hiroraba@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2013- hiroraba

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
