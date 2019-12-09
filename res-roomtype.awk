BEGIN{
    FIELDWIDTHS=widths;
}

NR>4{
    for( i=1; i<=NF; i++)
    {
        gsub(/^ +| +$/,"",$i);
    }

    print source"|"$1"|"$2"|"$3"|"$4"|"$5"|"$6"|"$7"|"$8"|"$9"|"$10"|"$11"|"$12;
}

