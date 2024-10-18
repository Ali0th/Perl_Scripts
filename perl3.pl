open (MD, 'U49845.fasta');
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

$b=<MD>;
while ($a=<MD>)
#αυτή δεν έβαλε καθόλου το $a και απο κατω στη θεση του εβαλε $_
{
  $dna.=$a;
  chomp $dna;
}

$l=length $dna;

#μετάφραση της αλληλουχίας από το πρώτο κωδικόνιο
print "allhloyxia $b\n\n", "metafrash apo thn enarxi ths allhloyxias:\n";
for ($j=0; $j<$l; $j+=3){
  $trp=substr($dna, $j, 3);
  print $aacode{$trp};
}
#προαιρετικά βήματα
$base=0;

for (my $i=0; $i<=2; $i++){
  $base++;
  print "\n\n\n Metafrasi apo $base", "h vasi\n";
  $startcod=0;
  for (my $j=$i; $j<$l; $j+=3){
    $trp=substr($dna, $j, 3);
    if ($trp eq 'ATG'){
      $startcod++;
      print "\n$startcod", "o kod enarxis\n";
      for (my $x=$j; $x<$l; $x+=3){
        $trpl=substr($dna, $x, 3);
        print $aacode{$trpl};
      }
     }
  }
 }
