//
//  BaseHttpRequest.m
//  BaiduLibrary
//
//  Created by zhuayi on 14/10/21.
//  Copyright (c) 2014年 zhuayi inc. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "BDDeviceUtil.h"

#define BD_LOGIC_COOKIE @"BdlogicCookie"

@implementation BaseHttpRequest

+ (NSString*)getMachine
{
//    size_t size;
//    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
//    char *name = malloc(size);
//    sysctlbyname("hw.machine", name, &size, NULL, 0);
//    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
//    free(name);
// 
//    return machine;
    return @"";
}

+ (NSMutableDictionary *)requestDeviceParameters
{
    NSMutableDictionary * deviceData = [NSMutableDictionary  dictionary];
    
    [deviceData setObject:APP_VERSION forKey:@"app_version"];
    [deviceData setObject:CurrentSystemVersion forKey:@"os_version"];
    [deviceData setObject:CurrentLanguage forKey:@"language"];
    [deviceData setObject:[BDDeviceUtil mainDevice].deviceUUID forKey:@"device_id"];
    //[deviceData setObject:[BaseHttpRequest getMachine] forKey:@"device_name"];
    [deviceData setObject:@"ios" forKey:@"plat"];
    return deviceData;
}

+ (NSOperation *) GET: (NSString *) url parameters : (NSDictionary *) parameters success:(BdRequestSuccess)success failure:(BdRequestFail)failure
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary * data = [self requestDeviceParameters];
    [data addEntriesFromDictionary:parameters];
    
    // 写入cookie modify by renxin 2015/1/7
    [BaseHttpRequest setAppCookie];
    
    AFHTTPRequestOperation *operation = [manager GET:url parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if ([[responseObject objectForKey:@"error"] intValue] == 0) {
            success(responseObject);
//        }
//        else {
//            NSError *myError = [NSError errorWithDomain:@"数据异常" code:0 userInfo:nil];
//            failure(myError);
//        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
    
    NSLog(@"requestUrl === %@",operation.request.URL.absoluteString);
    return operation;
}

+ (NSOperation *)POST:(NSString *)url
           parameters:(NSDictionary *)parameters
       fileParameters:(NSDictionary *)fileParameters
              success:(BdRequestSuccess)success
              failure:(BdRequestFail)failure {
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary * data = [self requestDeviceParameters];
    [data addEntriesFromDictionary:parameters];
    
    [BaseHttpRequest setAppCookie];
    
    AFHTTPRequestOperation *operation = [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        if (fileParameters) {
            NSData *data = [fileParameters objectForKey:@"file"];
            NSString *fileName = @"";
            if (data) {
                if ([fileParameters objectForKey:@"fileName"]) {
                    fileName = [fileParameters objectForKey:@"fileName"];
                }
                [formData appendPartWithFileData:data name:fileName fileName:fileName mimeType:@"image/jpg/file"];
            }
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([[responseObject objectForKey:@"error"] intValue] == 0) {
            success(responseObject);
        } else {
            failure([responseObject objectForKey:@"errMsg"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
    return operation;
}

/**
 *  设置  公共 cookie
 */
+ (void)setAppCookie
{
    // 逻辑 cookie
    NSMutableDictionary *logicCookie = [NSMutableDictionary dictionaryWithCapacity:0]; //[[NSUserDefaults standardUserDefaults] objectForKey:BD_LOGIC_COOKIE];
    [logicCookie setObject:APP_VERSION forKey:@"app_version"];
    [logicCookie setObject:CurrentSystemVersion forKey:@"os_version"];
    [logicCookie setObject:CurrentLanguage forKey:@"language"];
    [logicCookie setObject:[BDDeviceUtil mainDevice].deviceUUID forKey:@"device_id"];
    [logicCookie setObject:@"ios" forKey:@"plat"];
 
    for (NSString * key in logicCookie)
    {
        [BaseHttpRequest  setCookie:key value:[logicCookie objectForKey:key]];
    }
}


/**
 *  设置 cookie
 *
 *  @param key
 *  @param value
 */
+ (void)setCookie : (NSString * ) key value : (NSString *) value
{
    NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
    [cookieDic setObject:@".baidu.com" forKey:NSHTTPCookieDomain];
    [cookieDic setObject:@"/" forKey:NSHTTPCookiePath];
    [cookieDic setObject:@"0" forKey:NSHTTPCookieVersion];
    [cookieDic setValue:[NSDate dateWithTimeIntervalSinceNow:86400*356] forKey:NSHTTPCookieExpires];
    
    [cookieDic setObject:key forKey:NSHTTPCookieName];
    [cookieDic setValue:value forKey:NSHTTPCookieValue];
    
    NSHTTPCookie *cookieuser = [NSHTTPCookie cookieWithProperties:cookieDic];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookieuser];
}

@end
