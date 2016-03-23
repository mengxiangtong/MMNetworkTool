//
//  MMNetworkTool.m
//  MMNetworkTool
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 Mxt. All rights reserved.
//

#import "MMNetworkTool.h"
#import "AFNetworking.h"

static bool checkNetWork;

@implementation MMNetworkTool


/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock) success
    failure:(FailureBlock)failure
{
    
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer.timeoutInterval=30;
   // [SVProgressHUD reveal];
    [mgr.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    
    [mgr GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // AFN请求成功时候调用block
        // 先把请求成功要做的事情，保存到这个代码块
       
            //[SVProgressHUD dismiss];
            success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
            //[SVProgressHUD revealErrorWithStatus:@"请求失败"];
            failure(error);
        
    }];
     
     
 

}


/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)Post:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure
{
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];

    
    [mgr POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // AFN请求成功时候调用block
        // 先把请求成功要做的事情，保存到这个代码块
        
        //[SVProgressHUD dismiss];
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //[SVProgressHUD revealErrorWithStatus:@"请求失败"];
        failure(error);
        
    }];

    


    
    
}
/**
 *  网络检测
 */
+(void)checkNetWork
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                checkNetWork=YES;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                checkNetWork=YES;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
            {
                checkNetWork=NO;
                // [MBProgressHUD showError:@"无网络连接"];
                
            }
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                checkNetWork=NO;
                //[MBProgressHUD showError:@"未知网络"];
                
                NSLog(@"未知网络");
                break;
                
        }
    }];
    // 开始监控
    [mgr startMonitoring];

    
}
/**
 *  网络检测
 */
+(BOOL)reachability
{
    return checkNetWork;
}
- (void)dealloc
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}




@end
