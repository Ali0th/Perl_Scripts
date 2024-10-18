open (IN, '3DFR.pdb');
open (OUT, '>3DFR.fasta');
%tto = ('CYS', 'C', 'ASP', 'D', 'SER', 'S', 'GLN', 'Q', 'LYS', 'K',
     'ILE', 'I', 'PRO', 'P', 'THR', 'T', 'PHE', 'F', 'ASN', 'N',
     'GLY', 'G', 'HIS', 'H', 'LEU', 'L', 'ARG', 'R', 'TRP', 'W',
     'ALA', 'A', 'VAL','V', 'GLU', 'E', 'TYR', 'Y', 'MET', 'M');

while (<IN>){
  if (/^HEADER\s+\w+\s+\d+-\w+-\d+\s+(.+)/){
    print OUT ">$1\n"
  }

  if (/^SEQRES\s+\d+\s+\w+\s+\d+\s+(.+)/){ #xreiazetai to $_???
    $seq.=$1;
  }
  if (/^ATOM\s+\d+\s+(\w+)\s+\w+\s+\w+\s+\d+\s+(\S+)\s+(\S+)\s+(\S+)/){
    push (@d, $1);
    push (@a, $2);
    push (@b, $3);
    push (@c, $4);
  }
}

$seq=~s/ //g;
$seq=~s/\n//g;
$l=(length $seq);

for ($i=0;$i<=$l;$i+=3){
  $p=substr($seq, $i, 3);
  $pro.=$tto{$p};
}
for ($i=0; $i<=length $pro; $i+=60){
  $p=substr($pro, $i, 60);
  $fin.="$p\n";
}
print OUT $fin;


for ($i=0; $i<=$#a+1; $i++){
  $x+=$a[$i];
  $y+=$b[$i];
  $z+=$c[$i];
}
$xg=$x/($#a+1);
$yg=$y/($#a+1);
$zg=$z/($#a+1);
print "Geometric Center\nx:$xg\ny:$yg\nz:$zg\n", "\nAtoma pou apexoun >10 Angstrom apo to GeoCen:\n";

for ($i=0; $i<=$#a+1; $i++){
  $d=sqrt(($xg-$a[$i])**2+($yg-$b[$i])**2+($zg-$c[$i])**2);
  if ($d>10){
    print "$d ", $d[$i], " ", $i+=1, "\n";
  }
}
