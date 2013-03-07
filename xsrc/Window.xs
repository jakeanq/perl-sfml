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
ContextSettings::new(...)
	CODE:
		RETVAL = new ContextSettings();
		ARG_P_BEGIN
			ARG_P_OPTION("depthBits")
				RETVAL->depthBits = SvIV(ARG_P);
			ARG_P_OPTION_END
			ARG_P_OPTION("stencilBits")
				RETVAL->stencilBits = SvIV(ARG_P);
			ARG_P_OPTION_END
			ARG_P_OPTION("antialiasingLevel")
				RETVAL->antialiasingLevel = SvIV(ARG_P);
			ARG_P_OPTION_END
			ARG_P_OPTION("majorVersion")
				RETVAL->majorVersion = SvIV(ARG_P);
			ARG_P_OPTION_END
			ARG_P_OPTION("minorVersion")
				RETVAL->minorVersion = SvIV(ARG_P);
			ARG_P_OPTION_END
		ARG_P_END
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


