//
//  UIGestureRecognizer+XCAdd.m
//  XCkit
//
//  Created by lidongbo on 18/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import "UIGestureRecognizer+XCAdd.h"
#import <objc/runtime.h>

static char GRKey;
typedef void(^ActionBlock)(UIGestureRecognizer * sender);

@implementation UIGestureRecognizer (XCAdd)



- (instancetype)initWithActionBlock:(void(^)(UIGestureRecognizer * sender))actionBlock {
    objc_setAssociatedObject(self, &GRKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self = [self initWithTarget:self action:@selector(callBackGR:)];
    return self;
}
- (void)callBackGR:(UIGestureRecognizer *)sender {
    ActionBlock block = objc_getAssociatedObject(self, &GRKey);
    if (block) block(sender);
}


@end
