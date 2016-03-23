//
//  MMNetworkTool.h
//  MMNetworkTool
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 Mxt. All rights reserved.
//

#import <Foundation/Foundation.h>



#define CHANEL_URl @"http://www.douyutv.com/api/v1/channel?aid=ios&auth=6a4c6b01d851ceece76aee1980b9e5bb&client_sys=ios&limit=4&time="

#define first_URL @"http://www.douyutv.com/api/v1/getCyclePicture?aid=ios&client_sys=ios&auth=e4b6593bc6962292d21146ae6920856c&time="
#define TOP_URl @"http://www.douyutv.com/api/v1/slide/6"
#define liveListURL @"http://www.douyutv.com/api/v1/live?aid=ios&auth=b317487532542c2f8200f374f3153da2&client_sys=ios&limit=20"


typedef  void (^SuccessBlock)(id responseObject);
typedef  void (^FailureBlock)(NSError *error);


@interface MMNetworkTool : NSObject

/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock) success
    failure:(FailureBlock)failure;


/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)Post:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;
/**
 *  网络检测
 */
+(void)checkNetWork;
/**
 *  网络检测
 */
+(BOOL)reachability;

@end
