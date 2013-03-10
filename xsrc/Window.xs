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
		//STACK_DUMP
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

unsigned int
ContextSettings::getDepthBits()
	CODE:
		RETVAL = THIS->depthBits;
	OUTPUT:
		RETVAL

unsigned int
ContextSettings::getStencilBits()
	CODE:
		RETVAL = THIS->stencilBits;
	OUTPUT:
		RETVAL

unsigned int
ContextSettings::getAntialiasingLevel()
	CODE:
		RETVAL = THIS->antialiasingLevel;
	OUTPUT:
		RETVAL

unsigned int
ContextSettings::getMajorVersion()
	CODE:
		RETVAL = THIS->majorVersion;
	OUTPUT:
		RETVAL

unsigned int
ContextSettings::getMinorVersion()
	CODE:
		RETVAL = THIS->minorVersion;
	OUTPUT:
		RETVAL


void
ContextSettings::setDepthBits(depthBits)
	unsigned int depthBits
	CODE:
		THIS->depthBits = depthBits;

void
ContextSettings::setStencilBits(stencilBits)
	unsigned int stencilBits
	CODE:
		THIS->stencilBits = stencilBits;

void
ContextSettings::setAntialiasingLevel(antialiasingLevel)
	unsigned int antialiasingLevel
	CODE:
		THIS->antialiasingLevel = antialiasingLevel;

void
ContextSettings::setMajorVersion(majorVersion)
	unsigned int majorVersion
	CODE:
		THIS->majorVersion = majorVersion;

void
ContextSettings::setMinorVersion(minorVersion)
	unsigned int minorVersion
	CODE:
		THIS->minorVersion = minorVersion;

MODULE = SFML		PACKAGE = SFML::Window::Joystick

bool
isConnected(joystick_id)
	unsigned int joystick_id
	CODE:
		RETVAL = Joystick::isConnected(joystick_id);
	OUTPUT:
		RETVAL

unsigned int
getButtonCount(joystick_id)
	unsigned int joystick_id
	CODE:
		RETVAL = Joystick::getButtonCount(joystick_id);
	OUTPUT:
		RETVAL

bool
hasAxis(joystick_id, axis)
	unsigned int joystick_id	
	int axis
	CODE:
		RETVAL = Joystick::hasAxis(joystick_id, (sf::Joystick::Axis) axis);
	OUTPUT:
		RETVAL

bool
isButtonPressed(joystick_id, button)
	unsigned int joystick_id
	unsigned int button
	CODE:
		RETVAL = Joystick::isButtonPressed(joystick_id,button);
	OUTPUT:
		RETVAL

float
getAxisPosition(joystick_id, axis)
	unsigned int joystick_id
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
			v = Mouse::getPosition(*((Window*)SvIV(ST(0))));
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
			Mouse::setPosition(Vector2i(x,y),*((Window*)SvIV(ST(0))));
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

void
VideoMode::DESTROY()

bool
VideoMode::isValid()

unsigned int
VideoMode::getWidth()
	CODE:
		RETVAL = THIS->width;
	OUTPUT:
		RETVAL

unsigned int
VideoMode::getHeight()
	CODE:
		RETVAL = THIS->height;
	OUTPUT:
		RETVAL

unsigned int
VideoMode::getBitsPerPixel()
	CODE:
		RETVAL = THIS->bitsPerPixel;
	OUTPUT:
		RETVAL


void
VideoMode::setWidth(width)
	unsigned int width
	CODE:
		THIS->width = width;

void
VideoMode::setHeight(height)
	unsigned int height
	CODE:
		THIS->height = height;

void
VideoMode::setBitsPerPixel(bitsPerPixel)
	unsigned int bitsPerPixel
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
		for(unsigned int i = 0; i < vmv.size(); i++){
			SV* sv = newSV(0);
			sv_setref_pv(sv, "SFML::Window::VideoMode", (void*) new VideoMode(vmv[i]));
			PUSHs(sv_2mortal(sv));
		}

MODULE = SFML		PACKAGE = SFML::Window::Window

Window*
Window::new(mode, title, ...)
	VideoMode* mode
	char * title
	CODE:
		if(items >= 5){
			RETVAL = new Window(*mode, std::string(title), SvIV(ST(3)), *((ContextSettings*) SvIV(SvRV(ST(4)))));
		} else if (items >= 4){
			RETVAL = new Window(*mode, std::string(title), SvIV(ST(3)));
		} else {
			RETVAL = new Window(*mode, std::string(title));
		}
	OUTPUT:
		RETVAL

void
Window::DESTROY()

void
Window::create(mode, title, ...)
	VideoMode* mode
	char * title
	CODE:
		//STACK_DUMP
		if(items >= 5){
			THIS->create(*mode, std::string(title), SvIV(ST(3)), *((ContextSettings*) SvIV(SvRV(ST(4)))));
		} else if (items >= 4){
			THIS->create(*mode, std::string(title), SvIV(ST(3)));
		} else {
			new Window(*mode, std::string(title));
		}

void
Window::close()

bool
Window::isOpen()

ContextSettings*
Window::getSettings()
	PREINIT:
		const char * CLASS = "SFML::Window::ContextSettings";
	CODE:
		RETVAL = new ContextSettings(THIS->getSettings());
	OUTPUT:
		RETVAL

void
Window::getPosition()
	PREINIT:
	Vector2i v;
	PPCODE:
		v = THIS->getPosition();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSViv(v.x)));
		PUSHs(sv_2mortal(newSViv(v.y)));

void
Window::setPosition(x,y)
	int x
	int y
	CODE:
		THIS->setPosition(Vector2i(x,y));

void
Window::getSize()
	PREINIT:
	Vector2u v;
	PPCODE:
		v = THIS->getSize();
		fprintf(stderr, "Size to %u, %u\n", v.x, v.y); 
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVuv(v.x)));
		PUSHs(sv_2mortal(newSVuv(v.y)));

void
Window::setSize(x,y)
	unsigned int x
	unsigned int y
	CODE:
		THIS->setSize(Vector2u(x,y));

void
Window::setTitle(title)
	char * title
	CODE:
		THIS->setTitle(std::string(title));

void
Window::setVisible(...)
	CODE:
		if(items >= 1)
			THIS->setVisible(SvTRUE(ST(1)));
		else
			THIS->setVisible(true);

void
Window::setVerticalSyncEnabled(...)
	CODE:
		if(items >= 1)
			THIS->setVerticalSyncEnabled(SvTRUE(ST(1)));
		else
			THIS->setVerticalSyncEnabled(true);

void
Window::setMouseCursorVisible(...)
	CODE:
		if(items >= 1)
			THIS->setMouseCursorVisible(SvTRUE(ST(1)));
		else
			THIS->setMouseCursorVisible(true);

void
Window::setKeyRepeatEnabled(...)
	CODE:
		if(items >= 1)
			THIS->setKeyRepeatEnabled(SvTRUE(ST(1)));
		else
			THIS->setKeyRepeatEnabled(true);

void
Window::setFramerateLimit(limit)
	unsigned int limit

void
Window::setJoystickThreshold(threshold)
	float threshold


bool
Window::setActive(...)
	CODE:
		if(items >= 1)
			RETVAL = THIS->setActive(SvTRUE(ST(1)));
		else
			RETVAL = THIS->setActive(true);
	OUTPUT:
		RETVAL

void
Window::display()

void
Window::setIcon(x,y,pixels)
	unsigned int x
	unsigned int y
	void * pixels
	CODE:
		THIS->setIcon(x,y,(Uint8*)pixels);
