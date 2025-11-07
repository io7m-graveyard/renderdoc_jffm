#!/bin/sh

JEXTRACT_HOME="${HOME}/var/jextract/jextract-25"

exec ${JEXTRACT_HOME}/bin/jextract \
  -l renderdoc \
  -t com.io7m.renderdoc_jffm.core.generated \
  --output com.io7m.renderdoc_jffm.core/src/main/java/ \
  /usr/include/renderdoc_app.h

