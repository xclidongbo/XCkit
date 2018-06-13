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
    
    [self layoutIfNeeded];
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

- (UIImage *)imageWithGradientRoundRectRadius:(CGFloat)radius colors:(NSArray <UIColor *>*)colors locations:(NSArray *)locations{
    
    [self layoutIfNeeded];
    //创建CGContextRef
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制Path
    CGPathAddRoundedRect(path, nil, self.bounds, radius, radius);
    CGPathCloseSubpath(path);
    
    
    //以下为绘制渐变的方法
    //线性渐变
//    UIColor * startColor = [UIColor redColor];
//    UIColor * endColor = [UIColor blueColor];
    
    NSMutableArray * cls = [NSMutableArray arrayWithCapacity:colors.count];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [cls addObject:(__bridge id)obj.CGColor];
    }];
    
    CGFloat locs[] = {};
    for (int i = 0; i < locations.count; i++) {
        NSNumber * num =locations[i];
        locs[i] = num.floatValue;
    }
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat locations[] = { 0.0, 1.0 };
    
//    NSArray * colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    
    
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)cls, locs);
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    //以上
    
    //释放
    CGPathRelease(path);
    //从Context中获取图像.并显示再界面上.
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)setBackgroundImageWithRadius:(CGFloat)radius
                           lineWidth:(CGFloat)lineWidth
                         strokeColor:(UIColor *_Nullable)strokeColor
                           fillColor:(UIColor *)fillColor
                            forState:(UIControlState)state {
    UIImage * image = [self imageWithRadius:radius lineWidth:lineWidth strokeColor:strokeColor fillColor:fillColor];
    [self setBackgroundImage:image forState:state];
}


- (void)setBackgroundImageWithGradientCornerRadius:(CGFloat)radius
                                            colors:(NSArray <UIColor *>*)colors
                                         locations:(NSArray *)locations
                                          forState:(UIControlState)state {
    UIImage * image = [self imageWithGradientRoundRectRadius:radius colors:colors locations:locations];
    [self setBackgroundImage:image forState:state];
}









@end
