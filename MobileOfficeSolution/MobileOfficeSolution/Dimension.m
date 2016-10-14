//
//  Rule.m
//  Practice
//
//  Created by Ibrahim on 20/05/2016.
//  Copyright © 2016 Ibrahim. All rights reserved.
//


// IMPORT

#import "Dimension.h"


// IMPLEMENTATION

    // GENERAL

    int const ICON_SIZE_SMALL = 36;
    int const ICON_SIZE_MEDIUM = 48;
    int const ICON_SIZE_LARGE = ICON_SIZE_MEDIUM * 1.5;
    int const ICON_SIZE_XLARGE = ICON_SIZE_MEDIUM  * 2;
    int const ICON_SIZE_XXLARGE = ICON_SIZE_MEDIUM * 3;
    int const ICON_SIZE_XXXLARGE = ICON_SIZE_MEDIUM * 4;

    int const GENERAL_MARGIN_SMALL = 10;
    int const GENERAL_MARGIN_MEDIUM = GENERAL_MARGIN_SMALL * 2;
    int const GENERAL_MARGIN_LARGE = GENERAL_MARGIN_SMALL * 3;

    int const GENERAL_PADDING_SMALL = 5;
    int const GENERAL_PADDING_MEDIUM = GENERAL_PADDING_SMALL * 2;
    int const GENERAL_PADDING_LARGE = GENERAL_PADDING_SMALL * 4;

    // INPUT

    int const INPUT_WIDTH_PURE = 200;
    int const INPUT_HEIGHT_PURE = 34;
    int const INPUT_BORDER_WIDTH = 1;

    int const TEXTFIELD_WIDTH_SHORT = INPUT_WIDTH_PURE / 2;
    int const TEXTFIELD_WIDTH_MEDIUM = INPUT_WIDTH_PURE + 85;
    int const TEXTFIELD_WIDTH_LONG = INPUT_WIDTH_PURE * 1.5;
    int const TEXTFIELD_HEIGHT_SINGLE = INPUT_HEIGHT_PURE - 4;
    int const TEXTFIELD_HEIGHT_MULTI = INPUT_HEIGHT_PURE * 3;
    int const TEXTFIELD_BORDER_WIDTH = INPUT_BORDER_WIDTH;

    // LAYOUT

    int const LAYOUT_BORDER_WIDTH = 2;
    int const LAYOUT_DECORATOR_PROPORTION1 = 60;
    int const LAYOUT_STACKVIEW_SPACING = 10;

    int const NAVIGATION_CONTAINER_WIDTH = LAYOUT_DECORATOR_PROPORTION1;
    int const PAGE_HEADER_HEIGHT = LAYOUT_DECORATOR_PROPORTION1 - ((LAYOUT_DECORATOR_PROPORTION1 / 10) * 2);
    int const PAGE_SUBHEADER_HEIGHT = LAYOUT_DECORATOR_PROPORTION1 - ((LAYOUT_DECORATOR_PROPORTION1 / 10) * 4);
    int const PAGE_HEADER_BORDERWIDTH = LAYOUT_BORDER_WIDTH;
    int const FORM_STACKVIEW_HORIZONTALSPACING = LAYOUT_STACKVIEW_SPACING;
    int const FORM_STACKVIEW_VERTICALSPACING = LAYOUT_STACKVIEW_SPACING * 2;
    int const FORM_STACKVIEWCOLUMN_HORIZONTALSPACING = LAYOUT_STACKVIEW_SPACING * 4;
    int const GUIDEMENU_STACKVIEW_HORIZONTALSPACING = LAYOUT_STACKVIEW_SPACING;
    int const GUIDEMENU_STACKVIEW_VERTICALSPACING = LAYOUT_STACKVIEW_SPACING / 2;
    int const GUIDEMENU_CONTAINER_HEIGHT = LAYOUT_DECORATOR_PROPORTION1;
    int const GUIDEDETAIL_CONTAINER_WIDTH = NAVIGATION_CONTAINER_WIDTH * 3;

    // LABEL

    int const FIELD_WIDTH_PURE = 140;
    int const FIELD_HEIGHT_PURE = 34;

    int const FIELD_WIDTH_SHORT = FIELD_WIDTH_PURE / 2;
    int const FIELD_WIDTH_MEDIUM = FIELD_WIDTH_PURE;
    int const FIELD_WIDTH_LONG = FIELD_WIDTH_PURE * 1.5;
    int const FIELD_HEIGHT_SINGLE = FIELD_HEIGHT_PURE;
    int const FIELD_HEIGHT_MULTI = FIELD_HEIGHT_PURE * 3;

    int const NOTE_WIDTH_MEDIUM = FIELD_WIDTH_PURE * 10;

    // BUTTON

    int const BUTTON_WIDTH_PURE = INPUT_WIDTH_PURE / 2;
    int const BUTTON_HEIGHT_PURE = INPUT_HEIGHT_PURE;

    int const BUTTON_NAVIGATION_WIDTH = NAVIGATION_CONTAINER_WIDTH;
    int const BUTTON_NAVIGATION_HEIGHT = (NAVIGATION_CONTAINER_WIDTH / 3) * 4;
    int const BUTTON_CONFIRMSPAJ_HEIGHT = INPUT_HEIGHT_PURE * 1.5;

    // TABLE

    int const TABLE_STACKVIEW_SPACING = 2;
    int const TABLE_HEADER_HEIGHT = FIELD_HEIGHT_PURE + 16;