/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;       /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;     /* -c option; centers dmenu on screen */
static int min_width = 500;  /* minimum width when centered */
static int fuzzy = 0;        /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"scientifica:pixelsize=14:antialias=true:autohint=true",
	"Hack Nerd Font:pixelsize=10:antialias=true:autohint=true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     						 fg           bg       */
	[SchemeNorm] = 			{ "#ebdbb2", "#1d2021" },
	[SchemeSel] = 			{ "#d5c4a1", "#d65d0e" },
	[SchemeSelHighlight] = 	{ "#ebdbb2", "#1d2021" },
	[SchemeNormHighlight] = { "#ebdbb2", "#1d2021" },
	[SchemeOut] = 			{ "#ebdbb2", "#1d2021" },
	[SchemeMid] = 			{ "#ebdbb2", "#1d2021" },

};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 0;
static unsigned int lineheight = 22;  /* -h option; minimum height of a menu line */
static unsigned int columns    = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 5;  /* -bw option; to add border width */


