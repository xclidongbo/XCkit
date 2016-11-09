//
//  UIAlertController+XCAdd.h
//  XCkit
//
//  Created by lidongbo on 08/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef void(^UIAlertControllerCompletionBlock)(UIAlertController * controller, UIAlertAction * action ,NSInteger buttonIndex);

@interface UIAlertController (XCAdd)

@property (readonly, nonatomic, assign) NSInteger cancelButtonIndex;
@property (readonly, nonatomic, assign) NSInteger destructiveButtonIndex;
@property (readonly, nonatomic, assign) NSInteger firstOtherButtonIndex;




+ (instancetype)alertControllerWithTitle:(nullable NSString *)title
                                 message:(nullable NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                       cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                  destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                        otherButtonTitle:(nullable NSArray<NSString *> *)otherButtonTitles
                                tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;


@end

NS_ASSUME_NONNULL_END
