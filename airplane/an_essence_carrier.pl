my $entid1;
my $entid2;
my $mob1;
my $mob2;
my $mobnpc1;
my $mobnpc2;

sub EVENT_DEATH {
	#:: Spawn a The Plane of Sky >> an_essence_tamer (71071)
	$entid1 = quest::spawn2(71071, 0, 0, $x+10, $y, $z, $h);
	$entid2 = quest::spawn2(71071, 0, 0, $x-10, $y, $z, $h);
	$mob1 = $entity_list->GetMobID($entid1);
	$mob2 = $entity_list->GetMobID($entid2);
	$mobnpc1 = $mob1->CastToNPC();
	$mobnpc2 = $mob2->CastToNPC();
	$mobnpc1->AddToHateList($npc->GetHateTop());
	$mobnpc2->AddToHateList($npc->GetHateTop());
}
