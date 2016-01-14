#!/apollo/env/SDETools/bin/perl5.8

use Amazon::Odin::REST;

my $materialSet = $ARGV[0];
my $materialSerial = defined $ARGV[1] ? $ARGV[1] : undef;
my $odin = Amazon::Odin::REST->new();
my $error = "Invalid credentials, or access denied.\nCheck that you have pushed the credentials to your desktop and have permissions to decrypt and retrieve the credential in the Odin UI.\n";

die $error unless $odin->retrieve($materialSet, "Credential", $materialSerial);
printf "user: %s\n", $odin->retrieve($materialSet, "Principal", $materialSerial)->{materialData};
printf "pass: %s\n", $odin->retrieve($materialSet, "Credential", $materialSerial)->{materialData};
