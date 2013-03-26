MODULE = SFML		PACKAGE = SFML::Graphics::CircleShape

CircleShape*
CircleShape::new(...)
	CODE:
		RETVAL = new CircleShape();
		ARG_P_BEGIN
			ARG_P_OPTION("radius")
				RETVAL->setRadius(SvNV(ARG_P));
			ARG_P_OPTION_END
			ARG_P_OPTION("pointCount")
				RETVAL->setPointCount(SvIV(ARG_P));
			ARG_P_OPTION_END
		ARG_P_END
	OUTPUT:
		RETVAL

CircleShape*
CircleShape::DESTROY()

void
CircleShape::setRadius(radius)
	float radius

float
CircleShape::getRadius()

void
CircleShape::setPointCount(count)
	unsigned int count

unsigned int
CircleShape::getPointCount()

void
CircleShape::getPoint(index)
	unsigned int index
	CODE:
		Vector2f v = THIS->getPoint(index);
		EXTEND(SP,1);
		XPUSHs(sv_2mortal(newSVnv(v.x)));
		XPUSHs(sv_2mortal(newSVnv(v.y)));

void
CircleShape::setTexture(texture, ...)
	Texture* texture
	CODE:
		if(items >1)
			THIS->setTexture(texture, SvTRUE(ST(2)));
		else
			THIS->setTexture(texture);

void
CircleShape::setTextureRect(left, top, width, height)
	int left
	int top
	int width
	int height
	CODE:
		THIS->setTextureRect(IntRect(left,top,width,height));

void
CircleShape::setFillColor(color)
	Color* color
	CODE:
		THIS->setFillColor(*color);

void
CircleShape::setOutlineColor(color)
	Color* color
	CODE:
		THIS->setOutlineColor(*color);

void
CircleShape::setOutlineThickness(thickness)
	float thickness

void
CircleShape::getTextureRect()
	CODE:
		EXTEND(SP,4);
		IntRect r = THIS->getTextureRect();
		XPUSHs(sv_2mortal(newSViv(r.top)));
		XPUSHs(sv_2mortal(newSViv(r.left)));
		XPUSHs(sv_2mortal(newSViv(r.width)));
		XPUSHs(sv_2mortal(newSViv(r.height)));

Color*
CircleShape::getFillColor()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Color";
	CODE:
		RETVAL = new Color(THIS->getFillColor());
	OUTPUT:
		RETVAL

Color*
CircleShape::getOutlineColor()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Color";
	CODE:
		RETVAL = new Color(THIS->getOutlineColor());
	OUTPUT:
		RETVAL

float
CircleShape::getOutlineThickness()

void
CircleShape::getLocalBounds()
	CODE:
		EXTEND(SP,4);
		FloatRect r = THIS->getLocalBounds();
		XPUSHs(sv_2mortal(newSVnv(r.top)));
		XPUSHs(sv_2mortal(newSVnv(r.left)));
		XPUSHs(sv_2mortal(newSVnv(r.width)));
		XPUSHs(sv_2mortal(newSVnv(r.height)));

void
CircleShape::getGlobalBounds()
	CODE:
		EXTEND(SP,4);
		FloatRect r = THIS->getGlobalBounds();
		XPUSHs(sv_2mortal(newSVnv(r.top)));
		XPUSHs(sv_2mortal(newSVnv(r.left)));
		XPUSHs(sv_2mortal(newSVnv(r.width)));
		XPUSHs(sv_2mortal(newSVnv(r.height)));

void
CircleShape::setPosition(x,y)
	float x
	float y

void
CircleShape::setRotation(angle)
	float angle

void
CircleShape::setScale(factorX, factorY)
	float factorX
	float factorY

void
CircleShape::setOrigin(x,y)
	float x
	float y

void
CircleShape::getPosition()
	CODE:
		EXTEND(SP,2);
		Vector2f r = THIS->getPosition();
		XPUSHs(sv_2mortal(newSVnv(r.x)));
		XPUSHs(sv_2mortal(newSVnv(r.y)));

float
CircleShape::getRotation()

void
CircleShape::getScale()
	CODE:
		EXTEND(SP,2);
		Vector2f r = THIS->getScale();
		XPUSHs(sv_2mortal(newSVnv(r.x)));
		XPUSHs(sv_2mortal(newSVnv(r.y)));

void
CircleShape::getOrigin()
	CODE:
		EXTEND(SP,2);
		Vector2f r = THIS->getOrigin();
		XPUSHs(sv_2mortal(newSVnv(r.x)));
		XPUSHs(sv_2mortal(newSVnv(r.y)));

void
CircleShape::move(offsetX, offsetY)
	float offsetX
	float offsetY

void
CircleShape::rotate(angle)
	float angle

void
CircleShape::scale(factorX, factorY)
	float factorX
	float factorY

Transform*
CircleShape::getTransform()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Transform";
	CODE:
		RETVAL = new Transform(THIS->getTransform());
	OUTPUT:
		RETVAL

Transform*
CircleShape::getInverseTransform()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Transform";
	CODE:
		RETVAL = new Transform(THIS->getInverseTransform());
	OUTPUT:
		RETVAL

MODULE = SFML		PACKAGE = SFML::Graphics::Color

Color*
Color::new(...)
	CODE:
		if(items == 5)
			RETVAL = new Color(SvUV(ST(1)), SvUV(ST(2)), SvUV(ST(3)), SvUV(ST(4)));
		else if(items == 4)
			RETVAL = new Color(SvUV(ST(1)), SvUV(ST(2)), SvUV(ST(3)));
		else {
			RETVAL = new Color();
			croak_xs_usage(cv,  "THIS, red=0, green=0, blue=0, alpha=255");
		}
	OUTPUT:
		RETVAL

void
Color::DESTROY()

unsigned int
Color::getA()
	CODE:
		RETVAL = THIS->a;
	OUTPUT:
		RETVAL

unsigned int
Color::getR()
	CODE:
		RETVAL = THIS->r;
	OUTPUT:
		RETVAL

unsigned int
Color::getG()
	CODE:
		RETVAL = THIS->g;
	OUTPUT:
		RETVAL

unsigned int
Color::getB()
	CODE:
		RETVAL = THIS->b;
	OUTPUT:
		RETVAL

unsigned int
Color::getRGBA()
	CODE:
		RETVAL = THIS->a & (THIS->b << 8) & (THIS->g << 16) & (THIS->b << 24);
	OUTPUT:
		RETVAL

void
Color::setA(a)
	unsigned int a
	CODE:
		THIS->a = a;

void
Color::setR(r)
	unsigned int r
	CODE:
		THIS->r = r;

void
Color::setG(g)
	unsigned int g
	CODE:
		THIS->g = g;

void
Color::setB(b)
	unsigned int b
	CODE:
		THIS->b = b;

void
Color::setRGBA(rgba)
	unsigned int rgba
	CODE:
		THIS->a = rgba & 0x000000FF >> 0;
		THIS->b = rgba & 0x0000FF00 >> 8;
		THIS->g = rgba & 0x00FF0000 >> 16;
		THIS->r = rgba & 0xFF000000 >> 24;

bool
color_eq(left, right, swap)
	Color* left
	Color* right
	bool swap
	OVERLOAD: ==
	CODE:
		RETVAL = (*left) == (*right);
	OUTPUT:
		RETVAL

bool
color_ne(left, right, swap)
	Color* left
	Color* right
	bool swap
	OVERLOAD: !=
	CODE:
		RETVAL = (*left) != (*right);
	OUTPUT:
		RETVAL

Color*
color_pl(left, right, swap)
	Color* left
	Color* right
	bool swap
	PREINIT:
		const char * CLASS = "SFML::Graphics::Color";
	OVERLOAD: +
	CODE:
		RETVAL = new Color((*left) + (*right));
	OUTPUT:
		RETVAL

Color*
color_ti(left, right, swap)
	Color* left
	Color* right
	bool swap
	PREINIT:
		const char * CLASS = "SFML::Graphics::Color";
	OVERLOAD: *
	CODE:
		RETVAL = new Color((*right) * (*left));
	OUTPUT:
		RETVAL

MODULE = SFML		PACKAGE = SFML::Graphics::ConvexShape

ConvexShape*
ConvexShape::new(...)
	CODE:
		if(items == 1)
			RETVAL = new ConvexShape();
		else if(items == 2)
			RETVAL = new ConvexShape(SvUV(ST(1)));
		else
			croak_xs_usage(cv,  "THIS, pointCount=0");
	OUTPUT:
		RETVAL

void
ConvexShape::DESTROY()

void
ConvexShape::setPointCount(count)
	unsigned int count

unsigned int
ConvexShape::getPointCount()

void
ConvexShape::setPoint(index, x, y)
	unsigned int index
	float x
	float y
	CODE:
		THIS->setPoint(index, Vector2f(x,y));

void
ConvexShape::getPoint(index)
	unsigned int index
	CODE:
		EXTEND(SP,2);
		Vector2f v = THIS->getPoint(index);
		XPUSHs(sv_2mortal(newSVnv(v.x)));
		XPUSHs(sv_2mortal(newSVnv(v.y)));

void
ConvexShape::setTexture(texture, ...)
	Texture* texture
	CODE:
		if(items == 1)
			THIS->setTexture(texture);
		else if(items == 2)
			THIS->setTexture(texture, SvTRUE(ST(2)));
		else
			croak_xs_usage(cv, "THIS, texture, resetRect=true");

void
ConvexShape::setTextureRect(x,y,width,height)
	int x
	int y
	int width
	int height
	CODE:
		THIS->setTextureRect(IntRect(x,y,width,height));

void
ConvexShape::setFillColor(color)
	Color* color
	CODE:
		THIS->setFillColor(*color);

void
ConvexShape::setOutlineColor(color)
	Color* color
	CODE:
		THIS->setFillColor(*color);

void
ConvexShape::setOutlineThickness(thickness)
	float thickness

void
ConvexShape::getTextureRect()
	CODE:
		EXTEND(SP,4);
		IntRect r = THIS->getTextureRect();
		XPUSHs(sv_2mortal(newSViv(r.top)));
		XPUSHs(sv_2mortal(newSViv(r.left)));
		XPUSHs(sv_2mortal(newSViv(r.width)));
		XPUSHs(sv_2mortal(newSViv(r.height)));

Color*
ConvexShape::getFillColor()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Color";
	CODE:
		RETVAL = new Color(THIS->getFillColor());
	OUTPUT:
		RETVAL

Color*
ConvexShape::getOutlineColor()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Color";
	CODE:
		RETVAL = new Color(THIS->getFillColor());
	OUTPUT:
		RETVAL

float
ConvexShape::getOutlineThickness()

void
ConvexShape::getLocalBounds()
	CODE:
		EXTEND(SP,4);
		FloatRect r = THIS->getLocalBounds();
		XPUSHs(sv_2mortal(newSVnv(r.top)));
		XPUSHs(sv_2mortal(newSVnv(r.left)));
		XPUSHs(sv_2mortal(newSVnv(r.width)));
		XPUSHs(sv_2mortal(newSVnv(r.height)));

void
ConvexShape::getGlobalBounds()
	CODE:
		EXTEND(SP,4);
		FloatRect r = THIS->getGlobalBounds();
		XPUSHs(sv_2mortal(newSVnv(r.top)));
		XPUSHs(sv_2mortal(newSVnv(r.left)));
		XPUSHs(sv_2mortal(newSVnv(r.width)));
		XPUSHs(sv_2mortal(newSVnv(r.height)));

void
ConvexShape::setPosition(x,y)
	float x
	float y

void
ConvexShape::setRotation(angle)
	float angle

void
ConvexShape::setScale(factorX, factorY)
	float factorX
	float factorY

void
ConvexShape::setOrigin(x,y)
	float x
	float y

void
ConvexShape::getPosition()
	CODE:
		EXTEND(SP,2);
		Vector2f r = THIS->getPosition();
		XPUSHs(sv_2mortal(newSVnv(r.x)));
		XPUSHs(sv_2mortal(newSVnv(r.y)));

float
ConvexShape::getRotation()

void
CircleShape::getScale()
	CODE:
		EXTEND(SP,2);
		Vector2f r = THIS->getScale();
		XPUSHs(sv_2mortal(newSVnv(r.x)));
		XPUSHs(sv_2mortal(newSVnv(r.y)));

void
ConvexShape::getOrigin()
	CODE:
		EXTEND(SP,2);
		Vector2f r = THIS->getOrigin();
		XPUSHs(sv_2mortal(newSVnv(r.x)));
		XPUSHs(sv_2mortal(newSVnv(r.y)));

void
ConvexShape::move(offsetX, offsetY)
	float offsetX
	float offsetY

void
ConvexShape::rotate(angle)
	float angle

void
ConvexShape::scale(factorX, factorY)
	float factorX
	float factorY

Transform*
ConvexShape::getTransform()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Transform";
	CODE:
		RETVAL = new Transform(THIS->getTransform());
	OUTPUT:
		RETVAL

Transform*
ConvexShape::getInverseTransform()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Transform";
	CODE:
		RETVAL = new Transform(THIS->getInverseTransform());
	OUTPUT:
		RETVAL

MODULE = SFML		PACKAGE = SFML::Graphics::Font

Font*
Font::new(...)
	CODE:
		if(items == 2 && sv_isobject(SvRV(ST(1))) && SvTYPE(SvRV(ST(1))) == SVt_PVMG){
			RETVAL = new Font(*((Font*)SvIV(SvRV(ST(1)))));
		} else
			RETVAL = new Font();

Font*
Font::DESTROY()

bool
Font::loadFromFile(filename)
	char * filename
	CODE:
		RETVAL = THIS->loadFromFile(std::string(filename));
	OUTPUT:
		RETVAL

bool
Font::loadFromMemory(data)
	SV* data
	CODE:
		STRLEN len;
		void * dt = SvPV(data, len);
		RETVAL = THIS->loadFromMemory(dt, len);
	OUTPUT:
		RETVAL

Glyph*
Font::getGlyph(codePoint, characterSize, bold)
	unsigned int codePoint
	unsigned int characterSize
	bool bold
	PREINIT:
		const char * CLASS = "SFML::Graphics::Glyph";
	CODE:
		RETVAL = new Glyph(THIS->getGlyph(codePoint, characterSize, bold));
	OUTPUT:
		RETVAL

int
Font::getKerning(first, second, characterSize);
	unsigned int first
	unsigned int second
	unsigned int characterSize

int
Font::getLineSpacing(characterSize)
	unsigned int characterSize

Texture*
Font::getTexture(characterSize)
	unsigned int characterSize
	PREINIT:
		const char * CLASS = "SFML::Graphics::Texture";
	CODE:
		RETVAL = (Texture*)(void*)&THIS->getTexture(characterSize);
	OUTPUT:
		RETVAL

Font*
getDefaultFont()
	PREINIT:
		const char * CLASS = "SFML::Graphics::Font";
