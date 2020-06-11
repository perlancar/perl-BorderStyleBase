package BorderStyle::Test::CustomChar;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;
use parent 'BorderStyleBase';

our %BORDER = (
    v => 2,
    summary => 'A border style that uses a single custom character',
    args => {
        character => {
            schema => 'str*',
            req => 1,
        },
    },
);

sub get_border_char {
    my ($self, $y, $x, $n, $args) = @_;
    $n = 1 unless defined $n;

    $self->{args}{character} x $n;
}

1;
# ABSTRACT:
