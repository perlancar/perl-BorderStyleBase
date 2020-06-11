package BorderStyle::Test::Labeled;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;
use parent 'BorderStyleBase';

our %BORDER = (
    v => 2,
    summary => 'A border style that uses labeled characters as described in specification',
    args => {
        on => {
            summary => 'An argument that is required',
            schema => 'str*',
            req => 1,
        },
        opt =>  {
            summary => 'An argument that is optional',
            schema => 'str*',
            req => 1,
        },
    },
    chars => [                 # y
        # 0    1    2    3 <-- x
        ['A', 'b', 'C', 'D'],  # 0
        ['E', 'F', 'G'],       # 1
        ['H', 'i', 'J', 'K'],  # 2
        ['L', 'M', 'N'],       # 3
        ['O', 'p', 'Q', 'R'],  # 4
        ['S', 't', 'U', 'V'],  # 5
    ],
);

1;
# ABSTRACT:
