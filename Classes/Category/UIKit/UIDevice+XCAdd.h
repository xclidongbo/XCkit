//
//  UIDevice+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 08/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kSystemVersion
#define kSystemVersion [[UIDevice currentDevice] systemVersion].doubleValue
#endif







NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (XCAdd)

@end

NS_ASSUME_NONNULL_END
