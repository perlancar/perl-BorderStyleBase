package BorderStyle::Test::CustomChar;

use strict;
use warnings;
use parent 'BorderStyleBase';

# AUTHORITY
# DATE
# DIST
# VERSION

our %BORDER = (
    v => 2,
    summary => 'A border style that uses a single custom character',
    args => {
        character => {
            schema => 'str*',
            req => 1,
        },
    },
    examples => [
        {
            summary => "Use x as the border character",
            args => {character=>"x"},
        },
    ],
);

sub get_border_char {
    my ($self, $y, $x, $n, $args) = @_;
    $n = 1 unless defined $n;

    $self->{args}{character} x $n;
}

1;
# ABSTRACT:
