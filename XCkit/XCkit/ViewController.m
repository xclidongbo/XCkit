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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    [btn setTitle:@"zhangsan" forState:UIControlStateNormal];
    @weakify(self);
    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
        NSLog(@"%@",btn.titleLabel.text);
        @strongify(self);
        [self configureAlertView];
    }];
    
    
}

- (void)configureAlertView {
//    UIAlertController * viewController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction * action = [UIAlertAction actionWithTitle:@"action1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //
//    }];
//    
//    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"action2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //
//    }];
//    
//    [viewController addAction:action];
//    [viewController addAction:action2];
//    
//    [self presentViewController:viewController animated:YES completion:^{
//        //
//    }];
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
