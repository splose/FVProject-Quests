my $entid1;
my $entid2;
my $mob1;
my $mob2;
my $mobnpc1;
my $mobnpc2;

sub EVENT_DEATH {
	#:: Spawn a The Plane of Sky >> an_essence_carrier (71070)
	$entid1 = quest::spawn2(71070, 0, 0, $x + 10, $y, $z, $h);
	$mob1 = $entity_list->GetMobID($entid1);
	$mobnpc1 = $mob1->CastToNPC();
	$mobnpc1->AddToHateList($npc->GetHateTop());
	#:: Spawn a The Plane of Sky >> an_essence_carrier (71070)
	$entid2 = quest::spawn2(71070, 0, 0, $x - 10, $y, $z, $h);
	$mob2 = $entity_list->GetMobID($entid2);
	$mobnpc2 = $mob2->CastToNPC();
	$mobnpc2->AddToHateList($npc->GetHateTop());
}
