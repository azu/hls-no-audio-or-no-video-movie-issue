# hls-no-audio-or-no-video-movie-issue

It reproduce scripts/resources for [No audio tracks detected when there actually are audio tracks, dies when audio track actually starts · Issue #624 · video-dev/hls.js](https://github.com/video-dev/hls.js/issues/624#issuecomment-294709070 "No audio tracks detected when there actually are audio tracks, dies when audio track actually starts · Issue #624 · video-dev/hls.js").

## Original movie

See [movie/](./movie)

```
├── movie
│   ├── output.m3u8
│   ├── output_0000.ts
│   ├── output_0001.ts
│   └── output_0002.ts
```

Copy of

- [Big Buck Bunny » Download](https://peach.blender.org/download/ "Big Buck Bunny » Download")

It has audio-track and video-track

```
$ ffprobe output_0000.ts
ffprobe version 3.3 Copyright (c) 2007-2017 the FFmpeg developers
  built with Apple LLVM version 7.0.2 (clang-700.1.81)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/3.3 --enable-shared --enable-pthreads --enable-gpl --enable-version3 --enable-hardcoded-tables --enable-avresample --cc=clang --host-cflags= --host-ldflags= --enable-libfdk-aac --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-opencl --disable-lzma --enable-nonfree --enable-vda
  libavutil      55. 58.100 / 55. 58.100
  libavcodec     57. 89.100 / 57. 89.100
  libavformat    57. 71.100 / 57. 71.100
  libavdevice    57.  6.100 / 57.  6.100
  libavfilter     6. 82.100 /  6. 82.100
  libavresample   3.  5.  0 /  3.  5.  0
  libswscale      4.  6.100 /  4.  6.100
  libswresample   2.  7.100 /  2.  7.100
  libpostproc    54.  5.100 / 54.  5.100
Input #0, mpegts, from 'output_0000.ts':
  Duration: 00:00:10.42, start: 1.483333, bitrate: 478 kb/s
  Program 1
    Metadata:
      service_name    : Service01
      service_provider: FFmpeg
    Stream #0:0[0x100]: Video: h264 (High) ([27][0][0][0] / 0x001B), yuv420p(progressive), 560x320, 24 fps, 24 tbr, 90k tbn, 48 tbc
    Stream #0:1[0x101]: Audio: aac (LC) ([15][0][0][0] / 0x000F), 22050 Hz, stereo, fltp, 118 kb/s
```

This `ts` file has video(`Video: h264 (High)`) and Audio(`Audio: aac (LC)`).


## No Audio movie

See [no-audio-movie/](./no-audio-movie)


```
├── no-audio-movie
│   ├── output.m3u8
│   ├── output_0000.ts # No audio-track but has video-track
│   ├── output_0001.ts # has audio and video
│   └── output_0002.ts # has audio and video
```

`no-audio-movie/output_0000.ts` has not audio-track.

```
$ ffprobe no-audio-movie/output_0000.ts
ffprobe version 3.3 Copyright (c) 2007-2017 the FFmpeg developers
  built with Apple LLVM version 7.0.2 (clang-700.1.81)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/3.3 --enable-shared --enable-pthreads --enable-gpl --enable-version3 --enable-hardcoded-tables --enable-avresample --cc=clang --host-cflags= --host-ldflags= --enable-libfdk-aac --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-opencl --disable-lzma --enable-nonfree --enable-vda
  libavutil      55. 58.100 / 55. 58.100
  libavcodec     57. 89.100 / 57. 89.100
  libavformat    57. 71.100 / 57. 71.100
  libavdevice    57.  6.100 / 57.  6.100
  libavfilter     6. 82.100 /  6. 82.100
  libavresample   3.  5.  0 /  3.  5.  0
  libswscale      4.  6.100 /  4.  6.100
  libswresample   2.  7.100 /  2.  7.100
  libpostproc    54.  5.100 / 54.  5.100
Input #0, mpegts, from 'no-audio-movie/output_0000.ts':
  Duration: 00:00:10.42, start: 1.483333, bitrate: 346 kb/s
  Program 1
    Metadata:
      service_name    : Service01
      service_provider: FFmpeg
    Stream #0:0[0x100]: Video: h264 (High) ([27][0][0][0] / 0x001B), yuv420p(progressive), 560x320, 24 fps, 24 tbr, 90k tbn, 48 tbc
```


## No video movie

See [no-video-movie/](./no-video-movie)


```
├── no-video-movie
│   ├── output.m3u8
│   ├── output_0000.ts # No video-track but has audio-track
│   ├── output_0001.ts # has audio and video
│   └── output_0002.ts # has audio and video
```

`no-video-movie/output_0000.ts` has not video-track.

```
$ ffprobe no-video-movie/output_0000.ts
ffprobe version 3.3 Copyright (c) 2007-2017 the FFmpeg developers
  built with Apple LLVM version 7.0.2 (clang-700.1.81)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/3.3 --enable-shared --enable-pthreads --enable-gpl --enable-version3 --enable-hardcoded-tables --enable-avresample --cc=clang --host-cflags= --host-ldflags= --enable-libfdk-aac --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-opencl --disable-lzma --enable-nonfree --enable-vda
  libavutil      55. 58.100 / 55. 58.100
  libavcodec     57. 89.100 / 57. 89.100
  libavformat    57. 71.100 / 57. 71.100
  libavdevice    57.  6.100 / 57.  6.100
  libavfilter     6. 82.100 /  6. 82.100
  libavresample   3.  5.  0 /  3.  5.  0
  libswscale      4.  6.100 /  4.  6.100
  libswresample   2.  7.100 /  2.  7.100
  libpostproc    54.  5.100 / 54.  5.100
Input #0, mpegts, from 'no-video-movie/output_0000.ts':
  Duration: 00:00:10.36, start: 1.400000, bitrate: 133 kb/s
  Program 1
    Metadata:
      service_name    : Service01
      service_provider: FFmpeg
    Stream #0:0[0x100]: Audio: aac (LC) ([15][0][0][0] / 0x000F), 22050 Hz, stereo, fltp, 113 kb/s
```