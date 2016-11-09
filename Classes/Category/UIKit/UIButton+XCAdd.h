//
//  UIButton+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 04/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionBlock)(UIButton * sender);
@interface UIButton (XCAdd)

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
