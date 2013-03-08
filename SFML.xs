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
#include <SFML/Window.hpp>
#include <vector>

#define ARG_P_BEGIN for(int arg_p_n = 1; arg_p_n <= items; arg_p_n++){

#define ARG_P_OPTION(x) if(strcmp(SvPV_nolen(ST(arg_p_n)),(x)) == 0){ arg_p_n++; if(arg_p_n > items) break;

#define ARG_P (ST(arg_p_n))

#define ARG_P_OPTION_END continue; }

#define ARG_P_END }

using namespace sf;

MODULE = SFML		PACKAGE = SFML		

INCLUDE: xsrc/Window.xs
