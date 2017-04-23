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


/**
 获取圆角图片

 @param radius 圆形的半径
 @return 图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;


/**
 获取圆角图片

 @param radius 圆形的半径
 @param borderWidth 边界宽
 @param borderColor 边界颜色
 @return 图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(nullable UIColor *)borderColor;


/**
 获取圆角图片

 @param radius 圆形的半径
 @param corners 设置圆角的枚举
 @param borderWidth 边界宽
 @param borderColor 边界颜色
 @param borderLineJoin 终点处理类型
 @return 图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin;




@end

NS_ASSUME_NONNULL_END
