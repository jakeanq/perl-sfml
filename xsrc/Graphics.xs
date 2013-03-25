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
