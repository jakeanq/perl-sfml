package SFML::Style;

use constant {
	None => 0,
	Titlebar => 1 << 0,
	Resize => 1 << 1,
	Close => 1 << 2,
	Fullscreen => 1 << 3,
	Default => ((1 << 0) | (1 << 1) | (1 << 2)),
};

1;
