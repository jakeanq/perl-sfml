MODULE = SFML		PACKAGE = SFML::Window::Context

Context*
Context::new()

void
Context::DESTROY()

bool
Context::setActive(active)
	bool active

MODULE = SFML		PACKAGE = SFML::Window::ContextSettings

ContextSettings*
ContextSettings::new(hv_settings)
	HV *hv_settings
	CODE:
		RETVAL = new ContextSettings();
		if(hv_settings != NULL){
			SV* *key = hv_fetchs(hv_settings, "depthBits",0);
			if(key != NULL){
				RETVAL->depthBits = SvIV(*key);
			}
			key = hv_fetchs(hv_settings, "stencilBits",0);
			if(key != NULL){
				RETVAL->stencilBits = SvIV(*key);
			}
			key = hv_fetchs(hv_settings, "antialiasingLevel",0);
			if(key != NULL){
				RETVAL->antialiasingLevel = SvIV(*key);
			}
			key = hv_fetchs(hv_settings, "majorVersion",0);
			if(key != NULL){
				RETVAL->majorVersion = SvIV(*key);
			}
			key = hv_fetchs(hv_settings, "minorVersion",0);
			if(key != NULL){
				RETVAL->minorVersion = SvIV(*key);
			}
		}
	OUTPUT:
		RETVAL

void
ContextSettings::DESTROY()

int
ContextSettings::getDepthBits()
	CODE:
		RETVAL = THIS->depthBits;
	OUTPUT:
		RETVAL

int
ContextSettings::getStencilBits()
	CODE:
		RETVAL = THIS->stencilBits;
	OUTPUT:
		RETVAL

int
ContextSettings::getAntialiasingLevel()
	CODE:
		RETVAL = THIS->antialiasingLevel;
	OUTPUT:
		RETVAL

int
ContextSettings::getMajorVersion()
	CODE:
		RETVAL = THIS->majorVersion;
	OUTPUT:
		RETVAL

int
ContextSettings::getMinorVersion()
	CODE:
		RETVAL = THIS->minorVersion;
	OUTPUT:
		RETVAL


void
ContextSettings::setDepthBits(depthBits)
	int depthBits
	CODE:
		THIS->depthBits = depthBits;

void
ContextSettings::setStencilBits(stencilBits)
	int stencilBits
	CODE:
		THIS->stencilBits = stencilBits;

void
ContextSettings::setAntialiasingLevel(antialiasingLevel)
	int antialiasingLevel
	CODE:
		THIS->antialiasingLevel = antialiasingLevel;

void
ContextSettings::setMajorVersion(majorVersion)
	int majorVersion
	CODE:
		THIS->majorVersion = majorVersion;

void
ContextSettings::setMinorVersion(minorVersion)
	int minorVersion
	CODE:
		THIS->minorVersion = minorVersion;
