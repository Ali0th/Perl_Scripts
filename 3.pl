#open (IN,'Q13948.txt');
open (IN1,'<Q13948.fasta.txt'); #το < δεν ειναι υποχρεωτικό για αρχεία εισόδου
open (OUT1,'>out.txt'); #το > ειναι υποχρεωτικό για αρχεία εξόδου
# >> προσθέτει σε ήδη υπάρχον αρχείο χωρίς να κανει overwrite
$name=<IN>;
#ωστε να μπει εκει η πρωτη γραμμη και να μας αφησει ησυχους
while ($b=<IN>)
{
$seq=$seq.$b;
chomp $seq;
#ή seq.=$a;
#$b=$_;
}
print OUT1 length $seq;
#δημιουργεί ένα αρχείο και τα τυπώνει εκεί!
close IN1;
close OUT1;
