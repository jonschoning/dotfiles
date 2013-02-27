#!/usr/bin/perl
#

use strict;
use Irssi;

use vars qw($VERSION %IRSSI);

$VERSION = "20030208";
%IRSSI = (
    authors     => "Stefan 'tommie' Tomanek",
    contact     => "stefan\@pico.ruhr.de",
    name        => "idlenotify",
    description => "Retrieves the idlenotify of any nick",
    license     => "GPLv2",
    url         => "",
    changed     => "$VERSION",
    commands    => "idle"
);



my %nicks;

sub cmd_idlenotify {
    my ($nicks, $server) = @_;
    foreach (split(/\s+/, $nicks)) {
	push @{$nicks{$server->{chatnet}}}, $_;
	$server->command("whois ".$_." ".$_);
    }
}

sub event_server_event {
    my ($server, $text, $nick, $user) = @_;
    my @items = split(/ /,$text);
    my $type = $items[0];
    
    if ( ($type eq 301) or ($type eq "311") or ($type eq "312") or ($type eq "317") or ($type eq "318") or ($type eq "319") ) {
	my $name = $items[2];
	my $i = 0;
	if ( has_item($name,@{$nicks{$server->{chatnet}}}) ) {
	    Irssi::signal_stop();
	    print_idlenotify($name, $server, $items[3]) if ($type eq "317");
	    splice(@{$nicks{$server->{chatnet}}},$i,1) if ($type eq "318");
	    $i++;
	}
    }
}

sub has_item {
    my ($item, @list) = @_;
    foreach (@list) {
	$item == $_ && return(1);
    }
    return(0)
}

sub print_idlenotify {
    my ($name, $ircnet, $time) = @_;
    my $hours = int($time / 3600);
    my $minutes = int(($time % 3600)/60);
    my $seconds = int(($time % 3600)%60);
    if ( $hours < 1  ) {
        if ($minutes < 30) {
          $ircnet->command("exec date | xargs --replace={} gntp-client -H %DOMAIN% -s True -P %PASSWORD% -n 'ec2/irssi' -N 'idle-notify' -t 'idle-notify: ".$name."' -m '".$name." ".$minutes." min idle on {}' --image 'http://mjpa.co.uk/images/icon-irssi.png'");
          $ircnet->print(undef,$name." is idle for ".$hours." hours, ".$minutes." minutes and ".$seconds." seconds.", MSGLEVEL_CRAP);
      }
    }
}

Irssi::command_bind('idlenotify', 'cmd_idlenotify');
Irssi::signal_add('server event', 'event_server_event');
