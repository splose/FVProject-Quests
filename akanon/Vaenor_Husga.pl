sub EVENT_SPAWN {
	#:: Set up a 50 unit distance
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
	#:: Check for 18702 - Old Folded Letter
	if (plugin::check_hasitem($client, 18702)) { 
		$client->Message(15,"An evil cackle echoes throughout the mines as you get your bearings. Vaenor Husga turns his gaze upon you. 'Why do you stand about young apprentice?! There is much to learn. Read the note in your inventory and then hand it to me so that we can begin your training! The Dark Reflection will have its revenge!'");
	}
}

sub EVENT_SAY {
	if ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [" . quest::saylink("second book") . "], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	if($text=~/second book/i){ 
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match a 18702 - Old Folded Letter
	if (plugin::check_handin(\%itemcount, 18702 => 1)) {
		quest::say("A new initiate I see. Take this robe you will surely need it in the winter months. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [" . quest::saylink("trades") . "] you will have available to you.");
		#:: Give a 13524 - Dark Gold Felt Robe*
		quest::summonitem(13524);
		#:: Set factions
		quest::faction(76,-10); 	# Deep Muses
		quest::faction(91,-10); 	# Eldritch Collective
		quest::faction(71,100); 	# Dark Reflection
		quest::faction(115,-10); 	# Gem Choppers
		quest::ding();
		quest::exp(100);
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
# converted to Perl by SS
