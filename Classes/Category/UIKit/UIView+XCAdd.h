//
//  UIView+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 21/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 梯形渐变的方向
 
 - NSGradientDirectionTypeLeftToRight: 从左至右 默认
 - NSGradientDirectionTypeTopToBottom: 从上之下
 - NSGradientDirectionTypeTopLeftToRightBottom: 左上到右下
 */
typedef NS_ENUM(NSInteger, NSGradientDirectionType) {
    NSGradientDirectionTypeLeftToRight,
    NSGradientDirectionTypeTopToBottom,
    NSGradientDirectionTypeTopLeftToBottomRight,
};


NS_ASSUME_NONNULL_BEGIN
@interface UIView (XCAdd)




/**
 UIView添加Tap点击事件

 @param actionBlock 点击事件的回调
 */
- (void)tapActionWithBlock:(void(^)(UITapGestureRecognizer * sender))actionBlock;


/**
 为UIView 增加四边的圆角

 @param rectCorners 指定哪条边可以成为圆角
 @param cornerRadii 设置圆角半径
 */
- (void)setRectCorners:(UIRectCorner)rectCorners cornerRadii:(CGSize)cornerRadii;





/**
    UIView上添加渐变的内容
    用法:
    [self.subView addGradientLayerWithColors:@[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor] locations:@[@0.3, @0.5, @1.0] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1.0, 0)]

    @param colors color.CGColor 数组
    @param locations 渐变的比例位置
    @param startPoint 开始点
    @param endPoint 结束点

   (0,0) ------- (1,0)
         |  |  |
         -------
         |  |  |
   (0,1) ------- (1,1)
 */
- (void)addGradientLayerWithColors:(NSArray *)colors
                         locations:(NSArray <NSNumber *>*)locations
                        startPoint:(CGPoint)startPoint
                          endPoint:(CGPoint)endPoint;

/**
 UIView上添加渐变的内容
 用法:
 [self.subView addGradientLayerWithColors:@[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor]] locations:@[@0.3, @0.5, @1.0] direction:NSGradientDirectionTypeTopLeftToRightBottom];
 
 @param colors color 数组
 @param locations 渐变的比例位置
 @param direction 起止方向
 */
- (void)addGradientLayerWithColors:(NSArray <UIColor *>*)colors
                         locations:(NSArray <NSNumber *>*)locations
                         direction:(NSGradientDirectionType)direction;



@end

NS_ASSUME_NONNULL_END
