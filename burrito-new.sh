#! /bin/bash

make-burrito () {
  git clone https://github.com/jasonreece/css-burrito.git

  for file in LICENSE.md README.md burrito.sh burrito-new.sh burrito-component.sh package.json; do
    rm -r -f css-burrito/"$file"
  done

  mv css-burrito/* .

  rm -r -f css-burrito/
}

ascii-burrito () {
  echo ''
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  //////////////////////////////////........./////////////////'
  echo '  ///////////////////////////////.....mmmmm....///////////////'
  echo '  /////////////////////////////.....mmmmmmmmmm.../////////////'
  echo '  //////////////////////////.....mmmmmmmmmmmmmmmm...//////////'
  echo '  ////////////////////////.....mmmmmmmmmmmmmmmmmmmm...////////'
  echo '  //////////////////////.....mmmmmmmmmmmmmmmmmmmmmm...////////'
  echo '  ////////////////////....mmmmmmmmmmmmmmmmmmmmmmmmm...////////'
  echo '  ///////////////////...mmmmmmmmmmmmmmmmmmmmmmmmmmm...////////'
  echo '  /////////////////....mmmmmmmmmmmmmmmmmmmmmmmmmm..../////////'
  echo '  ///////////////....mmmmmmmmmmmmmmmmmmmmmmmmmmm....//////////'
  echo '  ////////////.....mmmmmmmmmmmmmmmmmmmmmmmmmmm....////////////'
  echo '  /////////....mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm..../////////////'
  echo '  ///////....mmmmmmmmm css-burrito mmmmmmmm....///////////////'
  echo '  //////...........mmmmmmmmmmmmmmmmmmmmmmm....////////////////'
  echo '  //////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////'
  echo '  //////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////'
  echo '  ////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////'
  echo '  /////////.....mmmmmmm....mmmmmmm....////////////////////////'
  echo '  ///////////....mmmmmmm....mmmm....//////////////////////////'
  echo '  /////////////....mmmmmm...mm....////////////////////////////'
  echo '  ///////////////....mmmmm......//////////////////////////////'
  echo '  /////////////////........../////////////////////////////////'
  echo '  /////////////////////....///////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo '  ////////////////////////////////////////////////////////////'
  echo ''
}

ascii-oops () {
  echo ''
  echo '    ____     ____    _____     _____   _ '
  echo '   / __ \   / __ \  |  __ \   / ____| | |'
  echo '  | |  | | | |  | | | |__) | | (___   | |'
  echo '  | |  | | | |  | | |  ___/   \___ \  | |'
  echo '  | |__| | | |__| | | |       ____) | |_|'
  echo '   \____/   \____/  |_|      |_____/  (_)'
  echo '                                         '
}

hologram-base () {
  # Requires one argument - the path to the file.
  # hologram-base stylesheets/core/_base.scss
  echo '' >> $1
  echo '// - - - - - - - - - - - - - - - - - - -  ' >> $1
  echo '//  documentation' >> $1
  echo '// - - - - - - - - - - - - - - - - - - -  ' >> $1
  echo '' >> $1
  echo '' >> $1
  echo '/*doc ' >> $1
  echo '--- ' >> $1
  echo 'title: Headings' >> $1
  echo 'name: headings' >> $1
  echo 'category: base' >> $1
  echo '---' >> $1
  echo '```html_example ' >> $1
      echo '<h1>The quick brown fox...</h1>' >> $1
      echo '<h2>The quick brown fox...</h2>' >> $1
      echo '<h3>The quick brown fox...</h3>' >> $1
      echo '<h4>The quick brown fox...</h4>' >> $1
      echo '<h5>The quick brown fox...</h5>' >> $1
      echo '<h6>The quick brown fox...</h6>' >> $1
  echo '```' >> $1
  echo '*/' >> $1
}

check-for-hologram () {
  local OPTIND
  while getopts ":hH" opt; do
    case $opt in
      [hH])
        make-burrito
        hologram-base stylesheets/core/_base.scss
        ascii-burrito
        ;;
      \?)
        ascii-oops
        echo "Invalid option: -$OPTARG"
        echo "You can create a new project with burrito-new"
        echo "Or you can add a new project with Hologram documentation by running burrito-new -h"
        ;;
    esac
  done
}

if [ $# -eq 0 ] ; then
  make-burrito
  ascii-burrito
else
  check-for-hologram "$@"
fi