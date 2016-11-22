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

- (void)tapActionWithBlock:(void(^)(UITapGestureRecognizer * sender))actionBlock;

@end

NS_ASSUME_NONNULL_END
