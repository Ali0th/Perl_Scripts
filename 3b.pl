$dna='ATTGCGCATATCAGC';
for ($i=0;$i<=length $dna;$i+=3)
{

  $d=substr($dna,$i,3);
  print "$d\n";
}
