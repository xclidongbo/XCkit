//
//  UIGestureRecognizer+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 18/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 手势的init方法,回调.
 */
@interface UIGestureRecognizer (XCAdd)

- (instancetype)initWithActionBlock:(void(^)(UIGestureRecognizer * sender))actionBlock;


@end

NS_ASSUME_NONNULL_END
