
package ErrorHandler;

require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(
    fail
);

my $settings = {
    # way to handle errors: die, print, throw (exception)
    mode => 'die',

    # callback fired when fail sub is invoked
    fail => undef
};



sub new
{
    my ($class, $options) = @_;

    my $self = {};

    foreach my $name (keys %{$options})
    {
        $settings->{$name} = $options->{$name};
    }

    bless $self, $class;
    return $self;
}

sub fail
{
    my ($self, $message) = @_;

    my $mode = $settings->{mode};

    $settings->{fail}($message) if $settings->{fail};

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

1;