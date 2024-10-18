#######programma 1###############

% con= (
'ALA' => 'A',
'ARG' => 'R',
'ASN' => 'N',
'ASP' => 'D',
'CYS' => 'C',
'GLU' => 'E',
'GLN' => 'Q',
'GLY' => 'G',
'HIS' => 'H',
'ILE' => 'I',
'LEU' => 'L',
'LYS' => 'K',
'MET' => 'M',
'PHE' => 'F',
'PRO' => 'P',
'SER' => 'S',
'THR' => 'T',
'TRP' => 'W',
'TYR' => 'Y',
'VAL' => 'V');

open (in, '<3dfr.pdb');
open (out,'>pdb.out.fasta');

while (<in>)
{
	if ($_=~/^HEADER\s+\S+\s+\S+\s+(\S+)/)
	{
	print out	"$1\n";
	}
if ($_=~/^SEQRES\s+\d+\s+\S+\s+\d+\s+(.+)/)
{  $seq.=$1;
}

}

$seq=~s/ //g;



for ($i=0;$i<=length$seq;$i+=3)
{
$s=substr( $seq,$i,3);

	$new=$con{$s};

	print out	$new;

}
