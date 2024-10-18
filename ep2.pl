open (IN, "<P21918.fasta");
$name=<IN>;
while ($_=<IN>){
  $seq.=$_;
  chomp $seq;
}

for ($i=0; $i<=length $seq; $i++){
  $pat=substr($seq,$i,6);
  if ($pat=~m/^(VG\w{1,2}A)/){
    print "vrethike $1 sti thesi ", $i+1, "\n";
  }
}

###############################

open (IN2, 'P21918.txt');
open (OUT2, '>ep2.fasta');

while ($_=<IN2>){
  if ($_=~m/^AC\s+(\w+)/){
    print OUT2 ">$1\n";
  }
  if ($_=~m/^\s+(.+)/){
    $_=~s/\s//g;
    $seq1.=$_;
    print OUT2 "$_\n";
  }
}

#######
open (IN2, 'P21918.txt');
while (<IN2>){
  if ($_=~m/^FT\s+TRANSMEM\s+(\d+)\D+(\d+)/){
    push (@a, $1);
    push (@b, $2);
  }
}

$c=$#a;
for ($i=0; $i<=$c; $i++){
  $a=substr($seq1, $a[$i]-1, $b[$i]-$a[$i]+1);
  print "TM", $i+1, ": $a\n";

}
