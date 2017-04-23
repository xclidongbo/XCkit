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

@interface ViewController () <UITableViewDataSource,UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@property (weak, nonatomic) IBOutlet UIView *subView;


@end

static NSString * identifiers = @"cell";
@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btn1 setBackgroundImageWithRadius:5 lineWidth:0 strokeColor:nil fillColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.btn1 setBackgroundImageWithRadius:5 lineWidth:0 strokeColor:nil fillColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [self.btn2 setBackgroundImageWithRadius:5 lineWidth:1 strokeColor:[UIColor orangeColor] fillColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self.btn2 setBackgroundImageWithRadius:5 lineWidth:1 strokeColor:[UIColor redColor] fillColor:[UIColor clearColor] forState:UIControlStateHighlighted];
    
    [self.subView setRectCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(100, 100)];
    
    
    
}

- (void)viewDidLoad33 {
    [super viewDidLoad];
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifiers];
    
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 10;
    tableView.estimatedSectionFooterHeight = 10;
    tableView.estimatedSectionHeaderHeight = 10;

    
    [self.view addSubview:tableView];
    
    
    
//    NSTimer * timer1 = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(timer:) userInfo:nil repeats:YES];
//    
////    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
    
    
    
//    CFRunLoopTimerRef timerRef = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent(), kCFAbsoluteTimeIntervalSince1904, 0, 0, ^(CFRunLoopTimerRef timer) {
//        //
//        
//    });
    
    
    
    NSThread * thread = [[NSThread alloc] initWithTarget:self selector:@selector(createRunLoopByCFTimer) object:nil];
    
    [thread start];
    
}

- (void)createRunLoopByCFTimer {
    @autoreleasepool {
        CFRunLoopRef runloop = CFRunLoopGetCurrent();
        
        CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(CFAllocatorGetDefault(), CFAbsoluteTimeGetCurrent(), kCFAbsoluteTimeIntervalSince1904, 0, 0, ^(CFRunLoopTimerRef timer) {
            //
            NSLog(@"123123");
        });
        CFRunLoopAddTimer(runloop, timer, kCFRunLoopCommonModes);
        CFRelease(timer);
        CFRunLoopRun();
    }
}


- (void)createRunLoopByCFObserver {
    
    
//    CFRunLoopRef runloop = [[NSRunLoop currentRunLoop] getCFRunLoop];
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        switch(activity){
            case kCFRunLoopEntry:
                NSLog(@"即将进入loop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timers");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理sources");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入休眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"刚从休眠中唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"即将退出loop");
                break;
            default:
                break;
        }
    });
    
    CFRunLoopAddObserver(runloop, observer, kCFRunLoopDefaultMode);
    CFRelease(observer);
    CFRunLoopRun();
}

- (void)timer:(NSTimer *)sender {
    NSLog(@"=== currentMode: %@",[[NSRunLoop currentRunLoop] currentMode]);
}

#pragma mark - dataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiers forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"row num : %ld",(long)indexPath.row];
    
    return cell;
}





- (void)viewDidLoad22 {
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
    
    
//    NSMutableAttributedString * text = [NSMutableAttributedString new];
//    [text appendAttributedString:[self attributedStringWithString:@"123123\n点赞" foregroundColor:[UIColor blueColor] font:[UIFont systemFontOfSize:17]]];
////    [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
////    [text appendAttributedString:[self attributedStringWithString:@"zhangsan" foregroundColor:[UIColor blueColor] font:[UIFont systemFontOfSize:17]]];
//    titleLabel.attributedText = text;
//    titleLabel.userInteractionEnabled = YES;

    [titleLabel tapActionWithBlock:^(UITapGestureRecognizer * _Nonnull sender) {
        NSLog(@"%@: %@",titleLabel.text,sender);
    }];
    
    titleLabel.text = @"1232131312";
    
    CAGradientLayer * gradient = [CAGradientLayer layer];
//    gradient.frame = CGRectMake(100, 100, 100, 100);
    gradient.frame = titleLabel.frame;
    gradient.colors = [NSArray arrayWithObjects:(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor redColor].CGColor, nil];
    gradient.startPoint = CGPointMake(0.0, 0.0);
    gradient.endPoint = CGPointMake(1.0, 0.0);
//    titleLabel.layer.mask = gradient;
    [self.view.layer addSublayer:gradient];
    
    gradient.mask = titleLabel.layer;

    titleLabel.frame = gradient.bounds;
//    gradient.frame = titleLabel.frame;
    
    
    
    
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
