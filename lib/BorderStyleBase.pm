package BorderStyleBase;

use strict 'subs', 'vars';
#use warnings;
use parent 'BorderStyleBase::Constructor';

# AUTHORITY
# DATE
# DIST
# VERSION

sub get_struct {
    my $self_or_class = shift;
    if (ref $self_or_class) {
        \%{"$self_or_class->{orig_class}::BORDER"};
    } else {
        \%{"$self_or_class\::BORDER"};
    }
}

sub get_args {
    my $self = shift;
    $self->{args};
}

sub get_border_char {
    my ($self, $y, $x, $n, $args) = @_;
    $n = 1 unless defined $n;

    my $bs_struct = $self->get_struct;

    my $c = $bs_struct->{chars}[$y][$x];
    if (!defined($c)) {
        if    ($y == 4 && $x == 6) { $c = $bs_struct->{chars}[4][0]  }
        elsif ($y == 4 && $x == 7) { $c = $bs_struct->{chars}[4][3]  }
        elsif ($y == 6)            { $c = $bs_struct->{chars}[0][$x] }
        elsif ($y == 7)            { $c = $bs_struct->{chars}[5][$x] }
        elsif ($y == 8)            {
            $c = $bs_struct->{chars}[4][$x];
            if (!defined($c)) {
                if    ($x == 6) { $c = $bs_struct->{chars}[4][0]  }
                elsif ($x == 7) { $c = $bs_struct->{chars}[4][3]  }
            }
        }
    }
    return unless defined $c;

    if (ref $c eq 'CODE') {
        my $c2 = $c->($self, $y, $x, $n, $args);
        if (ref $c2 eq 'CODE') {
            die "Border character ($y, $x) of style $self->{orig_class} returns coderef, ".
                "which after called still returns a coderef";
        }
        return $c2;
    } else {
        $c = $c x $n if $n != 1;
        $c = "\e(0$c\e(B" if $bs_struct->{box_chars};
    }
    $c;
}

1;
# ABSTRACT: A suitable base class for most BorderStyle::* modules

=for Pod::Coverage ^(.+)$

=head1 DESCRIPTION
