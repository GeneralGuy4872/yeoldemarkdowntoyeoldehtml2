#!/bin/sh
awk -E markdowntohtml2.awk $1 | awk -E markdowntohtml2lists.awk > $2
