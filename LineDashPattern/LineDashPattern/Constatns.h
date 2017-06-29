//
//  Constatns.h
//  ButtonOverTableView
//
//  Created by Андрей on 12.01.17.
//  Copyright © 2017 urbolabs.urbo. All rights reserved.
//

#ifndef Constatns_h
#define Constatns_h

#define COLOR_MAIN 0x213550
#define COLOR_BLUE_TITLE 0x3b58b6
#define COLOR_ORANGE 0xf5a623


#define COLOR_MAIN_ADD 0x303f9f
#define COLOR_ACCENT 0xff607f
#define COLOR_RED 0xd43d21


#define COLOR_MAIN_TEXT 0x263238
#define COLOR_MAIN_TEXT_ADD 0x37474f
#define COLOR_MAIN_TEXT_LIGHT 0x90a4ae
#define COLOR_MAIN_TEXT_POPUP 0xcdd9ce

#define COLOR_CATEGORY_NORMAL 0x90a4ae
#define COLOR_CATEGORY_SELECTED 0xf7f6f6


#define COLOR_FACEBOOK 0x3b5998
#define COLOR_FACEBOOK_ADD 0x425EA8
#define COLOR_GMAIL 0xD8453C
#define COLOR_GMAIL_ADD 0xCE423D


//#define COLOR_MAIN 0x323874 
//#define COLOR_MAIN_ADD 0x303f9f
//#define COLOR_ACCENT 0xff607f
//#define COLOR_MAIN_TEXT 0x212121
//#define COLOR_MAIN_TEXT_ADD 0x757575
//#define COLOR_FACEBOOK 0x3b5998
//#define COLOR_FACEBOOK_ADD 0x425EA8
//#define COLOR_GMAIL 0xD8453C
//#define COLOR_GMAIL_ADD 0xCE423D




#define UIColorFromHEX(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define UIColorFromRGBA(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]


static NSString *const kApiLinkFriednsAcc = @"http://urbolabs.com/api/friends.accept";
static NSString *const kApiLinkFriednsAdd = @"http://urbolabs.com/api/friends.add";

#endif /* Constatns_h */
