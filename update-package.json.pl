#!/usr/bin/env -S perl -pi
use version;
use experimental qw(try);
use Env          qw(GITHUB_REF_NAME);

BEGIN {
    unless ( $GITHUB_REF_NAME eq '' ) {
        $version = $GITHUB_REF_NAME;
    }
    else {
        $version = `git describe --abbrev=0`;
        chomp $version;
        $version = '0.0.0' if $version eq '';
    }
}
if ( not defined $name and /^name = "([^"]*+)"/ ) {
    $name = $1;
    next;
}
if ( not defined $description and /^description = "([^"]*+)"/ ) {
    $description = $1;
    next;
}
if ( not defined $url and /^Source = "([^"]*+)"/ ) {
    $url = $1;
    next;
}
if ( not defined $author
    and /^authors = \[\{ name = "([^"]*+)", email = "([^"]*+)" }]/ )
{
    $author = "$1 <$2>";
    next;
}
s/(?<="name": ")[^"]*/$name/               if defined $name;
s/(?<="description": ")[^"]*/$description/ if defined $description;
$current_version = $1                      if /(?<="version": ")([^"]*)/;
try {
    s/(?<="version": ")[^"]*/$version/
      if defined current_version
      and version->new($version) > version->new($current_version);
}
catch ($err) {
}
s/(?<="author": ")[^"]*/$author/ if defined $author;
s/(?<="url": ")[^"]*/$url/       if defined $url;
