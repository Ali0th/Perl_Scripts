open (IN, '3DFR.pdb');

while (<IN>){
  if ($_=~m/^HEADER\s+\S+\s+\S+\s+(\w+)/){
    print ">$1\n";
  }
  if ($_=~m/^SEQRES\s+\d+\s+\w+\s+\d+\s+(.+)/){
    $seq.=$1;
  }
  if ($_=~m/^ATOM\s+(\d+\s+\w+)\s+\w+\s+\w+\s+\d+\s+(\S+)\s+(\S+)\s+(\S+)/){
    push (@a, $1);
    push (@b, $2);
    push (@c, $3);
    push (@d, $4);
  }
  #ATOM      1  N   THR A   1      -0.313  18.726  33.523  1.00 21.00           N

}
$seq=~s/\s//g;
%tto = ('CYS', 'C', 'ASP', 'D', 'SER', 'S', 'GLN', 'Q', 'LYS', 'K',
     'ILE', 'I', 'PRO', 'P', 'THR', 'T', 'PHE', 'F', 'ASN', 'N',
     'GLY', 'G', 'HIS', 'H', 'LEU', 'L', 'ARG', 'R', 'TRP', 'W',
     'ALA', 'A', 'VAL','V', 'GLU', 'E', 'TYR', 'Y', 'MET', 'M');

for ($i=0; $i<=length $seq; $i+=3){
  $a=substr($seq, $i, 3);
  $aa.=$tto{$a};
}

for ($j=0; $j<=length $aa; $j+=60){
  $a=substr($aa, $j, 60);
  print "$a\n";
}

$c=$#a;
for ($k=0; $k<=$c; $k++){
  $x1+=$b[$k];
  $y1+=$c[$k];
  $z1+=$d[$k];
}
$xg=$x1/$c;
$yg=$y1/$c;
$zg=$z1/$c;

print "Geo Cent:\nx:$xg y:$yg z:$zg\nAtoma poy apexoun >10A:";

for ($l=0; $l<=$c; $l++){
  $d=sqrt(($xg-$b[$l])**2+($yg-$c[$l])**2+($zg-$d[$l])**2);
  if ($d>10){
    print "\n$d, ", $a[$l];
  }
}
