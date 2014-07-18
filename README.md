#ErrorHandler

Simple module to uniform and ease the management of error calls across a Perl program.

It abstracts an error function so that errors can be handled the same way across all program.

## Usage

```
use ErrorHandler;

my $handler = new ErrorHandler;
$handler->fail('Error message');
```

Settings can be specified during instantiation:

```
use ErrorHandler;

my $handler = new ErrorHandler({
  mode => 'print'
});

$handler->fail('Error message'); # will print instead of dying
```

## Settings

Settings can be specified during instantiation by passing a hash reference to the constructor.

### mode

String.

Specifies which method will be used to handle the error. Can be one of `die`, `print`, or `throw`. Default is `die`.

- `die` outputs the message and terminates the program.
- `print` outputs the message and continue as nothing happened.
- `throw` throws an exception (sets the message in `$@` and dies).

### fail

Sub.

Specifies a callback sub to be called every time the `fail` method is invoked.

```
my $handler = new ErrorHandler({
  fail => sub {
    my $error_message = @_;
    # custom code here...
  }
});

$handler->fail('some error message');
```

After the callback has been invoked, the `fail` function will handle the error normally.
