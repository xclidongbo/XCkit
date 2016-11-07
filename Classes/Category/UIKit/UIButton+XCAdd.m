//
//  UIButton+XCAdd.m
//  XCkit
//
//  Created by lidongbo on 04/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import "UIButton+XCAdd.h"
#import <objc/runtime.h>

static char btnKey;
@implementation UIButton (XCAdd)

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)actionBlock {
    objc_setAssociatedObject(self, &btnKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvent];
}

- (void)callActionBlock:(UIButton *)sender {
    ActionBlock block = objc_getAssociatedObject(self, &btnKey);
    if (block) {
        block(sender);
    }
}


@end
