//
//  DeviceUtil.m
//  BaiduLibrary
//
//  Created by Liang on 14/12/22.
//  Copyright (c) 2014年 zhuayi inc. All rights reserved.
//

#import "BDDeviceUtil.h"

#import "sys/utsname.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <UIKit/UIKit.h>
static BDDeviceUtil *share = nil;
@implementation BDDeviceUtil

/**
 *  设备Class 单例模式
 *
 *  @return DeviceUtil
 */
+ (BDDeviceUtil *)mainDevice
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        share = [[BDDeviceUtil alloc] init];
        
    });
    
    return share;
}

- (NSString *)deviceUUID
{
    if (!_deviceUUID) {
        return  @"";
    }
    return _deviceUUID;
}
/**
 *  获取UUID
 *
 *  @return string
 */
+ (NSString *)generatUUID
{
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
//***(1) 获取终端设备信息:
+(NSString *)getDeviceInfoModel
{
    //NSString *deviceName = [[UIDevice currentDevice] name];
    NSString *deviceModel = [[UIDevice currentDevice] model];
    //NSString *deviceLocalizedModel = [[UIDevice currentDevice] localizedModel];
    //NSString *deviceSystemName = [[UIDevice currentDevice] systemName];
    //NSString *deviceSystemVersion = [[UIDevice currentDevice] systemVersion];
    
    return deviceModel;
}

+(NSString *)getDeviceName
{
    NSString *deviceLocalizedModel = [[UIDevice currentDevice] localizedModel];
    return deviceLocalizedModel;
}

+(NSString *)getDeviceNameDetail
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *devicename_detail = [self process:deviceString];
    
    return devicename_detail;
}

+(NSString *)process:(NSString *)str_in
{
    NSString *str_out = @"ios device";
    if([str_in isEqualToString:@"i386"] || [str_in isEqualToString:@"x86_64"])
    {
        str_out = @"iPhone Simulator";
    }
    else if([str_in isEqualToString:@"iPod1,1"])
    {
        str_out = @"iPod touch";
    }
    else if([str_in isEqualToString:@"iPod2,1"])
    {
        str_out = @"iPod touch 2";
    }
    else if([str_in isEqualToString:@"iPod3,1"])
    {
        str_out = @"iPod touch 3";
    }
    else if([str_in isEqualToString:@"iPod4,1"])
    {
        str_out = @"iPod touch 4";
    }
    else if([str_in isEqualToString:@"iPod5,1"])
    {
        str_out = @"iPod touch 5";
    }
    else if([str_in isEqualToString:@"iPad1,1"])
    {
        str_out = @"iPad 1";
    }
    else if([str_in isEqualToString:@"iPad2,1"])
    {
        str_out = @"iPad 2(Wifi)";
    }
    else if([str_in isEqualToString:@"iPad2,2"])
    {
        str_out = @"iPad 2(GSM)";
    }
    else if([str_in isEqualToString:@"iPad2,3"])
    {
        str_out = @"iPad 2(CDMA)";
    }
    else if([str_in isEqualToString:@"iPad2,4"])
    {
        str_out = @"iPad 2(32nm)";
    }
    else if([str_in isEqualToString:@"iPad2,5"])
    {
        str_out = @"iPad mini(Wifi)";
    }
    else if([str_in isEqualToString:@"iPad2,6"])
    {
        str_out = @"iPad mini(GSM)";
    }
    else if([str_in isEqualToString:@"iPad2,7"])
    {
        str_out = @"iPad mini(CDMA)";
    }
    else if([str_in isEqualToString:@"iPad3,1"])
    {
        str_out = @"iPad 3(Wifi)";
    }
    else if([str_in isEqualToString:@"iPad3,2"])
    {
        str_out = @"iPad 3(CDMA)";
    }
    else if([str_in isEqualToString:@"iPad3,3"])
    {
        str_out = @"iPad 3(4G)";
    }
    else if([str_in isEqualToString:@"iPad3,4"])
    {
        str_out = @"iPad 4(Wifi)";
    }
    else if([str_in isEqualToString:@"iPad3,5"])
    {
        str_out = @"iPad 4(4G)";
    }
    else if([str_in isEqualToString:@"iPad3,6"])
    {
        str_out = @"iPad 4(CDMA)";
    }
    else if([str_in isEqualToString:@"iPad4,1"])
    {
        str_out = @"iPad Air (Wifi)";
    }
    else if([str_in isEqualToString:@"iPad4,2"])
    {
        str_out = @"iPad Air (Cellular)";
    }
    else if([str_in isEqualToString:@"iPad4,4"])
    {
        str_out = @"iPad mini (Wifi)";
    }
    else if([str_in isEqualToString:@"iPad4,5"])
    {
        str_out = @"iPad mini (Cellular)";
    }
    else if([str_in isEqualToString:@"iPhone1,1"])
    {
        str_out = @"iPhone";
    }
    else if([str_in isEqualToString:@"iPhone1,2"])
    {
        str_out = @"iPhone 3G";
    }
    else if([str_in isEqualToString:@"iPhone2,1"])
    {
        str_out = @"iPhone 3GS";
    }
    else if([str_in isEqualToString:@"iPhone3,1"])
    {
        str_out = @"iPhone 4(ChinaMobile,ChinaUnicom)";
    }
    else if([str_in isEqualToString:@"iPhone3,2"])
    {
        str_out = @"iPhone 4(ChinaUnicom)";
    }
    else if([str_in isEqualToString:@"iPhone3,3"])
    {
        str_out = @"iPhone 4(ChinaTelecom)";
    }
    else if([str_in isEqualToString:@"iPhone4,1"])
    {
        str_out = @"iPhone 4S";
    }
    else if([str_in isEqualToString:@"iPhone5,1"])
    {
        str_out = @"iPhone 5(ChinaMobile,ChinaUnicom)";
    }
    else if([str_in isEqualToString:@"iPhone5,2"])
    {
        str_out = @"iPhone 5(ChinaMobile,ChinaTelecom,ChinaUnicom)";
    }
    else if([str_in isEqualToString:@"iPhone6,1"])
    {
        str_out = @"iPhone 5s";
    }
    else if([str_in isEqualToString:@"iPhone6,2"])
    {
        str_out = @"iPhone 5s";
    }
    else if([str_in isEqualToString:@"iPhone6,3"])
    {
        str_out = @"iPhone 5c";
    }
    else if([str_in isEqualToString:@"iPhone6,4"])
    {
        str_out = @"iPhone 5c";
    }
    else
    {
        str_out = str_in;
    }
    
    return str_out;
}

+(NSString *)getDeviceSystemVersion
{
    NSString *deviceSystemVersion = [[UIDevice currentDevice] systemVersion];
    return deviceSystemVersion;
}

+(NSString *)getAppName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return appName;
}

+(NSString *)getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersionShort = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return appVersionShort;
}

+ (NSString *)getAppBundleIdentifier
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+(NSString *)getDeviceInfoSystemVersion
{
    
    NSString *deviceSystemVersion = [[UIDevice currentDevice] systemVersion];
    return deviceSystemVersion;
}

+ (NSString *)getMacAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        //BFLog("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        //BFLog("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        //BFLog("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        //BFLog("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%X:%X:%X:%X:%X:%X",*ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}
@end
