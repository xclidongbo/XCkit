//
//  UIImage+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 09/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (XCAdd)


- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;


- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(nullable UIColor *)borderColor;


- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin;

@end

NS_ASSUME_NONNULL_END
