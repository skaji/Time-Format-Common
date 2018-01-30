package MyBuilder;
use strict;
use warnings;
use base 'Module::Build';
use Config;

sub new {
    my $class = shift;
    my $self = $class->SUPER::new(
        config => {
            cc => "qrintf/bin/qrintf $Config{cc}",
        },
        add_to_cleanup => ['*.i'],
        @_,
    );
    if (!-d "qrintf/.git") {
        !system "git", "submodule", "update", "-i" or exit 1;
    }
    $self;
}

# sub ACTION_code {
#     my $self = shift;
#     $self->SUPER::ACTION_code(@_);
# }

1;
