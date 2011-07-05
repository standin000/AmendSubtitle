# usage: perl amendsubtitle.pl in.srt > out.srt

use Time::Local;
my $flag = 1;
while (<>) {
       # Plato Wu,2009/06/29: set subtitle's offset(negative offset) to it before run.
       my $offset = -76;#3626; #2845;
       if($flag){      
       # Plato Wu,2009/06/29: it is time line
        print $_;
        chomp($_);
        if($_ =~ m/^[0-9]+$/){
          $flag = 0;
        }
        
      }else{
        my @array = split/[\, ]/, $_;
#        print "$array[0];$array[1];$array[2];$array[3];$array[4]";        
        my ($hours, $min, $sec) = split/:/, $array[0];  

        my $time = timelocal($sec, $min, $hours,16,2,2008);
        $time -= $offset;
        ($sec, $min, $hour) = localtime $time;
        print "$hour:$min:$sec,$array[1] $array[2] ";
        #print "$array[3]\n";
        ($hours,$min,$sec) = split /:/, $array[3];
        #print "$hours;:$min:rint "aa $sec\n";
        $time = timelocal($sec, $min, $hours,16,2,2008);        
        $time -= $offset;
        ($sec, $min, $hours) = localtime $time;
        print "$hours:$min:$sec,$array[4]";      
        $flag = 1;
      }
}
