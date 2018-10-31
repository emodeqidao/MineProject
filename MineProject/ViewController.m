//
//  ViewController.m
//  MineProject
//
//  Created by xixi on 2018/10/31.
//  Copyright © 2018年 xixi. All rights reserved.
//

#import "ViewController.h"
#import "MineViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 60, 100, 40);
    btn.backgroundColor = [UIColor purpleColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void) btnAction
{
    MineViewController *vc = [[MineViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
