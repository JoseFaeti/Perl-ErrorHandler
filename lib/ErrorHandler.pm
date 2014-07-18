
package ErrorHandler;

require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(
    fail
);

my %settings = (
    # way to handle errors: die, print, throw (exception)
    mode => 'die'
);



sub new
{
    print "hello there I'm an ErrorHandler!";
}

sub fail
{
    my ($message) = @_;

    my $mode = $settings{mode};

    if ($mode eq 'die')
    {
        die "$message\n";
    }
    elsif ($mode eq 'print')
    {
        print "$message\n";
    }
    elsif ($mode eq 'throw')
    {
        $@ = "$message\n";
        die;
    }
}

sub set
{
    my ($settings) = @_;

    foreach my $name (keys %{$settings})
    {
        $settings{$name} = $settings->{$name};
    }
}

1;