sub _GeoGebraURL_init {};

# https://help.geogebra.org/topic/adding-get-or-post-variables-to-a-url

sub url_encode_string {

    my $string = shift;

    # reference for url encoding
    # https://en.wikipedia.org/wiki/Percent-encoding#:~:text=From%20Wikipedia%2C%20the%20free%20encyclopedia,characters%20legal%20within%20a%20URI.


    # begin: percent encode reserved characters

#    $string =~ s/[\%]/%25/g; # needs to be first so that it doesn't overwrite other % symbols?
#    $string =~ s/[\!]/%21/g;
#    $string =~ s/[\#]/%23/g;
#    $string =~ s/[\$]/%24/g;
#    $string =~ s/[\&]/%26/g;
#    $string =~ s/[\']/%27/g;
#    $string =~ s/[\(]/%28/g;
#    $string =~ s/[\)]/%29/g;
#    $string =~ s/[\*]/%2A/g;
    $string =~ s/[\+]/%2B/g; # necessary
#    $string =~ s/[\,]/%2C/g;
#    $string =~ s/[\/]/%2F/g;
#    $string =~ s/[\:]/%3A/g;
#    $string =~ s/[\;]/%3B/g;
#    $string =~ s/[\=]/%3D/g;
#    $string =~ s/[\?]/%3F/g;
#    $string =~ s/[\@]/%40/g;
#    $string =~ s/[\[]/%5B/g;
#    $string =~ s/[\]]/%5D/g;

    # end: percent encode reserved characters


    # begin: other characters mentioned on the wikipedia page

#    $string =~ s/[\"]/%22/g;
#    $string =~ s/[\%]/%25/g;
#    $string =~ s/[\-]/%2D/g;
#    $string =~ s/[\.]/%2E/g;
#    $string =~ s/[\<]/%3C/g;
#    $string =~ s/[\>]/%3E/g;
#    $string =~ s/[\\]/%5C/g;
#    $string =~ s/[\^]/%5E/g;
#    $string =~ s/[\_]/%5F/g;
#    $string =~ s/[\`]/%60/g;
#    $string =~ s/[\{]/%7B/g;
#    $string =~ s/[\|]/%7C/g;
#    $string =~ s/[\}]/%7D/g;
#    $string =~ s/[\~]/%7E/g;

    # end: other characters mentioned on the wikipedia page

    $string =~ tr/ //ds; # remove spaces

    return $string;
}

#sub ggb_to_url {
#
#    my $string = shift;
#
#    $string = url_encode_ggb($string);
#    return "https://www.geogebra.org/classic?command=" . $string;
#
#}


sub ggbClassicLink {

    my $ggb_commands = shift;
    my $link_text = shift;

    my $ggb_commands_encoded = url_encode_string( $ggb_commands );
    my $url = "https://www.geogebra.org/classic?command=" . $ggb_commands_encoded;

    return htmlLink($url, $link_text, "target='_blank'" );
}

1;
