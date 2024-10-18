open (MD, 'sequence.fasta');
open (OT, '>test.txt');
$a=<MD>;
while ($a=<MD>)
{
  $dna.=$a;
  chomp $dna;
}

for ($i=2; $i<=length $dna; $i+=3)
{
  $tr=substr($dna,$i,3);
  print OT "$tr\n";
}
