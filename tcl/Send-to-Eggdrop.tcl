# edit the line below to set the port which your bot listens on
listen <port number here> script phpbb2eggaccept pub 

# edit the line below to set the password which is used to connect things
set check(pass) "<password here>"

# edit the line below to set the channel you want the bot to announce into
set check(channel) "<channel here>"

proc phpbb2eggaccept {idx} {
control $idx phpbbincoming
}

proc phpbbincoming {idx args} {
	global check

	putlog "Send to Egg: incoming!"

	set args [join $args]
	set inc(chan) [lindex [split $args] 0]
	set inc(message) [join [lrange [split $args] 1 end]]

	if { $inc(message) != ""} {
		killdcc $idx
	}
	set line [split $inc(message) ";"]
	foreach line $line {
		putlog "Send to Egg: $line"

		puthelp "PRIVMSG $check(channel) :$line"

	}

}

putlog "Send to Eggdrop script loaded"
