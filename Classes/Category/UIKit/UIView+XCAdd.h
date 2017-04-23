//
//  UIView+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 21/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
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

@end

NS_ASSUME_NONNULL_END
