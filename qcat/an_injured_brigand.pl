sub EVENT_SPAWN {
	#:: Set hitpoints to half of 96
	$npc->SetHP(48);
	#:: Set next HP event at 51 percent
	quest::setnexthpevent(51);
}

sub EVENT_HP {
	#:: Set hitpoints to half of 96
	$npc->SetHP(48);
	#:: Set next HP event at 51 percent
	quest::setnexthpevent(51);
}
