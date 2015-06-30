//
//  BaseHttpRequest.h
//  BaiduLibrary
//
//  Created by zhuayi on 14/10/21.
//  Copyright (c) 2014年 zhuayi inc. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "AppMacro.h"

typedef void(^BdRequestSuccess)(id responseObject);
typedef void(^BdRequestFail)(NSError *error);


@interface BaseHttpRequest : AFHTTPRequestOperationManager

+ (NSOperation *) GET: (NSString *) url parameters : (NSDictionary *) parameters success:(BdRequestSuccess)success failure:(BdRequestFail)failure;

/**
 *  post请求
 *
 *  @param url            url地址
 *  @param parameters     普通参数
 *  @param fileParameters 文件参数，默认为nil
 *  @param success        成功
 *  @param failure        失败
 *
 *  @return NSOperation
 */
+ (NSOperation *)POST:(NSString *)url
           parameters:(NSDictionary *)parameters
       fileParameters:(NSDictionary *)fileParameters
              success:(BdRequestSuccess)success
              failure:(BdRequestFail)failure;

/**
 *  设置 cookie
 */
/**
 *  设置 cookie
 *
 *  @param key
 *  @param value
 */
+ (void)setCookie : (NSString * ) key value : (NSString *) value;
@end
