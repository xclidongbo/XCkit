//
//  ViewController.m
//  XCkit
//
//  Created by lidongbo on 04/11/2016.
//  Copyright © 2016 lidongbo. All rights reserved.
//

#import "ViewController.h"
//#import "UIButton+XCAdd.h"
#import "XCCategories.h"

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
    
    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
        NSLog(@"%@",btn.titleLabel.text);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
