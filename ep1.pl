open (IN,'U49845.fasta');
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

$name=<IN>;
while ($_=<IN>) {
  $seq.=$_;
}
$seq=~s/\n//g;
$l= length $seq;

for ($k=0; $k<=2; $k++){
  print "ksekinontas to diavasma apo to ", $k+1, "o noukleotidio:\n";
  $c=0;
  for ($i=$k; $i<=$l-3; $i+=3){
        $trp=substr($seq,$i,3);
    if ($trp eq "ATG"){
      $c++;
      print "metafrazontas apo to ", $c, "o kodikonio enarxis:\n";
      for ($r=$i; $r<=$l; $r+=3){
        $trp=substr($seq,$r,3);
        if ($trp eq "STOP"){
          last;
        }
        else{
        print "$aacode{$trp}";
      }
        }
        print "\n";

      }
    }
  }
