//
//  ViewController.m
//  moviePlayer
//
//  Created by Christian on 16/6/11.
//  Copyright © 2016年 slq. All rights reserved.
//

#import "ViewController.h"
#import "PlayerViewContrller.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 64, 80, 80);
    [self.view addSubview:btn];
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
//    [self playVideo];

}
- (void)playVideo {
     NSURL *url = [[NSBundle mainBundle] URLForResource:@"hubblecast" withExtension:@"m4v"];
    PlayerViewContrller *vc = [[PlayerViewContrller alloc] initWithUrl:url];

    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
