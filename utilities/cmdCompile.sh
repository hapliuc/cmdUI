#!/bin/sh
# cmdUI v0.0.3
# Utility: cmdCompile
# Author: C.A. Hapliuc

_version="0.0.3"
echo "#!/bin/sh" > cmdUI.sh
echo -e "# cmdUI v$_version\n" >> cmdUI.sh
for _ in $(seq "$#"); do
  tail -n+3 $1 >> cmdUI.sh
  echo -e "\n" >> cmdUI.sh
  shift
done