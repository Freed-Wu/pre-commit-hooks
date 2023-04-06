#!/usr/bin/env -S perl -pi
unless ( $#ARGV < 0 ) {
    $name        = $1 if not defined $name and /^name = "([^"]*+)"/;
    $description = $1
      if not defined $description and /^description = "([^"]*+)"/;
    $url = $1 if not defined $url and /^Source = "([^"]*+)"/;
    next;
}
s/(?<=^title: ")[^"]*/$name: $description/;
s/(?<=^url: ")[^"]*/$url/;
