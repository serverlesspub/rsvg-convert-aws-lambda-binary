# RSVG-Convert Lambda Layer for Amazon Linux 2 AMIs

Static build of rsvg-convert (LibRSVG) for Amazon Linux 2, packaged as a Lambda layer. 
Bundles librsvg 2.26.3.

This application provides a single output, `LayerVersion`, which points to a
Lambda Layer ARN you can use with Lambda runtimes based on Amazon Linux 2 (such
as the `nodejs10.x` runtime).

The layer contains the system utility `/opt/bin/rsvg-convert`, which you can invoke directly
as a subprocess or from a shell.

For an example of how to use the layer, check out 
<https://github.com/serverlesspub/rsvg-convert-aws-lambda-binary/tree/master/example>.
