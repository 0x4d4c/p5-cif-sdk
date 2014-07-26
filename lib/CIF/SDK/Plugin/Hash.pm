package CIF::SDK::Plugin::Hash;

use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration   use CIF ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
    is_hash hash_create_random is_hash_sha256 hash_create_static
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

my $HTYPES = {
    'uuid'      => qr/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/,
    'md5'       => qr/^[a-fA-F0-9]{32}$/,
    'sha1'      => qr/^[a-fA-F0-9]{40}$/,
    'sha256'    => qr/^[a-fA-F0-9]{64}$/,
    'sha512'    => qr/^[a-fA-F0-9]{128}$/,
};

sub is_hash {
    my $arg = shift || return(0);

    foreach (keys %$HTYPES){
        return $_ if(lc($arg) =~ $HTYPES->{$_});
    }
}

sub is_uuid {
    my $arg = shift;
    return unless($arg && $arg =~ /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/);
    return(1);
}

sub is_md5 {
    my $arg = shift || return(0);
    return unless(lc($arg) =~ /^[a-f0-9]{32}$/);
}

sub is_sha1 {
    my $arg = shift || return(0);
    return unless(lc($arg) =~ /^[a-f0-9]{40}$/);
}

sub is_sha256 {
    my $arg = shift || return(0);
    return unless(lc($arg) =~ /^[a-f0-9]{64}$/);
}

sub is_sha512 {
    my $arg = shift || return(0);
    return unless(lc($arg) =~ /^[a-f0-9]{128}$/);
}

1;