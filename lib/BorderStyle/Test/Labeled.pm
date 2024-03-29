package BorderStyle::Test::Labeled;

use strict;
use warnings;
use utf8;

use parent 'BorderStyleBase';

# AUTHORITY
# DATE
# DIST
# VERSION

our %BORDER = (
    v => 2,
    summary => 'A border style that uses labeled characters as described in specification, to show which character goes where',
    chars => [                                     # y
        # 0    1    2    3    4    5    6    7     <-- x
        ['A', 'B', 'C', 'D'],                      # 0
        ['E', 'F', 'G'],                           # 1
        ['H', 'I', 'J', 'K', 'a', 'b', 'c', 'd'],  # 2
        ['L', 'M', 'N'],                           # 3
        ['O', 'P', 'Q', 'R', 'e', 'f', 'g', 'h'],  # 4
        ['S', 'T', 'U', 'V'],                      # 5

        ['Ȧ', 'Ḃ', 'Ċ', 'Ḋ'], # 6
        ['Ṣ', 'Ṭ', 'Ụ', 'Ṿ'], # 7

        ['Ȯ', 'Ṗ', 'Ꝙ', 'Ṙ', 'ė', 'ḟ', 'ġ', 'ḣ'],  # 8
    ],
    utf8 => 1,
);

1;
# ABSTRACT:
