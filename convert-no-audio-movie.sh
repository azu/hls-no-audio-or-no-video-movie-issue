#!/usr/bin/env bash

command -v ffmpeg >/dev/null 2>&1 || { echo "Require ffmpeg. Aborting." >&2; exit 1; }

function usage {
    cat <<EOF
$(basename ${0}) is a tool for converting no-audio-track movie

Usage:
    $(basename ${0}) path-to-movie.ts

EOF
}

function convertMovie {
    # https://unix.stackexchange.com/questions/6402/how-to-remove-an-audio-track-from-an-mp4-video-file
    # https://ffmpeg.org/ffmpeg.html#Advanced-options
    cp ${1} ${1}.bak
    # convert
    ffmpeg -i ${1} -an -c copy "_tmp.ts"
    # overwrite
    mv "_tmp.ts" ${1}
}

while [ $# -gt 0 ];
do
    case ${1} in

        --debug|-d)
            set -x
        ;;


        help|--help|-h)
            usage
        ;;

        *)
            echo "Process '${1}'"
            convertMovie "${1}"
        ;;
    esac
    shift
done

