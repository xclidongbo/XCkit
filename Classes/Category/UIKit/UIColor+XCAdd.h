//
//  UIColor+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 26/04/2017.
//  Copyright © 2017 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef UIColorWithRGB
#define UIColorWithRGB(rgb) [UIColor colorWithRGB:(uint32_t)rgb]
#endif

#ifndef UIColorWithRGBA
#define UIColorWithRGBA(rgb,_alpha_) [UIColor colorWithRGB:(uint32_t)rgb alpha:(CGFloat)_alpha_]
#endif

#ifndef UIColorWithHex
#define UIColorWithHex(_hex_) [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

#ifndef UIColorWithHexA
#define UIColorWithHexAlpha(_hex_,_alpha_) [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_)) alpha:(CGFloat)_alpha_]
#endif

@interface UIColor (XCAdd)


+ (instancetype)colorWithHexString:(NSString *)hexString;

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;



+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;


/**
 Creates and returns a color object using the specified opacity and RGB hex value.
 
 @param rgbValue  The rgb value such as 0x66CCFF.
 
 @param alpha     The opacity value of the color object,
 specified as a value from 0.0 to 1.0.
 
 @return          The color object. The color information represented by this
 object is in the device RGB colorspace.
 */
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;


@end
