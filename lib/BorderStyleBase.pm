package BorderStyleBase;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict 'subs', 'vars';
#use warnings;
use parent 'BorderStyleBase::Constructor';

sub get_struct {
    my $self = shift;
    \%{"$self->{orig_class}::BORDER"};
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
    return unless defined $c;

    if (ref $c eq 'CODE') {
        my $c2 = $c->($self, $y, $x, $n, $args);
        if (ref $c2 eq 'CODE') {
            die "Border character ($y, $x) of style $self->{orig_class} returns coderef, ".
                "which after called still returns a coderef";
        }
        return $c2;
    } else {
        $c = $c x $n if $n > 1;
        $c = "\e(0$c\e(B" if $bs_struct->{box_chars};
    }
    $c;
}

1;
# ABSTRACT: A suitable base class for most BorderStyle::* modules

=for Pod::Coverage ^(.+)$

=head1 DESCRIPTION
