//
//  DeviceUtil.h
//  BaiduLibrary
//
//  Created by Liang on 14/12/22.
//  Copyright (c) 2014年 zhuayi inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDDeviceUtil : NSObject

/**
 *  设备唯一表示符
 */
@property (nonatomic, strong) NSString *deviceUUID;
/**
 *  设备Class 单例模式
 *
 *  @return DeviceUtil
 */
+ (BDDeviceUtil *)mainDevice;
/**
 *  获取UUID
 *
 *  @return string
 */
+ (NSString *)generatUUID;
//获取终端设备信息:
+(NSString *)getDeviceInfoModel;
+(NSString *)getDeviceName;
+(NSString *)getDeviceNameDetail;
+(NSString *)getDeviceSystemVersion;

//获取终端设备系统版本信息:
+(NSString *)getDeviceInfoSystemVersion;

//获取该应用的版本信息:
+(NSString *)getAppName;
+(NSString *)getAppVersion;
+(NSString *)getAppBundleIdentifier;

+(NSString *)getMacAddress;
@end
