/*
 * good-mood.c
 * generated by gwizard 0.0.0 on Fri Nov 16 16:06:59 2001
 */

/*
** Copyright (C) 2001 Dirk-Jan C. Binnema <djcb@djcbsoftware.nl>
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
**
*/

#include "good-mood.h"

/*
 * NOTE: these may not (all) be needed. Please remove
 * unneeded declarations, as well as their implementation.
 */
static void good_mood_class_init  (GoodMoodClass *klass);
static void good_mood_init        (GoodMood *goodmood);

static GtkObjectClass *parent_class = NULL;

GtkType
good_mood_get_type (void)
{
	static GtkType goodmood_type = 0;

	if (!goodmood_type) {
		GtkTypeInfo goodmood_info = {
			"GoodMood",
			sizeof (GoodMood),
			sizeof (GoodMoodClass),
			(GtkClassInitFunc) good_mood_class_init,
			(GtkObjectInitFunc) good_mood_init,
			/* reserved_1 */ NULL,
			/* reserved_2 */ NULL,
			(GtkClassInitFunc) NULL
		};

		goodmood_type = bonobo_x_type_unique (
			BONOBO_X_OBJECT_TYPE,
			POA_Bonobo_Sample_GoodMood__init,
			NULL,
			GTK_STRUCT_OFFSET (GoodMoodClass, epv),
			&goodmood_info);
	}
;	return goodmood_type;
}

static void
good_mood_class_init (GoodMoodClass *klass)
{
	POA_Bonobo_Sample_GoodMood__epv *epv = &klass->epv;
	parent_class = gtk_type_class (BONOBO_X_OBJECT_TYPE);

	/* TODO: more class initialization */

	/*
	 * TODO: place ptrs to member functions in epv
	 * ie. epv->my_func = my_obj_my_func;
	 */
	epv->say_hello = good_mood_say_hello;
}

static void
good_mood_init (GoodMood *goodmood)
{
	/* TODO: object initialization */
}

GoodMood*
good_mood_new (void)
{
	return gtk_type_new (good_mood_get_type ());
}


/*
 * TODO: add your custom function implementations here
 */
CORBA_char*      
good_mood_say_hello  (PortableServer_Servant _servant,
		      CORBA_Environment * ev)
{
	return CORBA_string_dup ("Hi, how are you!");
}
