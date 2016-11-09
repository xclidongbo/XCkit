//
//  UIAlertController+XCAdd.m
//  XCkit
//
//  Created by lidongbo on 08/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import "UIAlertController+XCAdd.h"


static const NSInteger UIAlertControllerBlocksCancelButtonIndex = 0;
static const NSInteger UIAlertControllerBlocksDestructiveButtonIndex = 1;
static const NSInteger UIAlertControllerBlocksFirstOtherButtonIndex = 2;

@interface UIAlertController ()

@end


@implementation UIAlertController (XCAdd)

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title
                                 message:(nullable NSString *)message
                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                       cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                  destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                        otherButtonTitle:(nullable NSArray<NSString *> *)otherButtonTitles
                                tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock{
    
    UIAlertController * alertController = [[self class] alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (cancelButtonTitle) {
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(alertController, action, UIAlertControllerBlocksCancelButtonIndex);
            }
        }];
        [alertController addAction:cancelAction];
    }
    if (destructiveButtonTitle) {
        UIAlertAction * destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(alertController, action, UIAlertControllerBlocksDestructiveButtonIndex);
            }
        }];
        [alertController addAction:destructiveAction];
    }
    
    if (otherButtonTitles.count>0) {
        [otherButtonTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIAlertAction * otherAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (tapBlock) {
                    tapBlock(alertController, action, UIAlertControllerBlocksFirstOtherButtonIndex + idx);
                }
            }];
            [alertController addAction:otherAction];
        }];
    }
    
    return alertController;
    
}

#pragma mark - 
#pragma mark other

- (NSInteger)cancelButtonIndex {
    return UIAlertControllerBlocksCancelButtonIndex;
}

- (NSInteger)destructiveButtonIndex {
    return UIAlertControllerBlocksDestructiveButtonIndex;
}

- (NSInteger)firstOtherButtonIndex {
    return UIAlertControllerBlocksFirstOtherButtonIndex;
}



@end
