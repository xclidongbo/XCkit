//
//  UIButton+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 04/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 UIButton中图片和文字的位置

 - UIImageTextPositionTypeLeft: 文字在左,图片在右
 - UIImageTextPositionTypeBottom: 文字在下,图片在上
 - UIImageTextPositionTypeRight: 文字在右,图片在左
 */
typedef NS_ENUM(NSUInteger,UIImageTextPositionType) {
    UIImageTextPositionTypeLeft,
    UIImageTextPositionTypeBottom,
    UIImageTextPositionTypeRight,
};


NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionBlock)(UIButton * sender);
@interface UIButton (XCAdd)

/**
 UIButton 事件封装的block

 @param controlEvent 点击的各个状态
 @param actionBlock 调用的block
 */
- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)actionBlock;



/**
 注意: 一定要设置完控件的约束后,再调用此方法,否则取不到titleLabel和image的size.
 最好不要设置UIButton的宽高约束,这样可以让图片和文字不会因为约束太小,而显示不完全.

 @param title 文字
 @param image 图片
 @param gap 文字和图片的间隙
 @param positionType 图文位置种类
 */
- (void)setImageTextPostionWithTitle:(NSString * _Nullable)title
                               image:(UIImage * _Nullable)image
                                 gap:(CGFloat)gap
                        positionType:(UIImageTextPositionType)positionType;



/**
 设置backgroundImage 可以设置空心,实心,矩形,圆角矩形,圆角的Button

 @param radius 圆角的半径
 @param lineWidth 外围线圈的宽度
 @param strokeColor 线圈的颜色
 @param fillColor 线圈内的填充颜色
 @param state 控制状态
 */
- (void)setBackgroundImageWithRadius:(CGFloat)radius
                           lineWidth:(CGFloat)lineWidth
                         strokeColor:(UIColor *_Nullable)strokeColor
                           fillColor:(UIColor *)fillColor
                            forState:(UIControlState)state;


/**
 设置backgroundImage 为渐变色的矩形,圆角矩形,圆形的button;
 用法示例:
 [self.btn setBackgroundImageWithGradientCornerRadius:10 colors:@[[UIColor redColor],[UIColor blueColor]] locations:@[@0,@1.0] forState:UIControlStateNormal];

 @param radius 圆角半径
 @param colors 颜色的数组
 @param locations 比例的数组
 @param state 控制状态
 */
- (void)setBackgroundImageWithGradientCornerRadius:(CGFloat)radius
                                            colors:(NSArray <UIColor *>*)colors
                                         locations:(NSArray *)locations
                                          forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
