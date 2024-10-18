open (IN1, '<sp.txt');

while ($_=<IN1>){
if ($_=~m/^FT\s+\DOMAIN+\s+(\d+)\s+(\d+)\s+\OmpA-like/){
$a=$1;
$b=$2;
}
if ($_=~m/^\s+/){
$seq.=$_;
chomp $seq;
}
}

$seq=~s/ //g;
$l=$b-$a+1;

$pr=substr($seq, $a-1, $l);
print "OmpA-like domain: $pr";



#!/usr/bin/perl
$s="ABCDEFGHKLMNOPQRSTUVWXYZ";
$b=substr($s,3,2);
print "$b\n";
for ($i=0;$i<=length($s);$i++) {
if (substr($s,$i,4)=~/D[EF]FG/)
{

print "The position of D[EF]FG is:",$i+1,"\n";}
}
