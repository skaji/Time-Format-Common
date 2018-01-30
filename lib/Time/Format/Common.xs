#ifdef __cplusplus
extern "C" {
#endif

#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#include <time.h>
#include <stdio.h>

#ifdef __cplusplus
} /* extern "C" */
#endif

#define NEED_newSVpvn_flags
#include "ppport.h"

MODULE = Time::Format::Common  PACKAGE = Time::Format::Common

PROTOTYPES: DISABLE

void
iso8601(...)
PPCODE:
{
  time_t t = 0;
  if (items > 0) {
    if (SvIOK(ST(0))) {
      t = (time_t)SvIV(ST(0));
    } else {
      croak("Usage: iso8601() or iso8601(IV)");
    }
  } else {
    t = time(NULL);
  }
  static char buf[sizeof("2000-01-01T00:00:00+00:00")];
  static struct tm r;

  localtime_r(&t, &r);
  if (r.tm_gmtoff == 0) {
    snprintf(buf, sizeof(buf), "%04d-%02d-%02dT%02d:%02d:%02dZ",
      r.tm_year+1900,
      r.tm_mon+1,
      r.tm_mday,
      r.tm_hour,
      r.tm_min,
      r.tm_sec
    );
  } else if (r.tm_gmtoff > 0) {
    snprintf(buf, sizeof(buf), "%04d-%02d-%02dT%02d:%02d:%02d+%02ld:%02ld",
      r.tm_year+1900,
      r.tm_mon+1,
      r.tm_mday,
      r.tm_hour,
      r.tm_min,
      r.tm_sec,
      r.tm_gmtoff/3600,
      r.tm_gmtoff/60%60
    );
  } else {
    snprintf(buf, sizeof(buf), "%04d-%02d-%02dT%02d:%02d:%02d-%02ld:%02ld",
      r.tm_year+1900,
      r.tm_mon+1,
      r.tm_mday,
      r.tm_hour,
      r.tm_min,
      r.tm_sec,
      -r.tm_gmtoff/3600,
      -r.tm_gmtoff/60%60
    );
  }
  XPUSHs(newSVpvn_flags(buf, sizeof(buf), SVs_TEMP));
  XSRETURN(1);
}
