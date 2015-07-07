# BDLibrary

[![CI Status](http://img.shields.io/travis/zhuayi/BDLibrary.svg?style=flat)](https://travis-ci.org/zhuayi/BDLibrary)
[![Version](https://img.shields.io/cocoapods/v/BDLibrary.svg?style=flat)](http://cocoapods.org/pods/BDLibrary)
[![License](https://img.shields.io/cocoapods/l/BDLibrary.svg?style=flat)](http://cocoapods.org/pods/BDLibrary)
[![Platform](https://img.shields.io/cocoapods/p/BDLibrary.svg?style=flat)](http://cocoapods.org/pods/BDLibrary)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BDLibrary is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BDLibrary/Base', :git => 'https://github.com/zhuayi/BDLibrary.git'
```

## Author

zhuayi, 2179942@qq.com

## License

BDLibrary is available under the MIT license. See the LICENSE file for more info.

##Crab平台安装


> BdLibrary集成了 Crash 平台,  

### 申请

> [http://crab.baidu.com/batsdk/](http://crab.baidu.com/batsdk/)


### 安装

```shell
pod 'BDLibrary/Crash', :git => 'https://github.com/zhuayi/BDLibrary.git'
```


### 集成

> 在 ***appdelegate.m*** 里的 ***didFinishLaunchingWithOptions*** 方法里加入以下代码

```objective-c
// crash 收集
[[CrabCrashReport sharedInstance] initCrashReporterWithAppKey:APPkey
AndVersion:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
AndChannel:@"AppStore"];
```



##Mtj平台安装


> 百度移动统计 (Mtj) 是百度为 IOS 平台提供的应用统计工具(以下简称 Mtj)。 该文档提供了对如何使用 SDK 的一个详细说明。,  

### 申请

> [http://mtj.baidu.com/](http://mtj.baidu.com)


### 安装

```shell
pod 'BDLibrary/Mtj', :git => 'https://github.com/zhuayi/BDLibrary.git'
```

### 集成

> 在 ***appdelegate.m*** 里的 ***didFinishLaunchingWithOptions*** 方法里加入以下代码

```objective-c
// Mtj
BaiduMobStat *statTracker = [BaiduMobStat defaultStat];
statTracker.enableExceptionLog = NO;
statTracker.logStrategy = BaiduMobStatLogStrategyAppLaunch;
statTracker.logSendInterval = 1;
statTracker.logSendWifiOnly = YES;
statTracker.sessionResumeInterval = 10;
statTracker.shortAppVersion =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
statTracker.enableDebugOn = YES;
[statTracker startWithAppId:APPKey];
```

