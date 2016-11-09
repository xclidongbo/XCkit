//
//  UIScrollView+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 08/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (XCAdd)


- (void)scrollToTop;

- (void)scrollToBottom;

- (void)scrollToLeft;

- (void)scrollToRight;


- (void)scorllToTopAnimated:(void)animated;

- (void)scorllToBottomAnimated:(void)animated;

- (void)scorllToLeftAnimated:(void)animated;

- (void)scorllToRightAnimated:(void)animated;


@end

NS_ASSUME_NONNULL_END
