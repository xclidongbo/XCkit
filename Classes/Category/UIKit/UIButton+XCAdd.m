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

#pragma mark - controlEvent Block

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)actionBlock {
    objc_setAssociatedObject(self, &btnKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvent];
}

- (void)callActionBlock:(UIButton *)sender {
    ActionBlock block = objc_getAssociatedObject(self, &btnKey);
    if (block) block(sender);
}


#pragma mark - 设置图片文字的位置

- (void)setImageTextPostionWithTitle:(NSString * _Nullable)title
                               image:(UIImage * _Nullable)image
                                 gap:(CGFloat)gap
                        positionType:(UIImageTextPositionType)positionType {
    
    if (title) [self setTitle:title forState:UIControlStateNormal];
    if (image) [self setImage:image forState:UIControlStateNormal];
    [self layoutIfNeeded];
    
    CGFloat titleWidth = CGRectGetWidth(self.titleLabel.bounds);
    CGFloat titleHeight = CGRectGetHeight(self.titleLabel.bounds);
    
    CGFloat imageWidth = CGRectGetWidth(self.imageView.bounds);
    CGFloat imageHeight = CGRectGetHeight(self.imageView.bounds);
    
    if (positionType == UIImageTextPositionTypeLeft) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0, (titleWidth+gap/2), 0,-(titleWidth+gap/2));
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth+gap/2), 0, imageWidth+gap/2);
        self.contentEdgeInsets = UIEdgeInsetsMake(0, gap/2, 0, gap/2);
    } else if (positionType == UIImageTextPositionTypeRight) {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, gap, 0, -gap);
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, gap);
    }else if (positionType == UIImageTextPositionTypeBottom) {
        if (titleWidth>=imageWidth) {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, (titleWidth/2-imageWidth/2), titleHeight+gap/2, -(titleWidth/2-imageWidth/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(imageHeight+gap/2, -(imageWidth), 0, imageWidth);
            self.contentEdgeInsets = UIEdgeInsetsMake(gap/2, 0, gap/2, -imageWidth);
            
        } else {
            /*
             //为什么会有偏差?
             self.titleEdgeInsets = UIEdgeInsetsMake(imageHeight/2, -imageWidth/2-titleWidth/2, -imageHeight/2, imageWidth/2+titleWidth/2);
             */
            self.imageEdgeInsets = UIEdgeInsetsMake(-titleHeight/2-gap/2, 0, titleHeight/2+gap/2, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(imageHeight/2+gap/2, -imageWidth/2-titleWidth/2, -imageHeight/2-gap/2, imageWidth/2+titleWidth/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(titleHeight/2+gap/2, 0, titleHeight/2+gap/2, -titleWidth);
        }
        
    }
    
}

#pragma mark - 实心和空心的圆角矩形,矩形button

- (UIImage *)imageWithRadius:(CGFloat)radius
                   lineWidth:(CGFloat)lineWidth
                 strokeColor:(UIColor * _Nullable)strokeColor
                   fillColor:(UIColor *)fillColor  {
    
    //    [self.view layoutIfNeeded];
    CGRect bounds = self.bounds;
//    CGFloat lineWidth = 1.0f;
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(bounds, lineWidth, lineWidth) cornerRadius:radius];
    bezierPath.lineWidth = lineWidth;
    [bezierPath closePath];
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, 0.0); //size of the image, opaque, and scale (set to screen default with 0)
    if (strokeColor) {
        [strokeColor setStroke];
        [bezierPath stroke];
    }
    [fillColor setFill];
    [bezierPath fill];

    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setBackgroundImageWithRadius:(CGFloat)radius
                           lineWidth:(CGFloat)lineWidth
                         strokeColor:(UIColor *_Nullable)strokeColor
                           fillColor:(UIColor *)fillColor
                            forState:(UIControlState)state {
    UIImage * image = [self imageWithRadius:radius lineWidth:lineWidth strokeColor:strokeColor fillColor:fillColor];
    [self setBackgroundImage:image forState:state];
}





@end
