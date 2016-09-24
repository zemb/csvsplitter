#!/usr/bin/perl

sub print_debug($) {
    # turn on or of
    if(0) { print @_};
}

while(<>) {
    if( $. == 1 ) {     # first line
        $file_out_base = $ARGV;
        $file_out_base =~ s/\.csv$//;
        print "Processing $file_out_base...\n";
        $file_out_base .= "-part";
        $out_lines = 0;                         # per file
        $part_nr = 1;
        $header = $_;
        $file_out = $file_out_base . ($part_nr) . ".csv";
        open(OUTFILE, ">", $file_out );
        print_debug("Opening file $file_out... ");
    }
    if($out_lines == 10000 ) {
        $file_out = $file_out_base . (++$part_nr) . ".csv";
        print_debug("Closing: 10000 lines written, closing $file_out\n");
        close(OUTFILE);
        open(OUTFILE, ">", $file_out );
        print_debug("Opening file $file_out\n");
        print OUTFILE $header;
        $out_lines = 1;
    }
    print OUTFILE;
    $out_lines++;
} continue {
    if(eof) {
        print_debug("File $ARGV procesed, closing $file_out with $out_lines\n");
        close ARGV;
        close OUTFILE;
    }
}
