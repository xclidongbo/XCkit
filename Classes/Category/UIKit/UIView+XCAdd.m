//
//  UIView+XCAdd.m
//  XCkit
//
//  Created by lidongbo on 21/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import "UIView+XCAdd.h"
#import <objc/runtime.h>

static char kTapActionHandle;
static char kTapActionBlock;

@implementation UIView (XCAdd)

- (void)tapActionWithBlock:(void(^)(UITapGestureRecognizer * sender))actionBlock {
    UITapGestureRecognizer * tapGR = objc_getAssociatedObject(self, &kTapActionHandle);
    if (!tapGR) {
        tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapGR];
        objc_setAssociatedObject(self, &kTapActionHandle, tapGR, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    objc_setAssociatedObject(self, &kTapActionBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (void)tapAction:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        void(^actionBlock)(UITapGestureRecognizer *) = objc_getAssociatedObject(self, &kTapActionBlock);
        if (actionBlock) {
            actionBlock(sender);
        }
    }
}


@end
