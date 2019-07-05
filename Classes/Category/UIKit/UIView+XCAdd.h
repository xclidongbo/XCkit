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
    UIView上添加渐变色的内容
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


NS_ASSUME_NONNULL_BEGIN
@interface UIView (XCAnimation)


/**
 左右晃动
 
 @param duration 执行时间
 @param dampingRatio 范围0.0f到1.0f 数值越小,震动效果越明显
 @param velocity 初始速度, 数值越大,初始速度越快.
 @param completion 结束后的回调.
 */
- (void)shakeWithDuration:(NSTimeInterval)duration
   usingSpringWithDamping:(CGFloat)dampingRatio
    initialSpringVelocity:(CGFloat)velocity
               completion:(void (^)(BOOL finished))completion;


/**
 左右晃动
 duration .7
 dampingRatio .2
 velocity 10
 @param completion 晃动结束后的回调
 */
- (void)shakeWithCompletion:(void (^)(BOOL finished))completion;



@end
NS_ASSUME_NONNULL_END
