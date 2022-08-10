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
        if (actionBlock) actionBlock(sender);
    }
}


- (void)setRectCorners:(UIRectCorner)rectCorners cornerRadii:(CGSize)cornerRadii {
    CGRect bounds = self.bounds;
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:rectCorners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskPath.CGPath;
    maskLayer.frame = bounds;
    self.layer.mask = maskLayer;
}



- (void)addGradientLayerWithColors:(NSArray *)colors
                         locations:(NSArray <NSNumber *>*)locations
                        startPoint:(CGPoint)startPoint
                          endPoint:(CGPoint)endPoint {
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colors;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.bounds;
//    [self.layer addSublayer: gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)addGradientLayerWithColors:(NSArray <UIColor *>*)colors
                         locations:(NSArray <NSNumber *>*)locations
                         direction:(NSGradientDirectionType)direction{
    NSMutableArray * cls = [NSMutableArray arrayWithCapacity:colors.count];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [cls addObject:(__bridge id)obj.CGColor];
    }];
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = cls;
    gradientLayer.locations = locations;
    CGPoint startPoint;
    CGPoint endPoint;
    switch (direction) {
        case NSGradientDirectionTypeTopToBottom:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1.0);
            break;
        case NSGradientDirectionTypeTopLeftToBottomRight:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1.0, 1.0);
            break;
        default:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1.0, 0);
            break;
    }
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.bounds;
//    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end



@implementation UIView (XCAnimation)


- (void)shakeWithDuration:(NSTimeInterval)duration
   usingSpringWithDamping:(CGFloat)dampingRatio
    initialSpringVelocity:(CGFloat)velocity
               completion:(void (^)(BOOL finished))completion {
    self.transform = CGAffineTransformMakeTranslation(20, 0);
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:completion];
}


- (void)shakeWithCompletion:(void (^)(BOOL finished))completion {
    [self shakeWithDuration:.7 usingSpringWithDamping:.2 initialSpringVelocity:10 completion:completion];
}
@end
