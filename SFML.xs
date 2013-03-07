// Perl Headers
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#ifdef __cplusplus
}
#endif

//Remove name clash:
#undef do_open
#undef do_close

#include <SFML/System.hpp>

MODULE = SFML		PACKAGE = SFML		

