# Static rsvg-convert binary for AWS Lambda

A statically linked `rsvg-convert` binary utility from the [`librsvg`](http://live.gnome.org/LibRsvg) Linux package, allowing you to render SVG images to PDF and PNG on AWS Lambda using [Cairo](https://cairographics.org).

## Why?

The standard AWS Lambda Linux VM comes with imagemagick, but compiled without SVG support. In order to process SVG images, you either need to add SVG support to ImageMagick or use a custom tool. RSVG+Cairo is the best back-end for SVG processing in imagemagick anyway, so this binary gives you direct access to that toolkit.

## Download the binary

Grab the binary from the [vendor](/vendor) directory

```
Usage:
  rsvg-convert [OPTION…] [FILE...] - SVG Converter

Help Options:
  -?, --help                                                  Show help options

Application Options:
  -d, --dpi-x=<float>                                         pixels per inch [optional; defaults to 90dpi]
  -p, --dpi-y=<float>                                         pixels per inch [optional; defaults to 90dpi]
  -x, --x-zoom=<float>                                        x zoom factor [optional; defaults to 1.0]
  -y, --y-zoom=<float>                                        y zoom factor [optional; defaults to 1.0]
  -z, --zoom=<float>                                          zoom factor [optional; defaults to 1.0]
  -w, --width=<int>                                           width [optional; defaults to the SVG's width]
  -h, --height=<int>                                          height [optional; defaults to the SVG's height]
  -f, --format=[png, pdf, ps, svg]                            save format [optional; defaults to 'png']
  -o, --output                                                output filename [optional; defaults to stdout]
  -a, --keep-aspect-ratio                                     whether to preserve the aspect ratio [optional; defaults to FALSE]
  -b, --background-color=[black, white, #abccee, #aaa...]     set the background color [optional; defaults to None]
  -v, --version                                               show version information
  --base-uri                                                  base uri
```

## Usage from Node.js

Check out the [SVG to PDF Example Project](https://github.com/claudiajs/example-projects/tree/master/svg-to-pdf-s3-converter).

## Versions
Compiled with AMI ami-60b6c60a, 29 October 2016, with the following library versions:

* `cairo`: 1.12.14
* `pango`: 1.28.4
* `libcroco`: 0.6.8
* `gdk-pixbuf`: 2.28.2
* `librsvg`: 2.26.3

These are all a bit old, but are compatible with the other libraries available through YUM for the Amazon Linux instance. To get a more recent version built, modify `compile-static.sh` to include the appropriate versions of dependencies.

## Creating a fresh compilation

1. Create an AMI
2. ssh to the AMI as `ec2-user`
3. on the VM, run `system_init.sh`
4. on the VM, run `compile-static.sh`

## Testing on a (non-Lambda) AWS Linux VM

The binary will work on a plain-vanilla AWS Linux VM, but needs some additional packages (these are already available on the VM used for Lambda functions).

```
sudo yum install cairo libtiff -y
```

### Copyright and license

GNU GENERAL PUBLIC LICENSE.  Copyright (C) 1989, 1991 Free Software Foundation, Inc. 
[Original LibRSVG license](https://git.gnome.org/browse/librsvg/tree/COPYING).

