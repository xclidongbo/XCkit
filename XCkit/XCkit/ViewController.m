//
//  ViewController.m
//  XCkit
//
//  Created by lidongbo on 04/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import "ViewController.h"
//#import "UIButton+XCAdd.h"
//#import "XCCategories.h"

#import "XCkit.h"
#import "UIGestureRecognizer+XCAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(10, 100, 200, 30);
//    [self.view addSubview:btn];
//    [btn setTitle:@"zhangsanzhangsanzhangsanzhangsan" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    @weakify(self);
//    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
//        NSLog(@"%@",btn.titleLabel.text);
//        @strongify(self);
////        [self configureAlertView];
//    }];
//    
//    UIImage * image = [self imageCircleWithColor:[UIColor blueColor]];
//    UIImage * image1 = [self imageCircleWithColor:[UIColor redColor]];
//    UIImage * image2 = [self imageCircleWithColor:[UIColor orangeColor]];
//    
//    [btn setBackgroundImage:image forState:UIControlStateNormal];
//    [btn setBackgroundImage:image1 forState:UIControlStateHighlighted];
//    [btn setBackgroundImage:image2 forState:UIControlStateSelected];
    
    
    UILabel * titleLabel = [[UILabel alloc] init];
    [self.view addSubview:titleLabel];
    titleLabel.frame =CGRectMake(100, 100, 100, 100);
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString * text = [NSMutableAttributedString new];
    [text appendAttributedString:[self attributedStringWithString:@"123123\n点赞" foregroundColor:[UIColor blueColor] font:[UIFont systemFontOfSize:17]]];
//    [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
//    [text appendAttributedString:[self attributedStringWithString:@"zhangsan" foregroundColor:[UIColor blueColor] font:[UIFont systemFontOfSize:17]]];
    titleLabel.attributedText = text;
    titleLabel.userInteractionEnabled = YES;

    [titleLabel tapActionWithBlock:^(UITapGestureRecognizer * _Nonnull sender) {
        NSLog(@"%@: %@",titleLabel.text,sender);
    }];
    
    
    
//    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithActionBlock:^(UIGestureRecognizer * _Nonnull sender) {
//        NSLog(@"1111");
//    }];
//    titleLabel.userInteractionEnabled = YES;
//    [titleLabel addGestureRecognizer:tapGR];
    
    
    
    
}


- (NSMutableAttributedString *)attributedStringWithString:(nullable NSString *)String foregroundColor:(nullable UIColor *)foregroundColor font:(nullable UIFont *)font {
    NSMutableAttributedString * attr = [[NSMutableAttributedString alloc] initWithString:String attributes:@{NSForegroundColorAttributeName:foregroundColor,NSFontAttributeName:font}];
    return attr;
}









- (UIImage *)imageCircleWithColor:(UIColor*)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //线条宽度
    CGContextSetLineWidth(ctx, 0.5);
    //画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 30, 30));
//    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    //渲染
    CGContextStrokePath(ctx);
    //生成图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRelease(ctx);
    //拉伸
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(image.size.height*0.5, image.size.width*0.5, image.size.height*0.5, image.size.width*0.5);
    UIImage * newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}






- (void)configureAlertView {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitle:@[@"zhangsan",@"lisi"] tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        if (buttonIndex == controller.cancelButtonIndex) {
            NSLog(@"0");
        }
        if (buttonIndex == controller.destructiveButtonIndex) {
            NSLog(@"1");
        }
        if (buttonIndex >= controller.firstOtherButtonIndex) {
            NSLog(@"other");
        }
    }];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
