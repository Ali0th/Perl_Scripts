#Το προγραμμα που έγραψε η Λίτου.

open (MD, 'sequence.fasta');
%aacode = (
  TTT => "F", TTC => "F", TTA => "L", TTG => "L",
  TCT => "S", TCC => "S", TCA => "S", TCG => "S",
  TAT => "Y", TAC => "Y", TAA => "STOP", TAG => "STOP",
  TGT => "C", TGC => "C", TGA => "STOP", TGG => "W",
  CTT => "L", CTC => "L", CTA => "L", CTG => "L",
  CCT => "P", CCC => "P", CCA => "P", CCG => "P",
  CAT => "H", CAC => "H", CAA => "Q", CAG => "Q",
  CGT => "R", CGC => "R", CGA => "R", CGG => "R",
  ATT => "I", ATC => "I", ATA => "I", ATG => "M",
  ACT => "T", ACC => "T", ACA => "T", ACG => "T",
  AAT => "N", AAC => "N", AAA => "K", AAG => "K",
  AGT => "S", AGC => "S", AGA => "R", AGG => "R",
  GTT => "V", GTC => "V", GTA => "V", GTG => "V",
  GCT => "A", GCC => "A", GCA => "A", GCG => "A",
  GAT => "D", GAC => "D", GAA => "E", GAG => "E",
  GGT => "G", GGC => "G", GGA => "G", GGG => "G",
);
open (IN,'<sequence.fasta');
$name=<IN>;

while (<IN>)
{
$seq.=$_;
chomp $seq;
}
$l=length $seq;

for ($k=0;$k<=2;$k++)
{
print "metafrasi apo tin vasi", $k+1, ":";

	for ($i=$k;$i<=$l;$i+=3)
	{
	$codon=substr($seq,$i,3);
		if ($codon eq 'ATG')
		{
		print "\nDiavazo apo ti vasi $i:";
			for ($j=$i;$j<=$l;$j+=3)
			{
			$aa=substr($seq,$j,3);
			$p=$aacode{$aa};
      if ($p eq STOP){
        last;
      }
      else {
        print $p
      }
			}
		}

	}
print "\n";

}
