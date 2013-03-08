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

MODULE = SFML		PACKAGE = SFML::Window::Joystick

bool
isConnected(joystick_id)
	int joystick_id
	CODE:
		RETVAL = Joystick::isConnected(joystick_id);
	OUTPUT:
		RETVAL

int
getButtonCount(joystick_id)
	int joystick_id
	CODE:
		RETVAL = Joystick::getButtonCount(joystick_id);
	OUTPUT:
		RETVAL

bool
hasAxis(joystick_id, axis)
	int joystick_id	
	int axis
	CODE:
		RETVAL = Joystick::hasAxis(joystick_id, (sf::Joystick::Axis) axis);
	OUTPUT:
		RETVAL

bool
isButtonPressed(joystick_id, button)
	int joystick_id
	int button
	CODE:
		RETVAL = Joystick::isButtonPressed(joystick_id,button);
	OUTPUT:
		RETVAL

float
getAxisPosition(joystick_id, axis)
	int joystick_id
	int axis
	CODE:
		RETVAL = Joystick::getAxisPosition(joystick_id, (sf::Joystick::Axis) axis);
	OUTPUT:
		RETVAL

void
update()
	CODE:
		Joystick::update();

MODULE = SFML		PACKAGE = SFML::Window::Keyboard

bool
isKeyPressed(key_id)
	int key_id
	CODE:
		RETVAL = Keyboard::isKeyPressed((sf::Keyboard::Key) key_id);
	OUTPUT:
		RETVAL

MODULE = SFML		PACKAGE = SFML::Window::Mouse

bool
isButtonPressed(button_id)
	int button_id
	CODE:
		RETVAL = Mouse::isButtonPressed((sf::Mouse::Button)button_id);
	OUTPUT:
		RETVAL

void
getPosition(...)
	PREINIT:
	Vector2i v;
	PPCODE:
		if(items > 0){
			//Insert extended call here once object completed
		} else {
			v = Mouse::getPosition();
		}
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSViv(v.x)));
		PUSHs(sv_2mortal(newSViv(v.y)));

void
setPosition(x,y,...)
	int x
	int y
	CODE:
		if(items > 3) {
			//Insert extended call here once object completed
		} else {
			Mouse::setPosition(Vector2i(x,y));
		}

MODULE = SFML		PACKAGE = SFML::Window::VideoMode

VideoMode*
VideoMode::new(width, height, ...)
	int width
	int height
	CODE:
		if (items > 3)
			RETVAL = new VideoMode(width, height, SvIV(ST(3)));
		else
			RETVAL = new VideoMode(width, height);
	OUTPUT:
		RETVAL

bool
VideoMode::isValid()

int
VideoMode::getWidth()
	CODE:
		RETVAL = THIS->width;
	OUTPUT:
		RETVAL

int
VideoMode::getHeight()
	CODE:
		RETVAL = THIS->height;
	OUTPUT:
		RETVAL

int
VideoMode::getBitsPerPixel()
	CODE:
		RETVAL = THIS->bitsPerPixel;
	OUTPUT:
		RETVAL


void
VideoMode::setWidth(width)
	int width
	CODE:
		THIS->width = width;

void
VideoMode::setHeight(height)
	int height
	CODE:
		THIS->height = height;

void
VideoMode::setBitsPerPixel(bitsPerPixel)
	int bitsPerPixel
	CODE:
		THIS->bitsPerPixel = bitsPerPixel;

VideoMode*
getDesktopMode()
	PREINIT:
		const char * CLASS = "SFML::Window::VideoMode";
	CODE:
		RETVAL = new VideoMode(VideoMode::getDesktopMode());
	OUTPUT:
		RETVAL

void
getFullscreenModes()
	PREINIT:
	std::vector<VideoMode> vmv;
	PPCODE:
		vmv = VideoMode::getFullscreenModes();
		EXTEND(SP,vmv.size());
		for(int i = 0; i < vmv.size(); i++){
			SV* sv = newSV(0);
			sv_setref_pv(sv, "SFML::Window::VideoMode", (void*) new VideoMode(vmv[i]));
			PUSHs(sv_2mortal(sv));
		}
