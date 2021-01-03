sub EVENT_AGGRO {
	quest::say("For Bertoxxulous, I shall spill your guts upon the floor!");
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Retrieve the entity id for The Western Plains of Karana >> Brother_Estle (12043)
	my $npc_ent = $entity_list->GetMobByNpcTypeID(12043);
	#:: Match if distance is less than 100 units
	if ($npc_ent->CalculateDistance($x, $y, $z) < 100) {
		#:: Get him.
		$npc->Attack($npc_ent);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
