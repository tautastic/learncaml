#!/bin/sh
# Reset all solution.ml files: keep comments and the first signature, replace body with failwith

find . -name "solution.ml" -type f -exec perl -0777 -pi -e '
    s/(let\s+\w+\s+[^=]*=).*/$1\n  failwith "not implemented"\n\n/s
' {} \;
