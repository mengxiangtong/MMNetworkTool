//
//  ViewController.m
//  MMNetworkTool
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 Mxt. All rights reserved.
//

#import "ViewController.h"
#import "MMNetworkTool/MMNetworkTool.h"


@interface ViewController ()

@end

@implementation ViewController


- (NSString *)GetNowTimes
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    return timeString;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDictionary *parameteiDic=@{@"aid":@"ios",@"auth":@"97d9e4d3e9dfab80321d11df5777a107",@"client_sys":@"ios",@"time":[self GetNowTimes]};
    [MMNetworkTool GET:TOP_URl parameters:parameteiDic success:^(id responseObject) {
        
            NSLog(@"  请求结果 %@ ", responseObject);
        
        
        
        NSArray *data=responseObject[@"data"];
        
        
   
        
    } failure:^(NSError *error) {
        
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
