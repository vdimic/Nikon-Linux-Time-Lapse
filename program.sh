# interrupt in any any command fails
    set -e

    # verbose execution
    set -x

    # gphoto2 binary executable
    GPHOTO=gphoto2

    # delta time between snapshots in seconds
    DELTA=3

    $GPHOTO --auto-detect
    
    FNAME=img
    FEXT=.jpg
    COUNT=1000

    while [ 1 ] ; do
        X1=`date +%s`
        X2=$(($DELTA+$X1))
        
        $GPHOTO --capture-image-and-download --filename  $FNAME$COUNT$FEXT

	COUNT=$(($COUNT+1))

        X1=`date +%s`
        T=$(($X2-$X1))
        if [ $T -gt 0 ] ; then
            sleep $T
        else
            echo "WARNING: DELTA is too small"
        fi
    done