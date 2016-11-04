//
//  UIButton+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 04/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ActionBlock)(UIButton * sender);
@interface UIButton (XCAdd)

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)actionBlock;

@end
